{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    gns3-gui
    gns3-server
    dynamips
    ubridge
    vpcs
    inetutils
  ];

  services.gns3-server = {
    settings = {
      Server = {
        ubridge_path = "${config.security.wrapperDir}/ubridge";
      };
    };
  };

  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw=ep";
  };

  # users.users."jeff" = {
  #   extraGroups = [ "gns3" "ubridge" ];
  # };
}
