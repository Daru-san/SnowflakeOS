{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "systemctl --user start niri" ]; }
      { command = [ (lib.getExe pkgs.swww + " img ${config.wallpaperImage}") ]; }
      { command = [ (lib.getExe pkgs.copyq) ]; }
      { command = [ (lib.getExe config.programs.kitty.package) ]; }
      { command = [ (lib.getExe pkgs.xwayland-satellite) ]; }
    ];
  };
}
