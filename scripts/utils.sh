#!/bin/sh

## init block ##
#~~|¨Colors¨|~~#
COLOR_RESET="\e[0m"
COLOR_BLACK="\e[30m"
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_YELLOW="\e[33m"
COLOR_PURPLE="\e[34m"
COLOR_CYAN="\e[36m"
COLOR_WHITE="\e[37m"
## end block ##

## init block ##
#~~|¨Variables¨|~~#
DIR_USER="$HOME"
DIR_NAV="$PWD"
PACMAN_CONF="/etc/pacman.conf"

PKGS_DEFAULT=(
  "base" 
  "base-devel" 
  "multilib-devel"
  "linux-firmware" 
  "sof-firmware" 
  "networkmanager"
  "network-manager-applet"
  "btrfs-progs" 
  "efibootmgr" 
  "net-tools" 
  "xf86-video-ati" 
  "mesa" 
  "ffmpeg"
  "ffmpegthumbnailer" 
  "ffmpegthumbs" 
  "alsa-utils" 
  "alsa-firmware" 
  "a52dec" 
  "faac" 
  "flac" 
  "jasper" 
  "lame" 
  "libdca" 
  "libmpeg2" 
  "libtheora" 
  "libvorbis" 
  "libxv" 
  "wavpack" 
  "x264" 
  "x265" 
  "xvidcore"
  "gstreamer"
  "gst-plugins-ugly"
  "gst-plugins-good" 
  "gst-plugins-base" 
  "gst-plugins-bad" 
  "gst-libav" 
  "bluez"
  "bluez-utils"
  "nano"
  "libinput" 
  "gvfs"
  "lighttpd"
  "reflector"
  "wget"
  "dosfstools"
)

DRIVERS_AMD=(
  "xf86-video-amdgpu"
  "vulkan-radeon"
  "vulkan-swrast"
  "amdvlk" 
  "mesa-vdpau"
  "amd-ucode"
)

DRIVERS_INTEL=(
  "xf86-video-intel"
  "vulkan-intel" 
)

XORG=(
  "xorg" 
  "xorg-server"
  "xorg-apps"
  "xdg-desktop-portal"
)

WAYLAND=(
  "wayland"
  "xorg-xwayland"
  "wayland-protocols"
  "qt5-wayland"
)

ACCESSORIES=(
  "flameshot"
)

DEVELOPMENT=(
  "git" 
  "github-cli" 
  "nodejs" 
  "npm" 
  "yarn" 
  "pnpm" 
  "pm2" 
  "sqlite" 
  "postgresql"
  "postgresql-libs" 
  "apache" 
  "php"
  "php-apache" 
  "phpmyadmin"
  "python"
  "pyenv" 
  "python-pip" 
  "python-pipx"
  "python-poetry"
  "docker"
  "docker-compose"
  "vim"
  "neovim"
  "zsh" 
  "alacritty"
)

GAMES=(
  "steam"
  "lutris"
  "mangohud"
  "wine-staging"
  "wine-mono" 
  "wine-gecko" 
  "winetricks"
  "zenity"
  "vulkan-icd-loader"
  "vkd3d"
  "openssl" 
  "gnutls"
  "openal" 
  "libpulse" 
  "mpg123" 
  "gamemode"
  "lib32-gamemode"
  "giflib"  
  "libpng"  
  "libldap" 
  "v4l-utils" 
  "libgpg-error"
  "alsa-plugins" 
  "alsa-lib" 
  "libjpeg-turbo"
  "libxcomposite"
  "libxinerama" 
  "libgcrypt" 
  "ocl-icd" 
  "pocl" 
  "opencl-headers"
  "libxslt"
  "libva" 
  "gtk3"
  "gst-plugins-base-libs" 
  "libxcrypt"
  "libxcrypt-compat" 
  "glibc"
  "opencl-clover-mesa" 
  "lib32-opencl-clover-mesa"
  "rocm-opencl-runtime" 
  "lib32-opencl-rusticl-mesa"
)

GRAPHICS=(
  "gimp" 
  "inkscape"
  "openshot"  
)

IOT=(
  "firefox" 
  "qbittorrent"
  "discord" 
  "telegram-desktop"
)

MEDIA=(
  "obs-studio" 
  "yt-dlp" 
  "audacious"
  "vlc" 
)

OFFICE=(
  "libreoffice"
)

