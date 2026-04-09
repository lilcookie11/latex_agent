# Paper Workspace

This directory is the local source of truth for writing with Codex.

Recommended workflow:

1. Write and revise locally in this repository.
2. Compile locally with `make pdf`.
3. Push to GitHub for versioned collaboration.
4. Push to Overleaf only as a shared writing mirror.
5. Use Prism only through manual import/export `.zip` files.

Do not treat `GitHub`, `Overleaf`, and `Prism` as three equal writable sources. Pick this local repository as the canonical source and sync outward from here.

## Layout

- `main.tex`: main entry point
- `sections/`: section files
- `figures/`: paper figures
- `notes/`: prompts, TODOs, review notes
- `scripts/`: sync and export helpers
- `build/`: local compile artifacts

## First-time setup

Initialize the repository and branch:

```bash
cd /Users/lilcookie/Documents/作业2/paper
git init -b main
git add .
git commit -m "Initial paper workspace"
```

If Git asks for your identity, set it first:

```bash
git config user.name "Your Name"
git config user.email "you@example.com"
```

Configure remotes:

```bash
./scripts/setup-remotes.sh <github-url> <overleaf-url>
```

Examples:

```bash
./scripts/setup-remotes.sh git@github.com:USER/REPO.git https://git.overleaf.com/PROJECT_ID
./scripts/setup-remotes.sh git@github.com:USER/REPO.git
./scripts/setup-remotes.sh "" https://git.overleaf.com/PROJECT_ID
```

## Daily workflow

Build:

```bash
make pdf
```

Push to GitHub:

```bash
./scripts/push-github.sh
```

Push to Overleaf:

```bash
./scripts/push-overleaf.sh
```

Pull from Overleaf before local edits if collaborators changed the online project:

```bash
./scripts/pull-overleaf.sh
```

Export a `.zip` for Prism import:

```bash
./scripts/export-prism-zip.sh
```

## Collaboration rules

- Local repo is canonical.
- GitHub is the review and history layer.
- Overleaf is the online collaboration mirror.
- Prism is manual import/export only.
- Avoid editing the same section concurrently in local Git and Overleaf.

