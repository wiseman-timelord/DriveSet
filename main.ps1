# Importing functions from the functions.ps1 script
. .\scripts\functions.ps1

# Global Variables
$Global:DriveSetPscSleepDuration = 1
$Global:MappedDrives = @{}

function Print-Header {
    Clear-Host
    Write-Host "======================( DriveSet-Psc )======================"
}

function Show-Menu {
    param (
        [hashtable]$menuItems,
        [string]$prompt
    )

    Print-Header
    "Select location:"
    $menuItems.GetEnumerator() | ForEach-Object { "$($_.Key): $($_.Value)" }
    $choice = Read-Host $prompt
    Start-Sleep -Seconds $Global:DriveSetPscSleepDuration
    return $choice
}

function Main-Menu {
    Refresh-MappedDrives

    do {
        $mainMenu = @{
            "1" = "Choose Profile"
            "2" = "System Folders"
            "3" = "Games Folders"
            "4" = "WSL Folders"
            "R" = "Refresh Screen"
            "X" = "Exit Program"
        }

        $choice = Show-Menu -menuItems $mainMenu -prompt "Select, Folder Themes 1-4, Refresh=R, Exit=X:"

        switch ($choice) {
            "1" { Show-ChooseProfileMenu }
            "2" { Show-SystemFoldersMenu }
            "3" { Show-GamesFoldersMenu }
            "4" { Show-WSLFoldersMenu }
            "R" { Refresh-MappedDrives }
            "X" { "Exiting"; break }
            default { "Invalid choice"; continue }
        }
    } while ($true)
}

function Show-SystemFoldersMenu {
    $systemFoldersMenu = @{
        "1" = "User Profiles"
        "2" = "Public Desktop"
        "3" = "Windows Temp"
        "4" = "Public Folder"
    }

    $choice = Show-Menu -menuItems $systemFoldersMenu -prompt "Select System Folder: 1-4"
    Toggle-DriveAssignment $choice
}

function Show-GamesFoldersMenu {
    $gamesFoldersMenu = @{
        "1" = "Steam Default"
        "2" = "Epic Games Default"
    }

    $choice = Show-Menu -menuItems $gamesFoldersMenu -prompt "Select Game Folder: 1-2"
    Toggle-DriveAssignment $choice
}

function Show-WSLFoldersMenu {
    $wslFoldersMenu = @{
        "1" = "WSL Ubuntu"
        "2" = "WSL Kali Linux"
        "3" = "WSL openSUSE"
        "4" = "WSL Debian"
    }

    $choice = Show-Menu -menuItems $wslFoldersMenu -prompt "Select WSL Folder: 1-4"
    Toggle-DriveAssignment $choice
}

function Show-ChooseProfileMenu {
    Choose-Profile
}


Main-Menu
