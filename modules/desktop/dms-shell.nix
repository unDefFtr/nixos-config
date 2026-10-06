{ pkgs, inputs, ... }:

{
  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      # DMS owns the notification bus; do not start it alongside Plasma.
      target = "mango-session.target";
      restartIfChanged = true;
    };
    
  };
}
