# niri + Noctalia desktop (system side).
# Imported only by the `niri` specialisation in hosts/nixos/default.nix,
# so the default boot entry stays on KDE Plasma.
{ lib, pkgs, ... }:

{
  # Replace Plasma + SDDM in this boot entry
  services.desktopManager.plasma6.enable = lib.mkForce false;
  services.displayManager.sddm.enable = lib.mkForce false;

  # Compositor (nixpkgs module: session, portals, gnome-keyring)
  programs.niri.enable = true;

  # Shell (bar, dock, launcher, notifications, lock screen, OSD)
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true; # bluetooth, upower, power-profiles-daemon
  };

  # Login screen styled like Noctalia (runs on greetd)
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordlessSyncUsers = [ "leave" ]; # lets the greeter copy your shell's look
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite # X11 apps (Steam, games); niri starts it on demand
    papirus-icon-theme
    bibata-cursors
  ];

  fonts.packages = [ pkgs.jetbrains-mono ];

  home-manager.users.leave.imports = [ ../home/niri ];
}
