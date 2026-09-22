{ lib, pkgs, ...}:
{
    programs.zsh = {
        enable = true;

        initContent = ''
            bindkey -M emacs '\e[1;3D' backward-word
            bindkey -M emacs '\e[1;3C' forward-word
            bindkey -M viins '\e[1;3D' backward-word
            bindkey -M viins '\e[1;3C' forward-word
        '';

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
            ];
            theme = "robbyrussell";
        };

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -al";
            edit = "sudo -e";
            update = "sudo nixos-rebuild switch";
        };

        setOptions = [
            "HIST_IGNORE_ALL_DUPS"
        ];
    };

    # niri config
    xdg.configFile."niri/config.kdl".source = ./configs/niri/config.kdl;

    home = {
        packages = with pkgs; [
            # essentials
            home-manager
            git
            ripgrep

            # WM
            waybar
            fuzzel
            swaybg
            xwayland-satellite
            wl-clipboard
            pavucontrol
            brightnessctl
            networkmanagerapplet
        ];

        sessionVariables = {
            EDITOR = "nvim";
            VISUAL = "nvim";
            BROWSER = "firefox";
            TERMINAL = "kitty";
        };

        sessionPath = [
            # For adding to PATH
        ];

        username = "doaads";
        homeDirectory = "/home/doaads";

        # Do not change
        stateVersion = "26.05";
    };

    nixpkgs.config.allowUnfree = true;

}

