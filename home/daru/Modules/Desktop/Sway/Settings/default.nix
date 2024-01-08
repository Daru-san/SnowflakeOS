{pkgs, config, ...}:{
  imports = [
    ./binds.nix
    ./input.nix
  ];
#Configuring Hyprland 
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    systemd = {
      enable = true;
    };
    wrapperFeatures = {
      gtk = true;
    };
    config = {
      terminal = "${config.programs.kitty.package}/bin/kitty";
      menu = "${config.programs.fuzzel.package}/bin/fuzzel";
    };
    extraConfig = ''
      # Applies all generated settings
      include ~/.config/sway/.generated_settings/*.conf

      # Launches sway-wallpaper when setting wallpaper from swaymsg.
      # Without this, swaybg would launch instead...
      swaybg_command sway-wallpaper

      # To apply the selected wallpaper
      exec_always sway-wallpaper -i ~/.cache/wallpaper -m fill

      # Start all of the non-hidden applications in ~/.config/autostart
      # This executable is included in the swaysettings package
      exec sway-autostart
    '';
  };
}

