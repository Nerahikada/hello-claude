# hello-claude

A simple container to say "hello" to Claude Code

## Usage

Simple hello world:

```bash
docker run --rm ghcr.io/nerahikada/hello-claude
```

If you want to just use Claude Code:

```bash
docker run -it --rm ghcr.io/nerahikada/hello-claude claude
```

Use Claude Code with your credentials:

```bash
docker run --rm -v ~/.claude/.credentials.json:/root/.claude/.credentials.json ghcr.io/nerahikada/hello-claude
```

## Hints

* To skip Claude Code CLI onboarding, set `"hasCompletedOnboarding": true` in `~/.claude.json`.
