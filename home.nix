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

    programs.kitty = lib.mkForce {
        enable = true;
        settings = {
            confirm_os_window_close = 0;
            dynamic_background_opacity = true;
            enable_audio_bell = false;
            mouse_hide_wait = "-1.0";
            window_padding_width = 1;
            font_family = "FiraCode Nerd Font";
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
        };
        autoThemeFiles = {
            dark = "everforest_dark_medium";
            light = "everforest_dark_medium";
            noPreference = "everforest_dark_medium";
        };
    };

    programs.waybar.enable = true;
    xdg.configFile."waybar/config.jsonc".source = ./configs/waybar/config.jsonc;
    xdg.configFile."waybar/style.css".source = ./configs/waybar/style.css;

    # niri config
    xdg.configFile."niri/config.kdl".source = ./configs/niri/config.kdl;

    home = {
        packages = with pkgs; [
            # essentials
            home-manager
            git
            ripgrep
            kitty

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

