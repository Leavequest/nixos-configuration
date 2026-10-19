{ config, ... }:

let
  flakeDir = "${config.home.homeDirectory}/nixos-config";
in
{
  programs.bash = {
    enable = true;
    shellAliases = {
      edit-nix = "nano ${flakeDir}/hosts/nixos/default.nix";
      edit-home = "nano ${flakeDir}/home/default.nix";
      edit-flake = "nano ${flakeDir}/flake.nix";
      nrs = "sudo nixos-rebuild switch --flake ${flakeDir}#nixos";
      nrt = "sudo nixos-rebuild test --flake ${flakeDir}#nixos";
    };
  };
}
