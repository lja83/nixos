{ config, pkgs, lib, hostname, ... }:

{
  imports = [
    ./bluetooth-class.nix
    ./xbox-controller.nix
    ./bluetooth-headset.nix
  ];

  hardware.bluetooth.settings.General.Class = config.my.bluetooth.class;
}
