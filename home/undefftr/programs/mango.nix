{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.mango.hmModules.mango
  ];
  wayland.windowManager.mango = {
    enable = true;

    settings = {
      borderpx = 4;
      tag_num = 9;
      
      
      bind = [
        "SUPER,r,reload_config"
        "SUPER,space,spawn,fuzzel"
        "SUPER+SHIFT,Return,spawn,alacritty"
        "SUPER,j,focusstack,next"
        "SUPER,k,focusstack,prev"
        "SUPER,i,incnmaster,+1"
        "SUPER,d,incnmaster,-1"
        "SUPER,Return,zoom"
        "SUPER,q,killclient"

        "SUPER,1,view,1"
        "SUPER,2,view,2"
        "SUPER,3,view,3"
        "SUPER,4,view,4"
        "SUPER,5,view,5"
        "SUPER,6,view,6"
        "SUPER,7,view,7"
        "SUPER,8,view,8"
        "SUPER,9,view,9"
        "SUPER+CTRL,1,toggleview,1"
        "SUPER+CTRL,2,toggleview,2"
        "SUPER+CTRL,3,toggleview,3"
        "SUPER+CTRL,4,toggleview,4"
        "SUPER+CTRL,5,toggleview,5"
        "SUPER+CTRL,6,toggleview,6"
        "SUPER+CTRL,7,toggleview,7"
        "SUPER+CTRL,8,toggleview,8"
        "SUPER+CTRL,9,toggleview,9"
        "SUPER+SHIFT,1,tag,1"
        "SUPER+SHIFT,2,tag,2"
        "SUPER+SHIFT,3,tag,3"
        "SUPER+SHIFT,4,tag,4"
        "SUPER+SHIFT,5,tag,5"
        "SUPER+SHIFT,6,tag,6"
        "SUPER+SHIFT,7,tag,7"
        "SUPER+SHIFT,8,tag,8"
        "SUPER+SHIFT,9,tag,9"
        "SUPER+CTRL+SHIFT,1,toggletag,1"
        "SUPER+CTRL+SHIFT,2,toggletag,2"
        "SUPER+CTRL+SHIFT,3,toggletag,3"
        "SUPER+CTRL+SHIFT,4,toggletag,4"
        "SUPER+CTRL+SHIFT,5,toggletag,5"
        "SUPER+CTRL+SHIFT,6,toggletag,6"
        "SUPER+CTRL+SHIFT,7,toggletag,7"
        "SUPER+CTRL+SHIFT,8,toggletag,8"
        "SUPER+CTRL+SHIFT,9,toggletag,9"
        "SUPER+SHIFT,S,spawn_shell,g=$(slurp -d) && [ -n \"$g\" ] && grim -g \"$g\" - | wl-copy"
        "SUPER+SHIFT,q,quit"
      ];

      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_middle,togglefloating"
        "SUPER,btn_right,moveresize,curresize"
      ];

      blur = 1;
      animations = 1;
      border_radius = 12;
      focused_opacity = 1.0;

      gappih = 20;
      gappoh = 20;
      gappiv = 20;
      gappov = 20;
    };
    extraConfig = ''
      monitorrule = name:^HDMI-A-2$,width:2560,height:1440,refresh:144,x:1920,y:0
      monitorrule = name:^DP-1$,width:1920,height:1080,refresh:60,x:0,y:0
    '';
    autostart_sh = ''
      fcitx5 &
      awww-daemon &
    '';
  };
}
