## Pull Request Descriptions

When creating a PR, include a per-commit breakdown in the description. For each
commit, add a bullet with the commit message as the heading and the reason as a
sub-bullet or inline note. Example:

- chore: add verify script
  - Lets agents validate fixes and catch issues without manual steps.

## Screenshots in Pull Requests

When a PR created with `gh` should show images (before/after, UI changes), use
the `pr-screenshots` skill: the images go on a separate `pr-assets/<topic>` branch
and the description links to them. Never commit screenshots to the PR branch.
