## Language

Code, identifiers, comments, docs, READMEs and commit messages are always in
English, even when the UI text is in another language. Chat may be in Swedish.

## Working With Me

- "Can you find out why X" is an investigation: answer it and propose a fix,
  but don't open a fix PR unless asked.
- Files that change during a session are my own deliberate edits (I often edit
  the same checkout in another editor). Never revert them; build on them.
- Stay silent on PR or CI events that need no action, such as "review in
  progress" placeholders.

## Git

- Start new work from a freshly fetched main. Bring branches up to date by
  rebasing, never with merge commits, and rebase onto `origin/main` right before
  pushing or opening a PR.
- Structure a PR as self-contained commits in the order a reviewer should read
  them (e.g. refactor → data → behaviour → UI), with no add-then-remove history.
- When fixing a bug, including from review comments, that the branch's own
  commits introduced, fold the fix into the commit that introduced it instead
  of adding a "fix review" commit. Without interactive rebase: `git reset
  --soft` to before the branch, unstage, re-commit in the original order with
  the fix in the right commit, check that `git diff <old-tip> HEAD` is empty,
  then force-push. Only on a feature branch under review, never on merged or
  shared history.
- Never rebuild commits with `git read-tree --reset`: it silently reverts every
  file the branch does not touch.

## Pull Requests

- After opening or updating a PR, check its CI checks and review comments
  without being asked, and always give a link to the PR.
- End every PR comment I have Claude post (review replies, thread comments,
  general comments) with a line of its own: `— posted by Claude on behalf of
  Simon Aunér`.

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

## Local Environment

- Stop a process by its PID, port or working directory (check with `lsof`),
  never by a name pattern: other checkouts and worktrees run the same command.
- When a session is done, remove the Docker containers and volumes it started
  for its dev or test environment.

## Code

- No re-exports to keep callers unchanged. When a symbol moves, update every
  importer to the real source and delete modules left empty.
