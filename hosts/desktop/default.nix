# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, hostname, ... }:

{
  imports = [
    ./bluetooth-class.nix
    ./hardware-configuration.nix
    ./xbox-controller.nix
    ./bluetooth-headset.nix
  ];

  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      copyKernels = false;
      extraEntries = ''
        menuentry "Bazzite" --class fedora {
          insmod chain
          search --no-floppy --fs-uuid --set=root E1E7-1988
          chainloader /EFI/fedora/grubx64.efi
      }
      '';
    };
    efi.canTouchEfiVariables = true;
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    powerManagement.enable = true;
    modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];

  networking.hostName = hostname;
}
