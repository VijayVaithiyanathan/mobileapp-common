# mobileapp-common

Shared, non-code files (setup guides, notes, .cmd scripts) for Vijay's mobile apps:
FinanceTracker, Baro Stay and future projects. No app source code lives here.

## Contents
- `docs/GDRIVE_SETUP.md` - one-time Google Drive OAuth Client ID setup for Drive backup/sync.

## Reuse in a project
Option 1 - clone next to the project (simplest):

    cd D:\mobileapp
    git clone https://github.com/VijayVaithiyanathan/mobileapp-common.git

Option 2 - add as a git submodule inside a project:

    git submodule add https://github.com/VijayVaithiyanathan/mobileapp-common.git common
    git submodule update --remote common   (to pull later changes)

Web projects use the sibling repo `webapp-common` the same way.
