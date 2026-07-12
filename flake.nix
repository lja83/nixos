{
  description = "NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos-macbook = nixpkgs.lib.nixosSystem {
      specialArgs = {
        hostname = "nixos-macbook";
      };

      modules = [
        ./configuration.nix
        ./hosts/macbook
      ];
    };

    nixosConfigurations.nixos-desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        hostname = "nixos-desktop";
      };

      modules = [
        ./configuration.nix
        ./hosts/desktop
      ];
    };
  };
}
