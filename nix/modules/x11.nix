{ pkgs, ...}: {
  home.packages = with pkgs; [
    # Window Manager & Compositing
    i3
    picom

    # Tools
    feh                   # Background Image
    networkmanagerapplet  # Manage Networks
    pavucontrol           # Manage Audio
    dunst                 # Notification system
    rofi                  # App launcher
    brightnessctl         # Manage brightness

    # Manage Screen layout
    autorandr             
    arandr

    # Utilities
    maim                  # CLI Screenshot utility
    xclip                 # Command line clipboard integration
  ];

  services.polybar = {
    enable = true;

    script = "polybar main &";
  
    # Tell Nix to install Polybar with i3 and PulseAudio support enabled
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };

    config = {
      "bar/main" = {
        monitor = "\${env:MONITOR:}";
        width = "100%";
        height = 30;
        background = "#222222";
        foreground = "#dfdfdf";

        font-0 = "DejaVu Sans:size=10;2";

        modules-left = "i3";
        modules-center = "date";
        # Added 'tray' to the right side
        modules-right = "pulseaudio network battery tray";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        poll-interval = 5;

        format-charging = "CHG <label-charging>";
        format-discharging = "BAT <label-discharging>";
        format-full = "FULL <label-full>";

        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "100%";

        format-charging-padding = 2;
        format-discharging-padding = 2;
        format-full-padding = 2;
      };

      # New dedicated Tray module
      "module/tray" = {
        type = "internal/tray";
        format-margin = "8px";
        tray-spacing = "8px";
      };

      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        index-sort = true;
        wrapping-scroll = false;
        pin-workspaces = true;

        label-focused = "[%index%]";
        label-focused-background = "#444444";
        label-focused-padding = 2;
        label-unfocused = "%index%";
        label-unfocused-padding = 2;
        label-visible = "%index%";
        label-visible-padding = 2;
        label-urgent = "%index%!";
        label-urgent-background = "#BD2C40";
        label-urgent-padding = 2;
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%H:%M:%S";
        label = "%date%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        format-volume = "VOL <label-volume>";
        label-volume = "%percentage%%";
        label-muted = "MUTED";
        label-muted-foreground = "#666666";
        format-volume-padding = 2;
        format-muted-padding = 2;
      };

      "module/network" = {
        type = "internal/network";
        interface-type = "wireless"; 
        interval = "3.0";
        format-connected = "NET <label-connected>";
        label-connected = "%essid% (%local_ip%)";
        format-disconnected = "NET off";
        label-disconnected-foreground = "#666666";
        format-connected-padding = 2;
        format-disconnected-padding = 2;
      };
    };
  };
}
