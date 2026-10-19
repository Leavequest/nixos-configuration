{ lib, ... }:

{
  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = lib.genAttrs [
    "LC_ADDRESS"
    "LC_IDENTIFICATION"
    "LC_MEASUREMENT"
    "LC_MONETARY"
    "LC_NAME"
    "LC_NUMERIC"
    "LC_PAPER"
    "LC_TELEPHONE"
    "LC_TIME"
  ] (_: "it_IT.UTF-8");

  services.xserver.xkb = {
    layout = "it,us"; # Italian first, US English second
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  console.keyMap = "it"; # TTY / early boot
}
