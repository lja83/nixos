{ config, pkgs, ... }:

{
  home.username = "jeff";
  home.homeDirectory = "/home/jeff";

  home.packages = with pkgs; [
    neovim
    dysk
    pastel
    zenity
    astroterm
  ];

  programs.git = {
    enable = true;
    userName = "Jeff Apczynski";
    userEmail = "jeff.apczynski@gmail.com";
  };

  home.stateVersion = "26.05";
}