SETTIGNS=(
  "unzip"
  "ark"
  "gzip" 
  "zip"
  "p7zip"
  "ufw" 
  "gufw"
  "pcmanfm" 
  "neofetch" 
  "htop" 
  "seahorse"
  "bleachbit"
  "fontconfig"
)

PKGS_AUR=(
  "brave-bin" 
  "spotify"
  "visual-studio-code-bin" 
  "mockoon-bin" 
  "obsidian-bin" 
  "postman-bin" 
  "local-by-flywheel-bin"
)

PKGS_KDE=(
  "bluedevil"
  "kvantum"
  "krita"
  "discover"
  "kwrite"
  "kpackage" 
  "qt5-tools"
  "oxygen5"
  "ark"
  "colord-kde"
  "dolphin"
  "dolphin-plugins"
  "filelight"
  "gwenview"
  "isoimagewriter"
  "kamera"
  "kamoso"
  "kate"
  "kcalc"
  "kcolorchooser"
  "kde-dev-scripts"
  "kde-dev-utils"
  "kdegraphics-thumbnailers"
  "kdenetwork-filesharing"
  "kdenlive"
  "kdepim-addons"
  "kdesdk-thumbnailers"
  "keditbookmarks"
  "kfind"
  "kgpg"
  "kmousetool"
  "knotes"
  "kontrast"
  "korganizer"
  "kwalletmanager"
  "signon-kwallet-extension"
  "kweather"
  "okular"
  "partitionmanager"
  "skanlite"
  "skanpage"
)

PKGS_XFCE=(
  "xfwm4"
  "xfdesktop"
  "archlinux-xdg-menu"
  "xdg-desktop-portal-xapp"
  "xfwm4-themes"
  "xfce4-appfinder"
  "xfce4-whiskermenu-plugin"
  "xfce4-battery-plugin"
  "xfce4-clipman-plugin"
  "xfce4-cpufreq-plugin"
  "xfce4-cpugraph-plugin"
  "xfce4-datetime-plugin"
  "xfce4-dev-tools"
  "xfce4-session"
  "xfce4-settings"
  "xfce4-panel"
  "xfce4-power-manager"
  "xfce4-pulseaudio-plugin"
  "xfce4-screensaver"
  "xfce4-screenshooter"
  "xfce4-sensors-plugin"
  "xfce4-notifyd"
  "xfce4-terminal"
  "xorg-xkill"
  "xdotool"
  "xfconf"
  "sound-theme-freedesktop"
  "thunar"
  "thunar-volman"
  "ristretto"
  "mousepad"
  "exo"
  "cairo"
  "tumbler"
  "xfmpc"
  "libxfce4util"
  "libxfce4ui"
  "libxfce4windowing"
  "pipewire-pulse"
  "pavucontrol"
)
## end block ##

## init block ##
#~~|¨Functions¨|~~#
pf() {
  local TIME="\e[1m$COLOR_PURPLE$(date +"%H:%M:%S")$COLOR_RESET"
  local MESSAGE="$1"
  local COLOR="$2"

  case "$COLOR" in
    "error")
      COLOR_CODE=$COLOR_RED;;
    "warn")
      COLOR_CODE=$COLOR_YELLOW;;
    "success")
      COLOR_CODE=$COLOR_GREEN;;
    *)
      COLOR_CODE=$COLOR_CYAN;; 
  esac

  printf "\n$TIME - $COLOR_CODE$MESSAGE$COLOR_RESET\n"
}

plist() {
  local COUNT=1
  for list in $@; do
    printf "\e[1m$COLOR_CYAN[$COUNT]: ${list##*/}$COLOR_RESET\n"
    ((COUNT++))
  done
}

pkg_i() {
  local PKG=$@

  while true; do
    read -n1 -rep "Deseja continuar com a instação? (s/n)" RES
    if [[ $RES == [Ss] ]]; then
      pf "Instalando..." "warn"
      sudo pacman -S --needed --noconfirm $PKG
      pf "Instalação concluída!" "success"
      break
    elif [[ $RES == [Nn] ]]; then
      break
    else
      pf "Opção inválida. Por favor digite novamente." "error"
    fi
  done
}

run_cmd_valid() {
  local COMMAND_RUN=$1
  local COMMAND_M=$2

  if $COMMAND_RUN; then
    pf "$COMMAND_M concluído!" "success"
  else
      pf "Falha em $COMMAND_M." "error"
  fi
}
## end block ##
