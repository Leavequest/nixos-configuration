# niri + Noctalia desktop (user side). Only active in the `niri` boot entry.
{ config, lib, ... }:

let
  flakeDir = "${config.home.homeDirectory}/nixos-config";
in
{
  imports = [
    ./niri.nix
    ./noctalia.nix
    ./ghostty.nix
    ./foot.nix
  ];

  # Icons for the dock/launcher (Plasma's Breeze icons aren't installed here).
  # Plasma resets this to its own theme when you log back into it.
  dconf.settings."org/gnome/desktop/interface" = {
    icon-theme = "Papirus-Dark";
    color-scheme = "prefer-dark";
  };

  # Inside this boot entry, rebuild into the same entry instead of
  # switching the running session back to the Plasma config.
  programs.bash.shellAliases = {
    nrs = lib.mkForce "sudo nixos-rebuild switch --flake ${flakeDir}#nixos --specialisation niri";
    nrt = lib.mkForce "sudo nixos-rebuild test --flake ${flakeDir}#nixos --specialisation niri";
  };

  # Shared palette, exposed to the other files as `palette`
  _module.args.palette = (lib.importJSON ./indigo.json).dark;
}
