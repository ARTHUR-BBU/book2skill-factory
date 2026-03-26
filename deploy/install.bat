@echo off
################################################################################
# Book2Skill Factory - Auto-Deployment Script for Windows
################################################################################
# This script automates the deployment of a Claude Code plugin package.
#
# Usage:
#   install.bat
#
# Supported platforms: Windows (PowerShell, CMD)
################################################################################

setlocal enabledelayedexpansion

################################################################################
# Configuration
################################################################################

REM Get plugin name from parent directory
for %%i in ("%~dp0..") do set PLUGIN_NAME=%%~nxi

REM Set target directory
set TARGET_DIR=%USERPROFILE%\.claude\skills\%PLUGIN_NAME%

REM Set source directory
set SOURCE_DIR=%~dp0..

################################################################################
# Installation
################################################################################

echo.
echo ================================================================================
echo   Book2Skill Factory - Deployment Script (Windows)
echo ================================================================================
echo.
echo   Plugin: %PLUGIN_NAME%
echo   Target: %TARGET_DIR%
echo.

REM Pre-flight check
if not exist "%SOURCE_DIR%\skills" if not exist "%SOURCE_DIR%\references" (
    echo   [ERROR] Invalid plugin directory
     echo   Expected to find skills\ or references\ in parent directory
     echo   Current source: %SOURCE_DIR%
     pause
     exit /b 1
)

REM Check if already installed
if exist "%TARGET_DIR%" (
     echo   [WARNING] Plugin already installed at %TARGET_DIR%
     set /p OVERWRITE="Do you want to overwrite? (y/N): "
     if /i not "!OVERWRITE!"=="y" (
         echo   [CANCELLED] Installation cancelled
         pause
         exit /b 0
     )
     echo   [INFO] Removing existing installation...
     rmdir /s /q "%TARGET_DIR%"
)

REM Create target directory
echo   [INFO] Creating target directory...
mkdir "%TARGET_DIR%"
echo   [SUCCESS] Directory created: %TARGET_DIR%

REM Copy skills
if exist "%SOURCE_DIR%\skills" (
     echo   [INFO] Copying skills...
     xcopy /E /I /Y "%SOURCE_DIR%\skills\*" "%TARGET_DIR%\" >nul
     echo   [SUCCESS] Skills copied
)

REM Copy main SKILL.md
if exist "%SOURCE_DIR%\SKILL.md" (
     echo   [INFO] Copying main SKILL.md...
     copy /Y "%SOURCE_DIR%\SKILL.md" "%TARGET_DIR%\" >nul
     echo   [SUCCESS] Main SKILL.md copied
)

REM Copy references
if exist "%SOURCE_DIR%\references" (
     echo   [INFO] Copying references...
     xcopy /E /I /Y "%SOURCE_DIR%\references" "%TARGET_DIR%\" >nul
     echo   [SUCCESS] References copied
)

REM Copy assets
if exist "%SOURCE_DIR%\assets" (
     echo   [INFO] Copying assets...
     xcopy /E /I /Y "%SOURCE_DIR%\assets" "%TARGET_DIR%\" >nul
     echo   [SUCCESS] Assets copied
)

REM Copy templates
if exist "%SOURCE_DIR%\templates" (
     echo   [INFO] Copying templates...
     xcopy /E /I /Y "%SOURCE_DIR%\templates" "%TARGET_DIR%\" >nul
     echo   [SUCCESS] Templates copied
)

REM Copy README
if exist "%SOURCE_DIR%\README.md" (
     echo   [INFO] Copying README.md...
     copy /Y "%SOURCE_DIR%\README.md" "%TARGET_DIR%\" >nul
     echo   [SUCCESS] README.md copied
)

################################################################################
# Verification
################################################################################

echo.
echo   [INFO] Verifying installation...

if not exist "%TARGET_DIR%" (
     echo   [ERROR] Installation failed: Target directory not created
     pause
     exit /b 1
)

REM Count installed files
set SKILL_COUNT=0
for /f %%i in ('dir /s /b "%TARGET_DIR%\SKILL.md" "%TARGET_DIR%\skill.md" 2^>nul ^| find /c /v ""') do set SKILL_COUNT=%%i

if "%SKILL_COUNT%"=="0" (
     echo   [WARNING] No skill files found
) else (
     echo   [SUCCESS] Found %SKILL_COUNT% skill file(s)
)

echo.
echo ================================================================================
echo   Installation Complete
echo ================================================================================
echo.
echo   Plugin:         %PLUGIN_NAME%
echo   Location:       %TARGET_DIR%
echo   Skills:         %SKILL_COUNT%
echo.
echo ================================================================================
echo   Next Steps:
echo.
echo   1. Restart Claude Code to load the new skills
echo.
echo   2. Verify installation:
echo      cd deploy
echo      verify.bat
echo.
echo   3. Test the skills:
echo      In Claude Code, try: "Use [skill-name] to [problem]"
echo.
echo ================================================================================
echo.
echo Press any key to close this window...
pause >nul
