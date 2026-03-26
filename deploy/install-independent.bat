@echo off
################################################################################
# Book2Skill Factory - Plugin Deployment Script (Independent Marketplace)
################################################################################
# Each plugin gets its own marketplace to avoid conflicts
#
# Usage:
#   install.bat
################################################################################

setlocal enabledelayedexpansion

################################################################################
# Configuration
################################################################################

REM Plugin name (auto-detected)
for %%i in ("%~dp0..") do set PLUGIN_NAME=%%~nxi

REM Target directory (independent marketplace for each plugin)
set TARGET_DIR=%USERPROFILE%\.claude\plugins\marketplaces\%PLUGIN_NAME%-marketplace

REM Source directory
set SOURCE_DIR=%~dp0..

################################################################################
# Installation
################################################################################

echo.
echo ================================================================================
echo   Claude Code Plugin Deployment (Independent Marketplace)
echo ================================================================================
echo.
echo   Plugin: %PLUGIN_NAME%
echo   Target: %TARGET_DIR%
echo.

REM Pre-flight check
if not exist "%SOURCE_DIR%\.claude-plugin\marketplace.json" (
     echo   [ERROR] Missing .claude-plugin\marketplace.json
     echo   [ERROR] This is required for official plugin format
     echo.
     echo   Expected location: %SOURCE_DIR%\.claude-plugin\marketplace.json
     echo.
     echo   Please create this file first. See:
     echo   https://code.claude.com/docs/en/plugin-marketplaces
     echo.
     pause
     exit /b 1
)

echo   [SUCCESS] Found .claude-plugin\marketplace.json
echo.

REM Check if plugin already exists
if exist "%TARGET_DIR%" (
     echo   [WARNING] Plugin already installed at %TARGET_DIR%
     echo.
     set /p CONFIRM="Do you want to overwrite? (y/N): "
     if /i not "!CONFIRM!"=="y" (
          echo   [INFO] Installation cancelled
          pause
          exit /b 0
     )
     echo   [INFO] Removing existing installation...
     rmdir /s /q "%TARGET_DIR%"
)

REM Create marketplace structure
echo   [INFO] Creating independent marketplace structure...
mkdir "%TARGET_DIR%" 2>nul

REM Copy marketplace.json
echo   [INFO] Copying marketplace configuration...
mkdir "%TARGET_DIR%\.claude-plugin" 2>nul
copy "%SOURCE_DIR%\.claude-plugin\marketplace.json" "%TARGET_DIR%\.claude-plugin\marketplace.json" /Y >nul
echo   [SUCCESS] marketplace.json installed to %PLUGIN_NAME%-marketplace

REM Create plugin directory
set PLUGIN_DIR=%TARGET_DIR%\plugins\%PLUGIN_NAME%
mkdir "%PLUGIN_DIR%" 2>nul
echo   [SUCCESS] Plugin directory created: %PLUGIN_DIR%

REM Copy skills
if exist "%SOURCE_DIR%\skills" (
     echo   [INFO] Copying skills...
     xcopy /E /I /Y "%SOURCE_DIR%\skills\*" "%PLUGIN_DIR%\" >nul
     echo   [SUCCESS] Skills copied
)

REM Copy references
if exist "%SOURCE_DIR%\references" (
     echo   [INFO] Copying references...
     xcopy /E /I /Y "%SOURCE_DIR%\references" "%PLUGIN_DIR%\" >nul
     echo   [SUCCESS] References copied
)

REM Copy assets
if exist "%SOURCE_DIR%\assets" (
     echo   [INFO] Copying assets...
     xcopy /E /I /Y "%SOURCE_DIR%\assets" "%PLUGIN_DIR%\" >nul
     echo   [SUCCESS] Assets copied
)

REM Copy templates
if exist "%SOURCE_DIR%\templates" (
     echo   [INFO] Copying templates...
     xcopy /E /I /Y "%SOURCE_DIR%\templates" "%PLUGIN_DIR%\" >nul
     echo   [SUCCESS] Templates copied
)

REM Copy README
if exist "%SOURCE_DIR%\README.md" (
     echo   [INFO] Copying README.md...
     copy "%SOURCE_DIR%\README.md" "%PLUGIN_DIR%\" /Y >nul
     echo   [SUCCESS] README.md copied
)

################################################################################
# Summary
################################################################################

echo.
echo ================================================================================
echo   Installation Complete
echo ================================================================================
echo.
echo   Plugin:         %PLUGIN_NAME%
echo   Marketplace:    %PLUGIN_NAME%-marketplace
echo   Location:       %TARGET_DIR%
echo.
echo ================================================================================
echo   Next Steps:
echo.
echo   1. Restart Claude Code to load the new marketplace
echo.
echo   2. Verify installation:
echo      dir "%TARGET_DIR%"
echo.
echo   3. Test the skills:
echo      In Claude Code, try: "Use [skill-name] to [problem]"
echo.
echo   Note: Your plugin has its own marketplace.
echo         No conflicts with other plugins.
echo.
echo   Directory Structure:
echo   %USERPROFILE%\.claude\plugins\marketplaces\
echo     ├── blue-ocean-strategy-marketplace\
echo     ├── lean-startup-marketplace\
echo     └── ...
echo.
echo ================================================================================
echo.
echo Press any key to close this window...
pause >nul
