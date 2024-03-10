{ config, lib, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.admin = { pkgs, lib, ... }: {
    home.stateVersion = "23.11";

    home.packages = with pkgs; [
      firefox
      btop
    ];

    programs.bash.enable = true;
    programs.bash.shellAliases = { 
      sw = "sudo nixos-rebuild switch --flake .";
      la = "ls -lah";
      gs = "git status";
      ga = "git add .";
      gf = "git fetch";
      gam = "git add . && git commit -m";
    };

    programs.git = {
      enable = true;
      userEmail = "jonathan+jvecql@scopopop.com";
      userName = "JVECQL";
    };

    programs.vim = {
      enable = true;
      extraConfig = ''
        set nocompatible
        set tabstop=2 softtabstop=2 shiftwidth=2
        set expandtab
        set autoindent smartindent
        syntax enable
      '';
    };
  };

  home-manager.users.ben = { pkgs, ... }: {
    home.stateVersion = "23.11";

    home.packages = with pkgs; [
      firefox

      # libreoffice + spellcheck
      libreoffice-qt
      hunspell
      hunspellDicts.fr-any
    ];
  };
}
