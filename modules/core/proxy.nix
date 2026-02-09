{ pkgs, lib, ... }:

{
  security.polkit.enable = true;

  security.wrappers.flclash = {
    owner = "root";
    group = "root";
    capabilities = "cap_net_bind_service,cap_net_raw,cap_net_admin=+ep";
    source = "${pkgs.flclash}/bin/FlClash";
  };

  environment.systemPackages = with pkgs; [
    flclash
  ];
}
