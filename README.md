# WSL2 console setup

---

## Windows Terminal setup

### Set font [**MesloLGS NF**](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip)

You have to set the font for the Windows terminal

![wsl2-fuente.jpg](/windows-terminal/wsl2-fuente.jpg)

### Background color

You have to set the background color for the Windows terminal

![wsl2-colores.jpg](/windows-terminal/wsl2-colores.jpg)

---

## [OH MY ZSH](https://ohmyz.sh/)

_Note:_ Aliases, intiations and custom configurations are set at the end of the file [.zshrc](/ohmyz/.zshrc)

### Set [**p10k**](https://github.com/romkatv/powerlevel10k) theme

Edit [.zshrc](/ohmyz/.zshrc) file

    vim ~/.zshcr

Uncomment and/or change ZSH_THEME line

```bash
...
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
...
```

### Customize **p10k** colors

Edit [.p10k.zsh](/ohmyz/.p10k.zsh) file

    vim ~/.p10k.zsh

![colores-p10k.jpg](/ohmyz/colores-p10k.jpg)

---

## [COLOR LS](https://github.com/athityakumar/colorls)

Add alias to end of [.zshrc](/ohmyz/.zshrc) file

```vim
...
alias ls=colorls
```

### Customize dark colors thene

Make a copy of [dark_colors.yaml](/colorls/dark_colors.yaml)

    cp $(dirname $(gem which colorls))/yaml/dark_colors.yaml ~/.config/colorls/dark_colors.yaml

Edit new configuration file

    vim ~/.config/colorls/dark_colors.yaml

---

## [BAT](https://crates.io/crates/bat/0.15.4)

Beautify your cat command

Add alias to the end of [.zshrc](/ohmyz/.zshrc) file

```vim
...
alias cat=bat
```

![bat-cat.jpg](/bat/bat-cat.jpg)

---

## [NEOFETCH](https://github.com/dylanaraps/neofetch)

### Run neofech terminal start

Edit [.zshrc](/ohmyz/.zshrc) file

    vim ~/zshrc

Add nofetch command to the end of the file

```vim
...
neofetch
```

### Set Weyland Yutani logo in neofetch configuration file

Make logos directory

    mkdir ~/.config/neofetch/mis-logos

Copy [logo file](/neofetch/weyland-yutani.ans) to logos directory

    cp weyland_yunati.ans ~/.config/neofetch/.

Edit neofetch [config.conf](/neofetch/config.conf) file

    vim ~/.config/neofetch/config.conf

Set the image logo source

```bash
...
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
...
```

## ![neofetch.jpg](/neofetch/neofetch.png)

---

## Files sumary

- [.zshrc](/ohmyz/.zshrc) - **oh my zsh** Shell iniciation file

- [.p10k.zsh](/ohmyz/.p10k.zsh) - **p10k** theme configuration file

- [dark_colors.yaml](/colorls/dark_colors.yaml) - **colorls** configuration file

- [weyland-yutani.ans](/neofetch/weyland-yutani.ans) - the ansi **Weyland Yutani logo**

- [config.conf](/neofetch/config.conf) - **Neofetch** configuration file
