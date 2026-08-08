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
  ];

  programs.waybar = {
    enable = true;
    systemd.target = "mango.service";
  };
}
