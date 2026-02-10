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

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    mkHost = hostPath: nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = [
        hostPath

        # 全局策略：所有机器共用
        ({ ... }: {
          nixpkgs.config.allowUnfree = true;
        })

        # Home Manager 注入：所有机器共用
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
  in
  {
    nixosConfigurations = {
      undefpc = mkHost ./hosts/undefpc/default.nix;
      testvm = mkHost ./hosts/testvm/default.nix;
    };
  };
}

