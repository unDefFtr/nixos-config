{ config, pkgs, lib, ... }:

{
    services.displayManager.defaultSession = lib.mkForce "plasma";
}
