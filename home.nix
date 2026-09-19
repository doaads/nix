{ lib, pkgs, ...}:
{
    #programs.zsh = {
    #enable = true;
    #};

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

        username = "doaads";
        homeDirectory = "/home/doaads";

        # Do not change
        stateVersion = "26.05";
    };

    nixpkgs.config.allowUnfree = true;

}

