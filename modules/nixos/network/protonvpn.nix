{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    proton-vpn
  ];

  systemd.user.services.protonvpn = {
    description = "Proton VPN GUI";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.proton-vpn}/bin/protonvpn-app";
      Restart = "on-failure";
    };
  };
}
