{ config, pkgs, lib, ... }:

{
  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  programs.waybar = {
    enable = true;
  };
}
