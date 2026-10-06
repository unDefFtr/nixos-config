{ pkgs, ... }:

{
  boot.kernelModules = [ "kvm-intel" "kvm-amd" ];
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # 启用 TPM 支持
    };
  };
  environment.systemPackages = with pkgs; [ virt-manager ];
}
