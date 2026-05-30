{ pkgs, inputs, ... }:

let
    dwmPkg = inputs.dwm.packages.${pkgs.system}.default;
    dwmSession = pkgs.writeTextFile {
        name = "dwm-session";
        destination = "/share/xsessions/dwm.desktop";
        text = ''
            [Desktop Entry]
            Name=DWM
            Comment=Dynamic Window Manager
            Exec=${dwmPkg}/bin/dwm
            Type=Application
        '';
        passthru.providedSessions = [ "dwm" ];
    };
in
{
    services.xserver.enable = true;
    environment.systemPackages = with pkgs; [
        dwmPkg
        xorg.xorgserver
        xorg.xinit
        xorg.xsetroot
        xorg.xrandr
        xorg.xset
        xorg.xprop
        xorg.xmodmap
    ];

    services.displayManager.sessionPackages = [ dwmSession ];
}
