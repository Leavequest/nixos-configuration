# Ghostty with colors from the shared indigo palette, set here rather than by
# Noctalia's runtime template so they don't leak into the Plasma session.
{ palette, ... }:

let
  t = palette.terminal;
  names = [ "black" "red" "green" "yellow" "blue" "magenta" "cyan" "white" ];

  # Ghostty wants "N=#rrggbb" entries: 0-7 normal, 8-15 bright
  paletteEntries =
    (builtins.genList (i: "${toString i}=${t.normal.${builtins.elemAt names i}}") 8)
    ++ (builtins.genList (i: "${toString (i + 8)}=${t.bright.${builtins.elemAt names i}}") 8);
in
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 11;
      window-padding-x = 14;
      window-padding-y = 14;

      background-opacity = 0.88;
      background-blur = true;

      background = t.background;
      foreground = t.foreground;
      cursor-color = t.cursor;
      cursor-text = t.cursorText;
      selection-background = t.selectionBg;
      selection-foreground = t.selectionFg;
      palette = paletteEntries;

      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
      ];
    };
  };
}