# Terminal colors from the same palette, set here rather than by Noctalia's
# runtime template so they don't leak into the Plasma session.
{ lib, palette, ... }:

let
  t = palette.terminal;
  hex = lib.removePrefix "#";
  ansi = names: colors: lib.listToAttrs (lib.imap0 (i: n: lib.nameValuePair "${names}${toString i}" (hex colors.${n})) [
    "black" "red" "green" "yellow" "blue" "magenta" "cyan" "white"
  ]);
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono:size=11";
        pad = "14x14";
      };
      colors-dark = {
        alpha = 0.88; # translucent; niri blurs behind it
        foreground = hex t.foreground;
        background = hex t.background;
        selection-foreground = hex t.selectionFg;
        selection-background = hex t.selectionBg;
        cursor = "${hex t.cursorText} ${hex t.cursor}";
      }
      // ansi "regular" t.normal
      // ansi "bright" t.bright;
    };
  };
}
