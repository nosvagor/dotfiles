<h1 align="center">⚙️ dotfiles | tokyo night 🌆</h1>

<p align="center">
<kbd>
<img
    alt="dotfiles neonlights banner"
    src="https://github.com/nosvagor/dotfiles/blob/main/resources/share/dotfiles-banner.gif?raw=true" />
</kbd>
</p>

<p align="center">
    <img src="https://img.shields.io/github/stars/nosvagor/dotfiles?color=%231a1b26&label=STARGAZERS&labelColor=%231a1b26&style=for-the-badge"/>&nbsp;&nbsp;
    <img src="https://visitor-badge-reloaded.herokuapp.com/badge?color=1a1b26&page_id=nosvagor/dotfiles&style=for-the-badge&lcolor=1a1b26"/>&nbsp;&nbsp;
    <img src="https://img.shields.io/github/issues/nosvagor/dotfiles?color=1a1b26&labelColor=1a1b26&style=for-the-badge"/>&nbsp;&nbsp;
    <img src="https://img.shields.io/github/license/nosvagor/dotfiles?color=1a1b26&labelColor=1a1b26&style=for-the-badge"/>
</p>

---

&nbsp;

## Overview 👾

<details>
<summary><b> Essentials 📦 </b></summary>

- Operating System: [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux)
- Display Server: [Wayland](https://wiki.archlinux.org/title/Wayland), with display manager: [SDDM](https://wiki.archlinux.org/title/SDDM)
- Window manager: [Hyprland](https://github.com/hyprwm/Hyprland), with hotkey daemon: [swhkd](https://github.com/waycrate/swhkd)
- Terminal: [alacritty](https://github.com/alacritty/alacritty), with terminal multiplexer: [tmux](https://en.wikipedia.org/wiki/Tmux)
- Shell: [zsh](https://wiki.archlinux.org/title/zsh),
  - Plugins: [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [auto suggestions](https://github.com/zsh-users/zsh-autosuggestions), [auto complete](https://github.com/marlonrichert/zsh-autocomplete), [colored man pages](https://github.com/ael-code/zsh-colored-man-pages)
  - Prompt: custom [starship](https://starship.rs/) + [custom DNA greeter](cullyn/.local/bin/dna)
  - Quick navigation: [jump](https://github.com/gsamokovarov/jump)
- Editor: [neovim-nightly](https://github.com/neovim/neovim),
  - [config files](cullyn/.config/nvim/) _(work in progress)_ 🔨
- Browser: [firefox-developer-eddition](https://www.mozilla.org/en-US/firefox/developer/), with keyboard focused usage via:
  - [vimium](https://github.com/philc/vimium)
  - and a custom, minimal css theme: [errant]() _(work in progress)_ 🔨
- File manager: [nnn](https://github.com/jarun/nnn)
  - [config files](cullyn/.config/nnn/) _(work in progress)_ 🔨

</details>
&nbsp;
<details>
<summary><b> Aesthetics 🕶️</b></summary>

- General theme: [Tokyo Night Storm](https://github.com/folke/tokyonight.nvim)
- Status bar: [waybar](https://github.com/Alexays/Waybar)
- Launcher: [rofi](https://github.com/davatorium/rofi)
- PDF viewer: [zathura](https://pwmt.org/projects/zathura/)
- Notifications: [dunst](https://github.com/dunst-project/dunst)
- Music:
- Music visualizer:
- Fonts: [google fonts](https://aur.archlinux.org/packages/ttf-google-fonts-git/) / [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
  - Open Sans (serif)
  - Roboto Slab (serif)
  - Hack Nerd Font (monospace)
  - Noto Color Emoji and Noto Emoji
- GTK:
- Cursor:
- Icons:

</details>
&nbsp;
<details>
<summary><b> Hardware 🖥️ </b></summary>

- **Mouse**: MX Master 3S
- **CPU**: AMD Ryzen 7 3700X (16) @ 3.600GHz
- **GPU**: AMD ATI Radeon RX 5600 OEM/5600 XT / 5700/5700 XT
- **Monitor**: SAMSUNG UR59 Series 32-Inch 4K UHD (3840x2160)
- **Keybaord:** Corne (Helidox) 42 key, Kailh gChoc Light Blue (20g),

</details>

&nbsp;

## Installation 🛠️

<details>
<summary><b>1. Installing Linux 🐧 </b></summary>

##### [Official ArchWiki Installation Guide](https://wiki.archlinux.org/title/installation_guide)

##### [Please do read the FAQ](https://wiki.archlinux.org/title/Frequently_asked_questions)

**⚠️ Note:** _the following is essentially what I did if you want to start from scratch and
follow along. Installation does not have to be exactly like I describe; these
instructions are mostly just here for personal reference to debug what I might be
doing wrong, or did wrong. Some minor steps or, reason behind my choices, are not explicitly stated._

**1.1 Acquire an installation image**: https://archlinux.org/download/

**1.2 Prepare an installation medium:**

- find USB device partition (**sda** or **sdb**, probably):

      lsblk -f

- write to usb using **dd** (sd"x", do not use partition number):

      dd bs=4M if=path/to/archlinux-version-x86_64.iso of=/dev/sdx conv=fsync oflag=direct status=progress

**1.3 Use guided arch installation:**

- boot to usb and run command:

      archinstall

- nice to install some base packages needed for now:

      base base-devel linux-headers git stow dkms coreutils vim bat btop go rust python

---

---

</details>
&nbsp;
<details>
<summary><b>2. Post-Installation 🧰 </b></summary>

##### [ArchWiki General Recommendations](https://wiki.archlinux.org/title/General_recommendations)

2.1 Install AUR helper ([paru](https://github.com/Morganamilo/paru) is nice too)

    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si

&nbsp;

2.2 Install packages:

    cd $HOME && git clone https://github.com/nosvagor/dotfiles.git
    yay -S - < $HOME/dotfiles/resources/packages.txt

&nbsp;

2.3 Configure shell and link config files:

- Change default shell to zsh:

      chsh -s $(which zsh)

- Install shell related packages:

      go install github.com/gsamokovarov/jump@latest
      curl -sS https://starship.rs/install.sh | sh
      $HOME/dotfiles/cullyn/.local/bin/zsh-install

- Link config files using [GNU stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html):

      cd $HOME/dotfiles
      mv cullyn $USER
      stow $USER
      stow zsh

**⚠️ Note:** _you probably don't want my zsh config, or many of my personal configs, and should update them now._

&nbsp;

2.5 Configure SSH for GitHub _(here for personal reference)_:

    ssh-keygen -t ed25519 -C "your_email@example.com"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    bat ~/.ssh/id_ed25519.pub
    # Add ssh key to github, then update remote origin:
    git remote set-url origin git@github.com:USERNAME/REPOSITORY.git

&nbsp;

2.6 Update [bluetooth](https://wiki.archlinux.org/title/bluetooth):

    systemctl enable bluetooth.service
    systemctl start bluetooth.service #(if before reboot)

- pair device

      bluetoothctl
      power on
      scan on
      pair DEVICE
      trust DEVICE
      connect DEVICE

- auto power-on:

      /etc/bluetooth/main.conf
      ---
      [Policy]
      AutoEnable=true

- disable shitty built in bluetooth:

      lsusb | grep "Bluetooth"

      # yields
      Bus 001 Device 004: ID 0b05:18ea ASUSTek Computer, Inc. Bluetooth Radio

      touch /etc/udev/rules.d/81-bluetooth-hci.rules
      ---
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0b05", ATTRS{idProduct}=="18ea", ATTR{authorized}="0"

- verify by checking available agents (should just be one, preferably):

      bluetoothctl list

      # yields
      Controller 3C:7C:3F:A2:38:10 costello [default]

&nbsp;

2.7 Create default directories (personal preference, see [user-dirs.dir](https://github.com/nosvagor/dotfiles/blob/main/cullyn/.config/user-dirs.dirs)):

    #simple script to edit if you want something different
    dir-setup

    # yields
    ├── documents
    │   ├── papers
    │   ├── share
    │   ├── templates
    │   └── textbooks
    ├── downloads
    ├── media
    │   ├── gifs
    │   ├── images
    │   ├── music
    │   ├── recordings
    │   ├── video
    │   └── videos

&nbsp;

2.8 Edit boot config (skip boot menu):

    ──────┬─────────────────────────────────────────────────────────────────────────────
          │ File: /boot/loader/loader.conf
    ──────┼─────────────────────────────────────────────────────────────────────────────
      1   │ timeout 0
    ──────┴─────────────────────────────────────────────────────────────────────────────

---

---

</details>
&nbsp;
<details>

<summary><b>3. Customization 🖌️</b></summary>

#### Firefox 🦊

3.1 update various `about:config` options:

- Update scaling factor if in HiDPI environment:

      layout.css.devPixelsPerPx = 1.25

- Stop asking to restore session (I often just kill the window and don't want the prompt later)

      browser.sessionstore.resume_from_crash = false

---

---

</details>

&nbsp;

## Gallery 🎨

&nbsp;

## Support 🤝

- Personal: [cullyn.eth](https://cullyn.eth/)
  - ETH `0xe377b77E7177c236EDE5abD317960Fc023efD841`
- Open source: [gitcoin.co](https://gitcoin.co/)
