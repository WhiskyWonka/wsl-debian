---
title: consola
description: 
published: true
date: 2022-10-24T21:46:05.821Z
tags: 
editor: markdown
dateCreated: 2022-10-24T19:59:07.786Z
---

# Configuración de mi consola linux wsl2
### Fuente
**MesloLGS NF**
![wsl2-fuente.jpg](/wsl2-fuente.jpg)

### Color de fondo
![wsl2-colores.jpg](/wsl2-colores.jpg)

## OH MY ZSH
[Oh my zsh](/https://ohmyz.sh/)

Le agregué algunos alias y la instalacion del theme al final del archivo [.zshrc](/.zshrc)

El tema de **Oh my zsh** que uso es **p10k**

https://github.com/romkatv/powerlevel10k

Le cambie algunos colores en este archivo: [.p10k.zsh](/.p10k.zsh)
![colores-p10k.jpg](/colores-p10k.jpg)

## COLORS LS
[colorls](/https://github.com/athityakumar/colorls)

Se activa desde *zshrc.sh*
```vim
alias ls=colorls
```

copie el yml de colores para personalizarlo en el archivo *~/.config/colorls/[dark_colors.yaml](/dark_colors.yaml)*

```yaml
# Main Colors
unrecognized_file: '#888888'
recognized_file:   '#FFFFFF'
executable_file:   '#E2943A'
dir:               green

# Link
dead_link: red
link:      lime

# special files
socket:   '#FFFFFF'
blockdev: '#FFFFFF'
chardev:  '#FFFFFF'

# Access Modes
write:     green
read:      green
exec:      '#E2943A'
no_access: '#324E2C'

# Age
day_old:     '#94DE9F'
hour_old:    lime
no_modifier: '#53824E'

# File Size
file_large:  orange
file_medium: '#CCCCCC'
file_small:  '#888888'

# Random
report: white
user:   '#53824E'
tree:   cyan
empty:  yellow
error:  red
normal: '#E2943A'

# Git
addition:     chartreuse
modification: darkkhaki
deletion:     darkred
untracked:    darkorange
unchanged:    forestgreen
```

### BAT
[0.15.4](/https://crates.io/crates/bat/0.15.4)

Para que los cat se vean mas lindos agregue el plugin bat

![bat-cat.jpg](/bat-cat.jpg)

Se activa desde *zshrc.sh*
```vim
alias cat=bat
```

### NEOFETCH
[neofetch](/https://github.com/dylanaraps/neofetch)

![neofetch.jpg](/neofetch.jpg)

lo agregué al inicio de terminal en el archivo: *https://github.com/dylanaraps/neofetch/rgrinberg.zsh*

```vim
alias lla='ls -la'
neofetch
```

El logo de Weyland Yutani se configura en *.config/neofetch/config.conf*

```bash
# Image Source
#
# Which image or ascii file to display.
#
# Default:  'auto'
# Values:   'auto', 'ascii', 'wallpaper', '/path/to/img', '/path/to/ascii', '/path/to/dir/'
#           'command output (neofetch --ascii "$(fortune | cowsay -W 30)")'
# Flag:     --source
#
# NOTE: 'auto' will pick the best image source for whatever image backend is used.
#       In ascii mode, distro ascii art will be used and in an image mode, your
#       wallpaper will be used.e
image_source="$HOME/.config/neofetch/mis-logos/weyland-yutani.ans"
```

[weyland-yutani.ans](/weyland-yutani.ans)