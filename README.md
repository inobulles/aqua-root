# aqua-root

This repository contains the default files in the root directory of AQUA.
It is automatically installed by [`aqua-unix`](https://github.com/inobulles/aqua-unix).

## File hierarchy

The root contains a few top-level files and directories, which are described here.

### `boot.zpk`

The default program started by the KOS.
Usually, this is launched on startup, and is the parent of all other AQUA processes.

### `conf/`

Configurable resources accessible by and shared between all applications.
This includes icons, fonts, shaders, themes, &c.
These resources can be replaced or configured at will by the user.
Here's a comprehensive list of each subdirectory and a short description of what they contain:

|Name|Description|
|-|-|
|`cursors/`|SVG graphics for the various different cursors on AQUA (e.g. pointer, caret, &c).|
|`fonts/`|TrueType fonts used by AQUA apps (e.g. Montserrat, Roboto Slab, &c). Each directory is a different font family, containing one or more font files.|
|`icons/`|Generic SVG icons useful to AQUA apps as they see fit. This aims to make apps less dependant on their own assets, and to make icons consistent between them.|
|`shaders/`|GLSL shaders used by the OpenGL UI backend for rendering various objects (e.g. shadows, frost effects, themeable SVG's, &c). Each directory contains a shader program, consisting of vertex & fragment shaders.|
|`themes/`|Theme files which describe colours and values used by the UI device to render elements (e.g. background/foreground colours, shadow radius, corner radius, &c).|
|`wp/`|Wallpapers used by the window manager to display as backgrounds. Each directory contains all the files necessary for a wallpaper (3D models, shaders, images, &c).|

### `data/`

Each AQUA app has its own directory here - named by its `unique` string - in which it can interact with the filesystem however it wants.
This includes creating files and directories, reading from them, deleting them, &c.
This is useful for storing app-specific user configuration data, game save data, caches, or really anything which needs to be persistent.

### `apps/`

ZPK packages of each app installed on the system.

## Attribution

Many resources included in the default root directory come from external sources:

|Path|Source|License|
|-|-|-|
|`conf/cursors/`|The cursors come from an [open-source recreation of the Apple macOS cursors](https://github.com/ful1e5/apple_cursor). They are slightly modified to accommodate AQUA's themeable SVG's.|GNU General Public License v3.0|
|`conf/fonts/FiraCode/`|Project repository may be found [here](https://github.com/tonsky/FiraCode).|SIL Open Font License 1.1|
|`conf/fonts/Montserrat/`|Project repository may be found [here](https://github.com/JulietaUla/Montserrat).|SIL Open Font License 1.1|
|`conf/fonts/NotoColorEmoji/`|More information about the Google fonts may be found [here](https://github.com/google/fonts).|Apache License 2.0|
|`conf/fonts/RobotoSlab/`|More information about the Google fonts may be found [here](https://github.com/google/fonts).|Apache License 2.0|
|`conf/icons/`|The icons come from Google's [Material Icons](https://github.com/google/material-design-icons). They are slightly modified to accommodate AQUA's themeable SVG's.|Apache License 2.0|
