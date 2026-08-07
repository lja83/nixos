{ config, pkgs, lib, ... }:

{
  imports = [
  ];

  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };
}
