{ config, pkgs, ... }:

{
  home.username = "leave";
  home.homeDirectory = "/home/leave";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      edit-nix = "sudo nano /etc/nixos/configuration.nix";
      edit-home = "sudo nano /etc/nixos/home.nix";
      edit-flake = "sudo nano /etc/nixos/flake.nix";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos";
    };
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
