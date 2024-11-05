{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
    ./config
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings.environment = {
      QT_QPA_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "true";
      DISPLAY = ":0";
    };
  };
}
