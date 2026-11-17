# mobileapp-common

Shared, non-code files (setup guides, notes, .cmd scripts) for Vijay's mobile apps:
FinanceTracker, Baro Stay and future projects. No app source code lives here.

## Contents
- `agents/code-improver.md` - generic Claude Code agent (readability / performance suggestions), usable in any project.
- `scripts/organize-prompts.cmd` - sorts agent prompts into `barostay-prompts`, `financetracker-prompts` and this repo.

Project-specific prompts live in their own repos: `barostay-prompts`, `financetracker-prompts`.

## Reuse in a project
Option 1 - clone next to the project (simplest):

    cd D:\mobileapp
    git clone https://github.com/VijayVaithiyanathan/mobileapp-common.git

Option 2 - add as a git submodule inside a project:

    git submodule add https://github.com/VijayVaithiyanathan/mobileapp-common.git common
    git submodule update --remote common   (to pull later changes)

Web projects use the sibling repo `webapp-common` the same way.
