{ pkgs, ...}: {
  home.packages = with pkgs; [
    # Window Manager & Compositing
    i3
    picom

    # Tools
    polybar               # Status Bar
    feh                   # Background Image
    networkmanagerapplet  # Manage Networks
    pavucontrol           # Manage Audio
    dunst                 # Notification system
    rofi                  # App launcher
    brightnessctl         # Manage brightness

    # Lockscreen & Utilities
    maim                  # CLI Screenshot utility
    xclip                 # Command line clipboard integration
  ];
}    
