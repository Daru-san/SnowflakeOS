{
  imports = [
    ./lazygit.nix
    ./gh.nix
  ];
  programs.git-cliff = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "Daru";
    userEmail = "mica.tui@proton.me";

    extraConfig = {
      core = {
        editor = "vi";
        fileMode = false;
        autocrlf = false;
      };
    };
    # Git highlighting
    diff-so-fancy.enable = true;

    # Git aliases
    aliases = {
      ci = "commit";
      co = "checkout";
      cl = "clone";
      st = "status";
      ad = "add";
      ps = "push";
      pl = "pull";
      re = "remote";
      br = "branch";
      fe = "fetch";
      cp = "cherry-pick";
      rs = "reset";
      df = "diff";
      "in" = "init";
      sw = "switch";
    };
  };
}
