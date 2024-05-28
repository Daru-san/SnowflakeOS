{inputs, ...}: let
  yazi-plugins = inputs.yazi-plugins.inputs;
  getPlugin = x: "${yazi-plugins.${x}.url}";
  setPlugin = x: "yazi/plugins/${x}.yazi";
in {
  xdg.configFile = {
    "yazi/theme.toml".source = "${getPlugin "tokyo-night"}/flavor.toml";
    "${setPlugin "exifaudio"}".source = getPlugin "exifaudio";
    "${setPlugin "glow"}".source = getPlugin "yazi";
    "${setPlugin "mime"}".source = getPlugin "mime";
    "${setPlugin "bat"}".source = getPlugin "bat";
    "${setPlugin "fg"}".source = getPlugin "fg";
  };
}
