{ config, pkgs, ...}:

{
  # AMD
  boot.initrd.kernelModules = [ "amdgpu" ];
  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
