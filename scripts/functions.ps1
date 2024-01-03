function Get-AvailableDriveLetters {
    70..90 | ForEach-Object { "$_`:" } | Where-Object { -Not (Test-Path "$_\`:") } -join " "
}

function Refresh-MappedDrives {
    $Global:MappedDrives = Get-PSDrive -PSProvider FileSystem |
                            Where-Object { $_.DisplayRoot -like '\\wsl$*' -or $_.Root -like 'C:\Users\*' -or $_.Root -like 'C:\Windows\Temp' -or $_.Root -like 'C:\Program Files*' } |
                            ForEach-Object { @{ $_.Name = $_.Root } } | ForEach-Object { $_.Name, $_.Value } | ConvertFrom-StringData
}

function Toggle-DriveAssignment {
    param ($choice, $path)

    if ($Global:MappedDrives.ContainsKey($choice)) {
        UnmapDrive $choice
        $Global:MappedDrives.Remove($choice)
    } else {
        $availableDriveLetter = (Get-AvailableDriveLetters -split " ")[0]
        if ($availableDriveLetter) {
            MapDrive $availableDriveLetter $path
            $Global:MappedDrives[$choice] = $path
        } else {
            "No available drive letters."
        }
    }
}


function Choose-Profile {
    $users = Get-ChildItem 'C:\Users' -Directory | Select-Object -ExpandProperty Name
    $profiles = @{}
    $users | ForEach-Object { $profiles.Add($_, if ($Global:MappedDrives.ContainsKey($_)) { "Release" } else { "Assign" }) }
    $selectedUser = Show-Menu -menuItems $profiles -prompt "Select Profile: "
    if ($selectedUser) {
        $path = "C:\Users\$selectedUser"
        Toggle-DriveAssignment $selectedUser $path
    }
}


function MapDrive {
    param ($driveLetter, $path)

    if (-Not (Test-Path "$driveLetter`:")) {
        New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $path -Persist
        "Drive $driveLetter mapped to $path"
    } else {
        "Drive $driveLetter is already in use"
    }
}

function UnmapDrive {
    param ($driveLetter)

    if (Test-Path "$driveLetter`:") {
        Remove-PSDrive -Name $driveLetter
        "Drive $driveLetter unmapped"
    } else {
        "Drive $driveLetter is not mapped"
    }
}

# Additional functions can be added here as required
