{ config, pkgs, ... }:

{
  systemd.services.loginScreen = {
    description = "Login Screen Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.coreutils}/bin/env /home/rotted/Scripts/login/target/release/login";
      Restart = "on-failure";
    };

  };

  systemd.targets."multi-user".wantedBy = [ "loginScreen.service" ];
}
