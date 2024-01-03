# DriveSet-Psc
Status: ALPHA (do not use).

## Work Done
- Batch conformed from NetOptMon-Psc, or whatever its name will end up being.

## Work TODO
- it should check if any of the drives have been mapped to the locations before each submenu loads.
- menu items on submenus will have displayed the Status displayed as what selecting the options would toggle, for example "1 = WSL Ubuntu (Assign/Release)" for relevantly  Un-asigned or Assigned folders. The user will now be toggling assignments on the submenu items. 
- new option Refresh "Screen=R" to, re-check drive letter assignments and refresh the menu.
- we will no longer need a ".\scripts\drives.psd1", so update the parts relevant to that.
- remember to keep significant variables at the start of the script, but not, menus or headers. 
- the Choose-Profile should be the first option on the Main Menu, with its own submenu that should be displaying the available profiles.
- Create menus, Figure out folders to use, Optimize layout, Improve, Test & Develope.

## DESCRIPTION
Tool to set folder locations of common interest to being assigned to drive letters, this will be offered on Assign/Release toggle, checked upon entering menu, thus allowing de-assignment.

## PREVIEW
Folders that will be in the submenus...
```
"C:\Users\Public\Desktop"
"C:\Windows\Temp"
"C:\Users\Public"
Choose-Profile
"C:\Program Files (x86)\Steam\SteamApps\Common"
"C:\Program Files\Epic Games"
"\\wsl$\Ubuntu"
"\\wsl$\Kali-Linux"
"\\wsl$\openSUSE"
"\\wsl$\Debian"
```
