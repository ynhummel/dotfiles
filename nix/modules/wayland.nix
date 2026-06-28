{ pkgs, ...}: {
  home.packages = with pkgs; [
    # Compositor
    niri

    # Tools
    xwayland-satellite    # For X11 compatibility
    waybar                # Status Bat
    swaybg                # Backgroud Image
    networkmanagerapplet  # Manage Networks
    pavucontrol           # Manage Audio
    mako                  # Notification system
    fuzzel                # App launcher
    brightnessctl         # Manage brightness
    
    # Does not work in non-NixOS systems
    # swaylock-effects      # LockScreen

    # Screenshot utils (Niri does not need)
    # grim
    # slurp
    # swappy
  ];
}    
