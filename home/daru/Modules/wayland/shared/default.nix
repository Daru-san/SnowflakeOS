{pkgs, ...}:{
 imports = [
  ./ags.nix
  ./copyq.nix
  ./kitty.nix
  ./anyrun.nix
  ./kanshi.nix
  ./wlogout.nix
  ./swayidle.nix
  ./swaylock.nix
 ];
 home.packages = with pkgs; [
  swaynotificationcenter
  wl-clipboard
  pavucontrol
 ];
}
