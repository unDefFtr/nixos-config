{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-25.11&shallow=1";
    home-manager = {
      url = "git+https://gitee.com/mirrors/home-manager-nix.git?ref=release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dw-proton.url = "github:imaviso/dwproton-flake";
    awww.url = "git+https://codeberg.org/LGFae/awww";
  };

  outputs = { self, nixpkgs, home-manager, dw-proton, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/undefpc/default.nix

        ({ ... }: {
          nixpkgs.config.allowUnfree = true;
        })

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
    
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };

          home-manager.users.undefftr =
            import ./home/undefftr/default.nix;
        }
      ];
    };
  };
}

