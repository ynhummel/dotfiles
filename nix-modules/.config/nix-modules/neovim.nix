{ pkgs, ... }: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = false;
    withRuby = false;

    initLua = ''
      require('main')
    '';

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      # friendly-snippets
      # conform-nvim
      # nvim-lint
      mini-nvim
    ];
  };
}
