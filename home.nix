{ config, pkgs, ... }:

{
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    neovim
    dysk
    pastel
    # zenity
    astroterm
  ];

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "Jeff Apczynski";
      user.email = "jeff.apczynski@gmail.com";
      safe = {
        directory = "/etc/nixos";
      };
    };
  };

  home.stateVersion = "26.05";
}
