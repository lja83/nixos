{ config, pkgs, lib, inputs, ... }:

{
  disabledModules = [ "programs/wayland/mangowc.nix" ];

  imports = [
    "${inputs.nixpkgs-unstable}/nixos/modules/programs/wayland/mango.nix"
  ];

  programs.mango = {
    enable = true;
    package = pkgs.unstable.mango;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    foot
    fuzzel
    pavucontrol
    swaylock
    wev
  ];

  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  programs.waybar = {
    enable = true;
    systemd.target = "mango.service";
  };
}
