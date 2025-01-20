{pkgs, ...}: {
  home = {
    username = "jan";
    homeDirectory = "/home/jan";
    stateVersion = "24.11"; # Please read the comment before changing.
  };

  imports = [
    ./modules
  ];

  zsh.enable = true;
  tmux.enable = true;
  yazi.enable = true;

  home.packages = with pkgs; [
    nvf
    pyenv
    typst
    htop
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
