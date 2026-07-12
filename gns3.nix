{ config, pkgs, lib, ... }:

{
  environment.systemPackages = [
    gns3-gui
    gns3-server
    dynamips
    ubridge
    vpcs
  ];

  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw=ep";
  };

  user.users.jeff = {
    extraGroups = [ "gns3" "ubridge" ];
  };
}
