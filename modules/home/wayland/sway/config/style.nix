{config, ...}: {
  wayland.windowManager.sway = {
    config = {
      fonts = {
        names = ["JetbrainsMono Nerd Font" "UbuntuMono Nerd Font"];
        style = "Semi-Bold";
        size = 13.4;
      };
      focus = {
        followMouse = true;
        newWindow = "smart";
      };
      gaps = {
        outer = 6;
        inner = 4;
      };
      window = {
        titlebar = false;
        border = 0;
      };
      bars = [{command = "${config.programs.waybar.package}/bin/waybar";}];
      output."*".bg = "${config.wallpaperImage} fill";
    };

    extraConfig = ''
      blur false
      blur_passes 4
      blur_radius 4
      blur_ignore_transparent enable

      corner_radius 7

      shadows false
      shadow_blur_radius 70
      shadow_color #202020

      layer_effects "waybar" corner_radius 20
    '';
  };
}
