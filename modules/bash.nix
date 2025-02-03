{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    bash.enable =
      lib.mkEnableOption "enables preconfigured bash";
  };

  config = lib.mkIf config.bash.enable {
    home.packages = with pkgs; [
      upower
    ];

    programs = {
      starship.enable = true;

      autojump = {
        enable = true;
        enableBashIntegration = true;
      };

      bash = {
        enable = true;
        initExtra = ''
          # TMUX auto-attach
          if [ -z "$TMUX" ]; then
              tmux new-session -A -s main
          fi
        '';

        shellAliases = {
          ns = "home-manager switch -b backup --flake /home/jan/.config/home-manager";
          t = "tmux";
          py = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe python";
          psh = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe";
          v = "nvim";
          y = "yazi";
        };

        shellOptions = [
          "checkwinsize"
          "histappend"
          "cmdhist"
          "globstar"
        ];
        historyControl = ["ignoredups" "ignorespace"];
        historyIgnore = ["ls" "cd" "exit"];
      };
    };
  };
}
