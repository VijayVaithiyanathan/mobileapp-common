@echo off
rem Sorts Claude agent prompts into one repo per project:
rem   barostay-prompts       - Baro Stay agents (from D:\claude\agents)
rem   financetracker-prompts - FinanceTracker agents (from FinanceTracker\.claude\agents)
rem   mobileapp-common       - generic agents usable by any project
rem Files are COPIED (originals stay where projects use them). Safe to re-run.

set ROOT=D:\mobileapp
set SRC=D:\claude\agents
set BARO=%ROOT%\barostay-prompts
set FIN=%ROOT%\financetracker-prompts
set COMMON=%ROOT%\mobileapp-common

for %%R in ("%BARO%" "%FIN%") do (
  if not exist "%%~R" mkdir "%%~R"
  if not exist "%%~R\.git" git -C "%%~R" init -b main
)
for %%R in ("%BARO%" "%FIN%" "%COMMON%") do (
  if not exist "%%~R\agents" mkdir "%%~R\agents"
)

rem --- Baro Stay agents ---
for %%F in (db-migration-review performance-check release-check security-check test-writer ui-consistency) do (
  if exist "%SRC%\%%F.md" copy /y "%SRC%\%%F.md" "%BARO%\agents\" >nul
)

rem --- FinanceTracker agents ---
for %%F in (fintracker-storage-review fintracker-ui-review) do (
  if exist "%ROOT%\FinanceTracker\.claude\agents\%%F.md" copy /y "%ROOT%\FinanceTracker\.claude\agents\%%F.md" "%FIN%\agents\" >nul
)

rem --- Generic agents ---
if exist "%SRC%\code-improver.md" copy /y "%SRC%\code-improver.md" "%COMMON%\agents\" >nul

rem --- GDRIVE_SETUP.md belongs to FinanceTracker, not the common repo ---
if exist "%COMMON%\docs\GDRIVE_SETUP.md" (
  if not exist "%ROOT%\FinanceTracker\docs\GDRIVE_SETUP.md" copy /y "%COMMON%\docs\GDRIVE_SETUP.md" "%ROOT%\FinanceTracker\docs\" >nul
  git -C "%COMMON%" rm -q docs/GDRIVE_SETUP.md
)

echo Done.
