@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Initialization
mode con cols=60 lines=20
color 0A
title DriveAssign-Ba - WSL Drive Assignment Tool
cd /d "%~dp0"
echo.
echo DriveAssign-Ba Script Started...
echo.
timeout /t 2 /nobreak >nul

:: Get the name of your WSL distribution
SET WslDistribution=Ubuntu
echo WSL Distribution: %WslDistribution%
timeout /t 1 /nobreak >nul

:: List all available drive letters
echo Available drive letters:
for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if not exist %%i:\ (
        echo     %%i
    )
)
timeout /t 1 /nobreak >nul

:: Prompt the user to input the desired drive letter
:input
SET /P DriveLetter=Enter the drive letter you want to use: 
IF NOT EXIST %DriveLetter%:\ (
    echo Invalid choice, please try again.
    GOTO input
)

:: Map the network drive
echo Attempting to map WSL %WslDistribution% to %DriveLetter%:
net use %DriveLetter%: \\wsl$\\%WslDistribution%
if %errorlevel% == 0 (
    echo ...Mapping Success.
) else (
    echo ...Error in Mapping Drive.
)
timeout /t 2 /nobreak >nul

:: End Script
echo.
echo DriveAssign-Ba Script Finished.
echo.
ENDLOCAL
pause
