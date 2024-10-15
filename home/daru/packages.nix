# Home packages shared between users
{
  pkgs,
  inputs,
  system,
  lib,
  ...
}:
{
  home.packages = lib.mkMerge [
    (with pkgs; [
      # GUI
      scrcpy
      qtscrcpy
      keepassxc
      bridge-editor
      oculante
      pwvucontrol
      blanket
      mission-center
      g4music
      kdePackages.kalzium
      discover
      kdenlive
      ffmpeg
      pandoc
      waydroid-script
      prismlauncher
      libreoffice-qt6-fresh
      krita
      alpaca
      ollama
      jq

      # Developmentment
      lazarus-qt
      android-studio

      # CLI
      ouch
      element
      swww
      npins
      tree
      tgpt
      adbtuifm
      libnotify
      fd
      speedtest-cli
      glow
      gping
      hut
      nvtopPackages.intel
      sysz
      systemctl-tui
      exiftool
      xdg-utils
      pulsemixer
      maven
      musikcube
      qmmp
      mediainfo
      unrar
      onefetch
      nix-output-monitor
      stable.nix-init
      nix-update
      nixfmt-rfc-style
      trashy
      stable.turtle
      rqbit
      dconf-editor
      file-roller
      cheese
      mediainfo
      hexyl
      gnome-clocks
      xdg-user-dirs
    ])
    (with inputs; [
      r-pg.packages.${system}.default
      anipy-cli.packages.${system}.default
      color-picker.packages.${system}.default
      snowyvim.packages.${system}.neovim
      zen-browser.packages.${system}.zen-browser
    ])
  ];
}
