{ pkgs, ... }:

{
  virtualisation.vmware.host.enable = true;
  virtualisation.vmware.guest.enable = true;

  environment.systemPackages = with pkgs; [
    vmware-workstation
  ];

  # Optional: Add your user to the vmware group (if needed)
  # users.users.triomph.extraGroups = [ "vmware" ];
}
