{ pkgs, ... }:

{
  # KDE Plasma 6 (Wayland)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  # Printing (Brother over USB, Wi-Fi or Ethernet)
  services.printing = {
    enable = true;
    drivers = [
      pkgs.brlaser
      pkgs.brgenml1lpr
      pkgs.brgenml1cupswrapper
    ];
  };

  # Network printer discovery (mDNS/Bonjour)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Make Electron apps (Discord, VS Code, ...) use native Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
