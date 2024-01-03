# Importing functions from the functions.ps1 script
. .\scripts\functions.ps1

# Global Variables
$Global:DriveSetPscFilePath = ".\scripts\drives.psd1"
$Global:DriveSetPscSleepDuration = 1

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

function DriveSet-Psc {
    do {
        $mainMenu = @{
            "1" = "System Folders"
            "2" = "Games Folders"
            "3" = "WSL Folders"
            "X" = "Exit Program"
        }

        $choice = Show-Menu -menuItems $mainMenu -prompt "Select, Folder Themes 1-3, Exit Program=X:"

        if ($choice -eq 'X') { "Exiting"; break }

        $path = $null

        switch ($choice) {
            "1" { $path = Show-SystemFoldersMenu }
            "2" { $path = Show-GamesFoldersMenu }
            "3" { $path = Show-WSLFoldersMenu }
            default { "Invalid choice"; continue }
        }

        MapDrive $path
    } while ($true)
}

DriveSet-Psc
