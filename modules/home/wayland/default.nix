{
  imports = [
    ./common
    ./niri
  ];
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    DISPLAY = ":0";
  };
}
