{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    zsh.enable =
      lib.mkEnableOption "enables preconfigured zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      upower
    ];
    programs = {
      starship.enable = true;
      autojump = {
        enable = true;
        enableZshIntegration = true;
      };
      zsh = {
        initExtra = ''
          if [ -z "$TMUX" ]
          then
              tmux new-session -A -s main
          fi
        '';
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
          ns = "home-manager switch -b backup --flake /home/jan/.config/home-manager";
          t = "tmux";
          py = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe python";
          psh = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe";
          v = "nvim";
          y = "yazi";
        };
        oh-my-zsh = {
          enable = true;
          theme = "robbyrussell";
          plugins = [
            "git"
            "npm"
            "history"
            "node"
            "rust"
            "fluxcd"
            "kubectl"
          ];
        };
      };
    };
  };
}
