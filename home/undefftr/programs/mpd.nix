{ pkgs, ... }:

{
    services.mpd = {
        enable = true;
        musicDirectory = "/home/undefftr/Music";
        network.listenAddress = "any";
        extraConfig = ''
            audio_output {
                type "pipewire"
                name "Pipewire Output"
            }
        '';
    };
}
