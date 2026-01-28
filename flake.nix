{
  description = "Felipe's NixOS Configuration";

  inputs = {
    # O canal instável (rolling release) que você já usa (25.11 base)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # "nixos" é o hostname definido na sua config antiga
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/default/configuration.nix
          ./modules/packages.nix
        ];
      };
    };
  };
}
