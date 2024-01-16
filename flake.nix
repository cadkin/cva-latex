{
    description = "LaTeX pdf template";

    inputs = {
        nixpkgs.url = github:NixOS/nixpkgs;
        utils.url = github:numtide/flake-utils;
    };

    outputs = attrs @ { self, nixpkgs, utils, ... }: utils.lib.eachDefaultSystem (system: rec {
        pkgs = import attrs.nixpkgs {
            inherit system;
        };

        packages = rec {
            default = cva.latex-template;

            cva = {
                latex-template = pkgs.stdenv.mkDerivation rec {
                    pname = "latex-template";
                    version = "1.0-" + (builtins.substring 0 8 (if (self ? rev) then self.rev else "dirty"));

                    src = self;

                    buildInputs = [
                        pkgs.texlive.combined.scheme-full
                    ];

                    installPhase = ''
                        mkdir $out
                        cp target.pdf $out
                    '';

                    XDG_CACHE_HOME="/build/cache";

                    meta = {
                        description = "A simple LaTeX template for writing documents";
                        homepage = "https://github.com/cadkin/cva-latex";
                        license = "MIT";
                        platforms = utils.lib.defaultSystems;
                    };
                };
            };
        };

        devShells = rec {
            default = latex-template-dev;

            # Main developer shell.
            latex-template-dev = pkgs.mkShell rec {
                name = "latex-template-dev";

                packages = [
                    pkgs.gnumake
                    pkgs.zathura
                ] ++ self.outputs.packages.${system}.cva.latex-template.buildInputs;

                nativeBuildInputs = [
                    # NOP
                ];
            };
        };
    });
}
