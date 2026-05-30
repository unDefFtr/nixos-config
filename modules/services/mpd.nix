{ pkgs, config, ... }:

{
    services.mpd = {
        enable = true;
        user = "undefftr";
        musicDirectory = "/home/undefftr/Music";
        extraConfig = ''
            audio_output {
                type "pipewire"
                name "PipeWire Output"
            }
        '';
    };
    systemd.services.mpd.environment.XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.undefftr.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
}
