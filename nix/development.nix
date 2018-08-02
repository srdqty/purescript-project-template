let
  pkgs = import ./nixpkgs-pinned {};
in
pkgs.stdenv.mkDerivation {
  name = "purescript-project-template-development";

  buildInputs = [
    pkgs.ncurses # Needed by the bash-prompt.sh script
    pkgs.nodePackages.pulp
    pkgs.nodejs
    pkgs.purescript
    pkgs.psc-package
    #pkgs.nodePackages.node2nix
  ];

  shellHook = builtins.readFile ./bash-prompt.sh + ''
    source ${pkgs.git}/etc/bash_completion.d/git-prompt.sh
    source ${pkgs.git}/etc/bash_completion.d/git-completion.bash
  '';
}
