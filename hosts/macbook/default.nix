# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      copyKernels = false;
      extraEntries = ''
        menuentry "Bazzite" --class fedora {
          insmod chain
          search --no-floppy --fs-uuid --set=root 31C1-2B9B
          chainloader /EFI/fedora/grubx64.efi
        }
      '';
    };
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.18.35"
    "broadcom-sta-6.30.223.271-59-6.18.38"

  ];
  boot.kernelModules = lib.mkAfter [ "wl" ];
  boot.extraModulePackages = lib.mkAfter [ config.boot.kernelPackages.broadcom_sta ];
  boot.blacklistedKernelModules = lib.mkAfter [ "b43" "bcma" "brcmfmac" "brcmsmac" "ssb" ];

  networking.hostName = hostname;
}
