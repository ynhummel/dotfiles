{ pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 0;
          y = 0;
        };
        decorations = "buttonless";
        opacity = 0.95;
      };

      font = {
        size = 16.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
        };
      };

      colors = {
        draw_bold_text_with_bright_colors = true;
      };
    };
  };  
}

