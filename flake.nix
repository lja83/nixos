{
  description = "NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos-macbook = nixpkgs.lib.nixosSystem {
      modules = [
        ./macbook/configuration.nix
      ];
    };

    nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
      modules = [
        ./desktop/configuration.nix
      ];
    };
  };
}
