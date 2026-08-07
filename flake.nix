{
  description = "NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    nixosConfigurations.nixos-macbook = nixpkgs.lib.nixosSystem {
      specialArgs = {
        hostname = "nixos-macbook";
        inherit inputs;
      };

      modules = [
        ./configuration.nix
        ./hosts/macbook
      ];
    };

    nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        hostname = "nixos-desktop";
        inherit inputs;
      };

      modules = [
        ./configuration.nix
        ./niri.nix
        ./hosts/desktop
      ];
    };
  };
}
