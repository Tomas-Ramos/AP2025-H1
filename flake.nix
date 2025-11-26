{
  description = "Shell for ALC proj1";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # change if you're on aarch64-darwin, etc.
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          open-wbo
          (python3.withPackages (ps: with ps; [
            jupyter
            sklearn-compat
	    matplotlib
	    torch
          ]))
        ];

        shellHook = ''
          echo "Entered shell for Deep Learning"
        '';
      };
    };
}
