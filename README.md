# git-setup

Reusable Git aliases and best‑practice settings with one‑time import scripts.

## Quick start

- Windows (PowerShell):

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
./scripts/import-git-aliases.ps1
```

- macOS/Linux (Bash):

```bash
bash ./scripts/import-git-aliases.sh
```

These scripts will copy the repo's `git/aliases.gitconfig` to your `~/.config/git/aliases.gitconfig` and include it from your global Git config. Safe to re‑run; they won't duplicate include entries.

## What's included

The included config provides:

- Opinionated, safe defaults (fast‑forward merges, prune on fetch, autosquash, update refs when rebasing, etc.)
- A rich set of aliases for everyday work
- A branch lister showing each branch's last commit time and message

After importing, open your global config to verify:

```bash
git config --global --list --show-origin | grep aliases.gitconfig || true
```

## Notable aliases

- `st`: short status (`git status -sb`)
- `lg`: graph log with refs and relative dates
- `brlast`: list local branches with last commit time, author, and subject
  - Example:

```bash
git brlast
# 2 hours ago   Jane Doe   feature/xyz   Add endpoint and tests
# 3 days ago    John Smith main          Bump dependencies
```
- `co`/`sw`/`nb`: checkout, switch, and new branch helpers
- `amend`: amend last commit without changing message
- `fix`/`squash`: create fixup/squash commits against HEAD~1
- `unstage`: unstage paths (`git restore --staged`)
- `wip`/`unwip`: quick WIP stash helpers

Run `git config --global -e` anytime to tweak or extend the aliases.

## Uninstall

1) Remove the include from your global config:

```bash
git config --global --unset-all include.path ~/.config/git/aliases.gitconfig || true
```

2) Optionally delete the copied file:

```bash
rm -f ~/.config/git/aliases.gitconfig
```

Set up basic git aliases 
