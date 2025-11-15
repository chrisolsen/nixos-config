{ config, pkgs, ...}:

{
  home.username = "chris";
  home.homeDirectory = "/home/chris";
 
  home.packages = with pkgs; [

    # apps
    qutebrowser
    chezmoi # config manager
    syncthing  # sync files with other machines
    fastfetch  # successor of neofetch
    yazi  # terminal file manager
    slurp  # screen grabs
    glow # markdown previewer in terminal
    fuzzel
    rofi-wayland

    # media
    mpv
    mpd

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
    fd            # find
    wl-clipboard  # clipboard selector
    mako          # wayland notification daemon
    marksman      # markdown lsp
    libnotify     # notify-send
    swaybg        # background image
    ripgrep       # recursively searches directories for a regex pattern
    jq            # lightweight and flexible command-line JSON processor
    eza           # modern replacement for ‘ls’
    fzf           # command-line fuzzy finder
    file
    which
    tree
    btop          # replacement of htop/nmon
    iotop         # io monitoring
    iftop         # network monitoring
    lsof          # list open files

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

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
      background-opacity = 0.95;
      background-blur = true;
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
      export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts"
      eval "$(zoxide init bash)"
    '';

    shellAliases = {
      neofetch = "fastfetch";
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;  
  };

  home.stateVersion = "25.05";
}
