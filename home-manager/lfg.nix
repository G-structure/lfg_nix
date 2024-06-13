{ pkgs, ... }:
{
imports = [./headless.nix ./git.nix ./neovim.nix];
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
