{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.wayland;
in
{
  options.wayland.enable = mkEnableOption "Enable wayland using Hyprland";
  imports = [
    ./hypridle
    ./hyprlock
    ./kitty
    ./wlogout
    ./wlsunset
    ./anyrun
    ./snowy-shell
    ./avizo
  ];
  config = mkIf cfg.enable {
    services = {
      hypridle.enable = true;
      wlsunset.enable = true;
      avizo.enable = true;
    };
    programs = {
      anyrun.enable = true;
      kitty.enable = true;
      wlogout.enable = true;
      hyprlock.enable = true;
      snowy-shell.enable = true;
    };
    home.packages = [ pkgs.wl-clipboard-rs ];
  };
}
