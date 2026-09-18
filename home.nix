{ lib, pkgs, ...}:
{
    #programs.zsh = {
    #enable = true;
    #};

    home = {
        packages = with pkgs; [
            hello

            # essentials
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

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "26.05";
    };
}

