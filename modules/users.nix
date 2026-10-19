{ pkgs, ... }:

{
  users.users.leave = {
    isNormalUser = true;
    description = "Claudio Loffreno";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ tree ];
  };

  services.getty.autologinUser = "leave";
}
