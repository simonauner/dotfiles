#!/usr/bin/env bash
# Publish images to a branch of their own (no parents, nothing else in it) and print Markdown lines for a PR description.
# Usage: push-pr-images.sh <image-dir> <branch, e.g. pr-assets/my-topic>   (DRY_RUN=1 to skip the push)
set -euo pipefail

dir=${1:?image directory}
branch=${2:?branch name, e.g. pr-assets/my-topic}
case "$branch" in pr-assets/*) ;; *) echo "Use a branch under pr-assets/, never the PR branch." >&2; exit 1 ;; esac

folder=${branch##*/}
index=$(mktemp)
trap 'rm -f "$index"' EXIT

# A temporary index: the working tree, the real index and the checked-out branch are left alone.
export GIT_INDEX_FILE=$index
git read-tree --empty
shopt -s nullglob nocaseglob
files=("$dir"/*.{png,jpg,jpeg,gif,webp})
[ ${#files[@]} -gt 0 ] || { echo "No images in $dir" >&2; exit 1; }
for file in "${files[@]}"; do
  git update-index --add --cacheinfo "100644,$(git hash-object -w "$file"),$folder/$(basename "$file")"
done
commit=$(git commit-tree "$(git write-tree)" -m "Screenshots for the pull request ($folder)")
unset GIT_INDEX_FILE

remote=$(git remote get-url origin)
repo=$(printf '%s\n' "$remote" | sed -E 's#^(git@|https://)([^/:]+)[:/]##; s#\.git$##')
host=$(printf '%s\n' "$remote" | sed -E 's#^(git@|https://)([^/:]+)[:/].*#\2#')

if [ "${DRY_RUN:-0}" = 1 ]; then
  echo "Dry run: built $commit, not pushed." >&2
else
  # Force is safe here: the branch only ever holds these generated image commits.
  git push --force origin "${commit}:refs/heads/${branch}" >&2
fi

for file in "${files[@]}"; do
  name=$(basename "$file")
  echo "![${name%.*}](https://${host}/${repo}/blob/${branch}/${folder}/${name}?raw=true)"
done
