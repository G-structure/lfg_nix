{ pkgs, lib, config, ... }:
{
  # Htop
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.htop.enable
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
  };
}
