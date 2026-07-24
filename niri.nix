{ config, pkgs, lib, ... }:

{
  programs.niri.enable = true;

  systemd.user.services.niri.enableDefaultPath = false;

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
  ];

  security.polkit.enable = true;
  security.pam.services.swaylock = {};
  programs.waybar.enable = true;

  programs.ssh.startAgent = false;
}
