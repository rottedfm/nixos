{ config, pkgs, ... }:

{
  services.mullvad-vpn.enable = true;

  systemd.services.mullvad-vpn = {
    description = "Mullvad VPN Service";
    wantedBy = [ "multi-user.target"];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.mullvad-vpn}/bin/mullvad connect";
      Restart = "on-failure";
    };
  };
}
