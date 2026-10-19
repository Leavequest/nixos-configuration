{
  # KDE Plasma 6 (Wayland)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;

  # Make Electron apps (Discord, VS Code, ...) use native Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
