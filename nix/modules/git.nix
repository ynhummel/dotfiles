{pkgs, ...}: {
  programs.git = {
    enable = true;

    settings = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      merge.conflictStyle= "zdiff3";
      
      alias = {
        sw = "switch";
        nb = "checkout -b";
        aa = "add .";
        cm = "commit -m";
        pcurr = "!git push origin $(git branch --show-current)";
        lo = "log --oneline";
        lg = "log --oneline --graph";
        df = "diff";
        dc = "diff --cached";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = "true";
      dark = "true";
      side-by-side = "true";
    };
  };
}
