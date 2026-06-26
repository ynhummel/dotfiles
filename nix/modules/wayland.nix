{ pkgs, ...}: {
  home.packages = with pkgs; [
    waybar   # Status Bat
    swaybg   # Backgroud Image
    swaylock-effects   # LockScreen
    networkmanagerapplet   # Manage Networks
    pavucontrol   # Manage Audio
    mako # Notification system
    fuzzel   # App launcher
    brightnessctl   # Manage brightness
    nautilus   # File manager

    # # Screenshot utils
    # grim
    # slurp
    # swappy
  ];
}    
