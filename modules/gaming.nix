{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
  };
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;
  hardware.uinput.enable = true;  

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    prismlauncher
  ];
}
