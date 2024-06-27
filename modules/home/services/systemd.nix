{pkgs, ...}: {
  systemd.user.services = {
    rqbit-server = {
      Service = {
        ExecStart = "${pkgs.rqbit}/bin/rqbit server start Downloads/Torrents";
      };
      Install = {WantedBy = ["default.target"];};
    };
    swww-daemon = {
      Service = {
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
      };
      Install = {WantedBy = ["graphical-session.target"];};
    };
  };
}
