{ pkgs, inputs, ... }:

{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.udev.packages = [ pkgs.headsetcontrol ];

  environment.systemPackages = with pkgs; [
    easyeffects
    deepfilternet # ML noise filter
    headsetcontrol
    pavucontrol
    inputs.sonora.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
