{
  pkgs,
  inputs,
  system,
  ...
}:
let
  plugins = inputs.anyrun.packages.${system};
in
{
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    package = pkgs.anyrun;
    config = {
      plugins = with plugins; [
        rink
        shell
        applications
        dictionary
      ];

      width.fraction = 0.64;
      y.absolute = 310;
      hidePluginInfo = true;
      closeOnClick = true;
    };
    extraCss = builtins.readFile ./style.css;

    extraConfigFiles = {
      "shell.ron".text = ''
        Config(
          prefix: ":sh",
          shell: None,
        )
      '';
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
        )
      '';
    };
  };
}
