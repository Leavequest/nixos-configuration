{ pkgs, ... }:

{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # Development & system
    vscode
    git
    wget
    fastfetch
    foot
    nautilus

    # Apps
    vesktop
    brave-origin
  ];
}
