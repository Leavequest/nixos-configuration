{ config, pkgs, ... }:

{
  # Proprietary NVIDIA driver (the GPU was running on nouveau, which is very slow)
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # RTX 3060 Mobile (Ampere) is supported by the open kernel modules
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Intel iGPU drives the display, NVIDIA renders on demand via `nvidia-offload <cmd>`
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  boot.blacklistedKernelModules = [ "nouveau" ];
}
