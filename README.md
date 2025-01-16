# Dolphin: Open in VS Code

A context menu entry for Dolphin to open VS Code at the current location.

Works on the empty background or on a folder.

## Download

<a href="https://store.kde.org/p/1413799/"><img alt="Download from the KDE Store" height="50px"
src="https://img.shields.io/badge/KDE_Store-blue?style=for-the-badge&logo=kde"></a>
<a href="https://github.com/Merrit/kde-dolphin-open-vscode/releases/latest"><img alt="Download from GitHub" height="50px"
src="https://img.shields.io/badge/GitHub-blue?style=for-the-badge&logo=github"></a>

## Manual Install

If not downloading from the KDE Store, install manually:

Move the file `openVSCode.desktop` into the [Service Menus folder](https://develop.kde.org/docs/apps/dolphin/service-menus/):
- KDE Plasma 5: `~/.local/share/kservices5/ServiceMenus`
- KDE Plasma 6: `~/.local/share/kio/servicemenus`

Set as executable:
```bash
chmod +x ./openVSCode.desktop
```

## Customization

By default, the extension works on directories (i.e. `inode/directory`). If you prefer the extension to work on all file types, edit the file `openVSCode.desktop` by replacing the line `MimeType=inode/directory` with `MimeType=all/all`.

## Screenshots

![](screenshots/open_vscode_1.png)

![](screenshots/open_vscode_2.png)
