{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./fish
    ./extras.nix
    ./starship
    ./nix-index
  ];

  programs.bash = {
    enable = true;
    historyFile = "${config.xdg.dataHome}/bash/history";
    historySize = 10000;
    historyControl = [
      "erasedups"
      "ignorespace"
    ];
  };

  # Global shell aliases
  home.shellAliases =
    let
      bat = "${config.programs.bat.package}/bin/bat";
      git = "${config.programs.git.package}/bin/git";
      firefox = "${lib.getExe config.programs.firefox.package}";
      lazygit = "${config.programs.lazygit.package}/bin/lazygit";
      tty-clock = "${pkgs.tty-clock}/bin/tty-clock";
      trashy = "${pkgs.trashy}/bin/trashy";
      fzf = "${config.programs.fzf.package}/bin/fzf";
    in
    {
      g = git;
      lg = lazygit;
      clock = "${tty-clock} -bscBrnS";
      nb = "nix-rebuild";
      hb = "hm-build";
      tp = "${trashy} put";
      te = "${trashy} empty";
      jtp = ''find $1 -name "*.jpg" -exec mogrify -format png {} \;'';
      man = "${pkgs.bat-extras.batman}/bin/batman";
      bgrep = "${pkgs.bat-extras.batgrep}/bin/batgrep";
      cat = bat;
      trashy-empty = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} empty --match=exact --force";
      trashy-restore = "${trashy} list | ${fzf} --multi | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${trashy} restore --match=exact --force";
      inherit firefox;
      zc = "clear && z";
    };
}
