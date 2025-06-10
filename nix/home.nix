{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vk";
  home.homeDirectory = "/Users/vk";

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.htop
    pkgs.bat
    pkgs.delta
    pkgs.fzf
    pkgs.silver-searcher
    pkgs.tmux
    pkgs.gh
    pkgs.source-code-pro
    pkgs.emacs
    pkgs.jq
    pkgs.go
    pkgs.ripgrep
    pkgs.ncurses
    pkgs.git-lfs
    pkgs.kubectl
    pkgs.awscli2
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.pip
      ppkgs.virtualenv
    ]))
    pkgs.pdm
    pkgs.jdk21
    pkgs.k9s
    pkgs.uv
    pkgs.vscode

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vk/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.tmux = {
    enable = true;
    historyLimit = 10000;
    keyMode = "vi";
  };

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
    '';
  };

  programs.vim = {
    enable = true;
    settings = {
      history = 1000;
      number = true;
    };
    extraConfig = ''
       set autoindent
       set backspace=indent,eol,start
       set complete-=i
       set smarttab
       set autoread
       set mouse=a
       set clipboard+=unnamedplus
    '';
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    defaultKeymap = "viins";
    oh-my-zsh.theme = "vein";
    initContent = ''
        bindkey -v
        KEYTIMEOUT=1
        bindkey "^R" history-incremental-search-backward

        # For linux
        bindkey "^[[A" history-beginning-search-backward
        bindkey "^[[B" history-beginning-search-forward

        # For mac
        # bindkey "$terminfo[kcuu1]" history-beginning-search-backward
    '';
  };

}
