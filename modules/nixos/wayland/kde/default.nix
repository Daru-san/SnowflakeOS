{
  config,
  lib,
  ...
}: let
  cfg = config.wayland.kde;
in
  with lib; {
    options.wayland.kde = {enable = mkEnableOption "Enable KDE";};
    config = mkIf cfg.enable {
      services.xserver = {
        enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma5.enable = true;
      };
    };
  }
