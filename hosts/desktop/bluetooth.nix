# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, hostname, ... }:

{
  imports = [
    ./bluetooth-class.nix
    ./xbox-controller.nix
    ./bluetooth-headset.nix
  ];
  hardware.bluetooth.settings.General.Class = my.bluetooth.class
}
