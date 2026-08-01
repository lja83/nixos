{ config, pkgs, lib, ... }:

{
  imports = [
  ];

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
}
