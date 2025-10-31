{ config, pkgs, ...}:

{
  home.username = "chris";
  home.homeDirectory = "/home/chris";
 
  home.packages = with pkgs; [
    fastfetch  # successor of neofetch
    lf  # terminal file manager

    # media
    mpv

    slurp  # screen grabs
    wl-clipboard
    mako
    fd
    marksman # markdown lsp
    rofi-wayland # quick app access
    swaybg  # background
    syncthing  # sync files with other machines
    chezmoi # config manager

    # archives
    zip
    xz
    unzip
    p7zip

    # dev
    tmux
    lazygit
    hyprpicker  # color picker

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    file
    which
    tree
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    lsof # list open files

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    # wireless
    impala
  ];

  programs.git = {
    enable = true;
    userName = "chrisolsen";
    userEmail = "olsen.chris@gmail.com";
  };

  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 12;
      font-family = "JetBrainsMono Nerd Font";
      unfocused-split-opacity = 0.96;
    };

    # keybindings = {
    #   "super+c" = "copy_to_clipboard";     
    #   "super+shift+h" = "goto_split:left";
    #   "super+shift+j" = "goto_split:bottom";
    #   "super+shift+k" = "goto_split:top";
    #   "super+shift+l" = "goto_split:right";
    #   "ctrl+page_up" = "jump_to_prompt:-1";
    # };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      neofetch = "fastfetch";
    };
  };

  home.stateVersion = "25.05";
}
