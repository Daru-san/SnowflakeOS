{pkgs, ...}: let
  inherit (pkgs) fishPlugins;
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
      set fish_greeting
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      ${pkgs.trashy}/bin/trashy completions fish | source
      ${pkgs.rqbit}/bin/rqbit -v error completions fish | source
    '';
    functions = {
      zcalc = ''${pkgs.zsh}/bin/zsh -c 'autoload zcalc && zcalc "$@"' zcalc "$argv"'';
      cd-gitroot = ''cd "$(git rev-parse --show-toplevel)"'';
      git-root = ''echo "Git root is $(git rev-parse --show-toplevel)"'';
      zc = ''
        z "$1"
        clear
      '';
      # From https://github.com/fdw/yazi-zoxide-zsh
      zy = ''
        if [ "$1" != "" ]; then
          if [ -d "$1" ]; then
            yazi "$1"
          else
            yazi "$(zoxide query $1)"
          fi
        else
          yazi
        fi
        return $?
      '';
      zmv = ''${pkgs.zsh}/bin/zsh -c 'autoload zmv && zmv "$@"' zmv "$argv"'';
    };
    shellAbbrs = {
      gcl = "git clone";
      gbr = "git branch";
      gre = "git remote";
      gst = "git status";
      gps = "git push";
      gpl = "git pull";
      gsw = "git switch";
      gin = "git init";
      gft = "git fetch";
      grt = "git-root";
      cgrt = "cd-gitroot";
      c = "clear";
      r = "reset";
      nhp = "nohup";
      hycl = "hyprctl";
      hyprv = "hyprctl version";
      hypr = "Hyprland";
      hyprld = "hyprctl reload";
      rf = "rm -rf";
      tp = "trashy put";
      tls = "trashy list | bat";
      trs = "trashy-restore";
      tra = "trashy restore --all";
      te = "trashy-empty";
      tea = "trashy empty --all";
      yz = "yazi";
      ntc = "nitch";
      lzg = "lazygit";
      syst = "systemctl-tui";
      v = "vi";
      nl = "nurl";
      npg = "nix-prefetch-git";
      npgh = "nix-prefetch-github";
      npu = "nix-prefetch-url";
      bs = "bash";
      nfdl = "nix flake update --commit-lock-file";
      nfd = "nix flake update";
      nbld = "nix build";
      nsh = "nix shell";
      nfl = "nix flake";
      nup = "nix-update";
      nrv = "nixpkgs-review";
      nit = "nix-init";
      nmt = "nix-fmt";
      nhc = "nh clean";
      ff = "fastfetch";
      nhu = "nh-home-upgrade";
      nsu = "nh-system-upgrade";
      nfu = "nh-full-upgrade";
      nfp = "nix-flake-push";
      nos = "nh os switch -- -j 12 --keep-going --cores 12";
      nhs = "nh home switch -- -j 12 --keep-going --cores 12";
      nfs = "nh-full-switch";
      nob = "nh os boot -- -j 12 --keep-going --cores 12";
      su = "sudo";
      rqd = "rqbit download";
    };
    plugins = [
      {
        name = "transient-fish";
        inherit (fishPlugins.transient-fish) src;
      }
      {
        name = "sponge";
        inherit (fishPlugins.sponge) src;
      }
      {
        name = "done";
        inherit (fishPlugins.done) src;
      }
      {
        name = "forgit";
        inherit (fishPlugins.forgit) src;
      }
      {
        name = "fzf-fish";
        inherit (fishPlugins.fzf-fish) src;
      }
      {
        name = "fzf";
        inherit (fishPlugins.fzf) src;
      }
      {
        name = "puffer";
        inherit (fishPlugins.puffer) src;
      }
      {
        name = "pisces";
        inherit (fishPlugins.pisces) src;
      }
    ];
  };
}
