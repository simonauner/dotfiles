---
name: pr-screenshots
description: Show screenshots (before/after images, UI changes) in a pull request created with gh, without committing them to the PR branch. Use whenever a PR description should contain images and the PR is opened from the CLI.
---

# Screenshots in pull requests from the CLI

`gh` cannot upload attachments the way dragging an image into GitHub's web editor does. Instead, put the images on a separate branch that contains nothing else and link to them from the PR description. The PR branch, the default branch and the working tree stay untouched.

## Steps

1. Take the screenshots into a scratch directory outside the repository, with synthetic data only. For before/after, take both with the same data, viewport and theme, and take the before images before editing. Combining each pair side by side into one image (with "Before"/"After" labels) makes the PR easier to read.
2. Publish them with the script, run from the repository:

   ```bash
   ~/.codex/skills/pr-screenshots/scripts/push-pr-images.sh <image-dir> pr-assets/<pr-topic>
   ```

   It creates a commit without parents that contains only the images (in a folder named after the last part of the branch), pushes it to `pr-assets/<pr-topic>` on `origin` and prints one Markdown image line per file. Set `DRY_RUN=1` to build the commit and print the lines without pushing. Running it again for the same branch replaces the images (the branch is force-updated; it is never the PR branch).
3. Paste the printed lines into the PR description, for example one `<details><summary>View</summary>` block per image so long screenshots stay folded. Then create or edit the PR with `gh pr create --body-file` or `gh pr edit --body-file`.

## Rules and pitfalls

- Never commit the images to the PR branch or the default branch, and never stash or switch branches to make the asset commit; the script uses a temporary index.
- Only synthetic or otherwise publishable content: the images are visible to everyone who can read the repository, and stay in its history until the branch is deleted.
- In a private repository the images only show for signed-in users with read access; that is expected.
- The images live only as long as the branch. Mention in the PR (or to the user) that `pr-assets/<pr-topic>` can be deleted only after the images have been moved into the description by dragging them into GitHub's web editor, which stores them as attachments; deleting the branch first breaks the images.
- In zsh, write `${commit}:refs/heads/…`, not `$commit:refs/…`: `:r` is a zsh modifier and silently cuts the variable. The script already handles this.
- Follow the repository's own rules for whether pushing is allowed at all (for example review steps before a push); this skill does not authorize a push the user has not asked for.
