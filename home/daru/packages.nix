# Home packages shared between users
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  home.packages = with lib;
    mkMerge [
      (with pkgs; [
        # GUI
        obsidian
        krita
        freetube
        scrcpy
        keepassxc
        bridge-core
        audacity
        valent
        g4music
        mixxc
        newsflash
        archiver
        overskride
        pavucontrol
        iwgtk

        # CLI
        tree
        tgpt
        tty-clock
        libnotify
        speedtest-cli
        chroma
        glow
        gping
        nvtopPackages.intel
        sysz
        exiftool
        xdg-utils
        nitch
        pulsemixer
        ani-cli
        manga-cli
        transmission
        du-dust
        fzf
        nil
        musikcube
        music-player
        mediainfo
        unrar
        onefetch
        asciinema
        asciinema-agg
        asciinema-scenario
        xdragon
        nix-du
        manix
        deadnix
        nix-output-monitor
        zaread
      ])
      (with inputs.scripts.packages.${pkgs.system}; [hm-build nix-rebuild])
      (with pkgs.gnome; [nautilus dconf-editor gnome-clocks file-roller gnome-calculator])
      (with inputs.trashy; [defaultPackage.${pkgs.system}])
    ];
}
