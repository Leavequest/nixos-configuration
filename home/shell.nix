{ config, ... }:

let
  flakeDir = "${config.home.homeDirectory}/nixos-config";
in
{
  programs.bash = {
    enable = true;
    shellAliases = {
      edit-config = "code ${flakeDir}";
      nrs = "sudo nixos-rebuild switch --flake ${flakeDir}#nixos";
      nrt = "sudo nixos-rebuild test --flake ${flakeDir}#nixos";
    };
  };
}
