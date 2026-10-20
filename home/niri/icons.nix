# Custom app icons (niri entry only).
{
  xdg.desktopEntries.vesktop = {
    name = "Vesktop";
    genericName = "Internet Messenger";
    comment = "Alternative Discord client with Vencord built-in";
    exec = "vesktop %U";
    icon = "${./icons/vesktop.png}";
    categories = [ "Network" "InstantMessaging" "Chat" ];
    settings.StartupWMClass = "Vesktop"; # keeps the dock matching the running window
  };
}