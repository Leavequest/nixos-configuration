{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "nixos";

  # Secondary NTFS drive
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/DA443C84443C6603";
    fsType = "ntfs3";
    options = [ "nosuid" "nodev" "nofail" "uid=1000" "gid=100" "dmask=027" "fmask=137" ];
  };

  # Do not change after the initial install (see `man configuration.nix`).
  system.stateVersion = "26.05";
}
