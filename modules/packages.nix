{ pkgs, ... }:

{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # Development & system
    vscode
    git
    wget
    fastfetch
    ghostty
    nautilus
    claude-code
    btop
    evtest
    termius

    # Apps
    vesktop
    brave-origin
  ];
}
