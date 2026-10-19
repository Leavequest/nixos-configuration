{
  imports = [ ./shell.nix ];

  home.username = "leave";
  home.homeDirectory = "/home/leave";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
