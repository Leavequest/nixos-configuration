{ config, ... }:

let
  flakeDir = "${config.home.homeDirectory}/nixos-config";
in
{
  programs.bash = {
    enable = true;
    shellAliases = {
      edit-config = "code ${flakeDir}";
      edit-nix = "code ${flakeDir}/hosts/nixos/default.nix";
      edit-home = "code ${flakeDir}/home/default.nix";
      edit-flake = "code ${flakeDir}/flake.nix";
      nrs = "sudo nixos-rebuild switch --flake ${flakeDir}#nixos";
      nrt = "sudo nixos-rebuild test --flake ${flakeDir}#nixos";
    };
  };
}
