{pkgs, ...}: let
  inherit (pkgs) writeShellApplication;
  runtimeInputs = with pkgs; [nh git nixVersions.latest bash];
  home-switch = "nh home switch -- -j 12 --cores 12 --keep-going";
  os-switch = "nh os switch -- -j 12 --cores 12 --keep-going";
in {
  home.packages = [
    (writeShellApplication {
      name = "nh-home-upgrade";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
        ${home-switch}
      '';
    })
    (writeShellApplication {
      name = "nh-system-upgrade";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
        ${os-switch}
      '';
    })
    (writeShellApplication {
      name = "nh-full-upgrade";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
        ${os-switch}
        ${home-switch}
      '';
    })
    (writeShellApplication {
      name = "nh-full-switch";
      inherit runtimeInputs;
      text = ''
        git push
        ${os-switch}
        ${home-switch}
      '';
    })
    (writeShellApplication {
      name = "nix-flake-push";
      inherit runtimeInputs;
      text = ''
        nix flake update --commit-lock-file
        git push
      '';
    })
  ];
}
