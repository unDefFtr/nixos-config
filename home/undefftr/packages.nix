{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    htop
    ranger
    qq
    microsoft-edge
    fastfetch
    github-copilot-cli
    kdePackages.ark
    zip
    unzip
    # winbox
    tmux
    cc-switch
    splayer-next
    feishu
    # wechat
    inputs.omp.packages.${pkgs.stdenv.hostPlatform.system}.omp
  ];
}

