{
  programs.noctalia = {
    enable = true;
    customPalettes.indigo = ./indigo.json;

    # Validated with `noctalia config validate` at build time.
    # Changes made in Noctalia's settings GUI are saved on top of this
    # in ~/.local/state/noctalia/settings.toml.
    settings = {
      shell = {
        font_family = "JetBrains Mono";
        polkit_agent = true; # no Plasma agent in this session
        niri_overview_type_to_launch_enabled = true;
        panel.transparency_mode = "soft";
      };

      theme = {
        mode = "dark";
        source = "custom";
        custom_palette = "indigo";
      };

      # Blurred wallpaper behind niri's overview (see layer-rule in niri.nix)
      backdrop = {
        enabled = true;
        blur_intensity = 0.6;
        tint_intensity = 0.35;
      };

      bar.main = {
        position = "top";
        thickness = 32;
        background_opacity = 0.8;
        radius = 12;
        margin_ends = 12;
        margin_edge = 8;
        start = [ "launcher" "workspaces" ];
        center = [ "clock" ];
        end = [ "media" "tray" "notifications" "network" "bluetooth" "volume" "battery" "control-center" ];
      };

      dock = {
        enabled = true;
        position = "bottom";
        icon_size = 44;
        background_opacity = 0.75;
        auto_hide = true;
        magnification = true;
        magnification_scale = 1.4;
        show_running = true;
        show_dots = true;
        pinned = [
          "firefox"
          "org.gnome.Nautilus"
          "foot"
          "code"
          "vesktop"
          "steam"
        ];
      };

      lockscreen.blurred_desktop = true;

      idle.behavior = {
        lock = {
          enabled = true;
          timeout = 600;
          action = "lock";
        };
        screen-off = {
          enabled = true;
          timeout = 660;
          action = "screen_off";
        };
      };
    };
  };
}
