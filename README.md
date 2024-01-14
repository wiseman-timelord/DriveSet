# DriveSet-Psc
Status: ALPHA (do not use).

## Work Done
- Batch conformed from NetOptMon-Psc, or whatever its name will end up being.
- Figured out folders to use.

## Work TODO
- it should check if any of the drives have been mapped to the locations before each submenu loads.
- menu items on submenus will have displayed the Status displayed as what selecting the options would toggle, for example "1 = WSL Ubuntu (Assign/Release)" for relevantly  Un-asigned or Assigned folders. The user will now be toggling assignments on the submenu items. 
- new option Refresh "Screen=R" to, re-check drive letter assignments and refresh the menu.
- we will no longer need a ".\scripts\drives.psd1", so update the parts relevant to that.
- remember to keep significant variables at the start of the script, but not, menus or headers. 
- the Choose-Profile should be the first option on the Main Menu, with its own submenu that should be displaying the available profiles.
- Milestones: Complete Menus, Optimize & Improve layout, Final Testing & Fixing.

## DESCRIPTION
DriveSet-Psc is a versatile PowerShell Core application for Windows 10 users, designed to streamline the process of assigning drive letters to commonly accessed folders. Whether it’s for quick access to system directories, gaming folders, WSL distributions, or user profiles, DriveSet-Psc offers a user-friendly, interactive menu-driven interface to make drive letter assignment a hassle-free experience.

## FEATURES
- Customizable Menus: Users can navigate through various menus to select different folder types (System, Games, WSL, User Profiles).
- Dynamic Drive Mapping: Dynamically assigns available drive letters to chosen folders, and can unassign them as needed.
- User Profile Management: Enables quick mapping of user profiles to drive letters.
- WSL Support: Specific support for WSL folders, catering to different Linux distributions within WSL.
- Refresh Capability: Allows users to refresh the screen and update the mapped drives list.
- Interactive Interface: User-friendly, interactive command-line interface for ease of use.


## PREVIEW
Folders that will be in the submenus...
```
======================( DriveSet-Psc )======================
=======================( Main Menu )======================

1: Choose Profile
2: System Folders
3: Games Folders
4: WSL Folders

Select, Folder Themes 1-4, Refresh Display=R, Exit Program=X:
```

## DISCLAIMER
The "License.Txt" covers, this and relating, stuff.
