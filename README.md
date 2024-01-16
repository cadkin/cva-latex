# cva-latex

A simple template for creating LaTeX documents in my personal style.

### Editing
You should add your main content to `target.tex`.

If you need to add new macros or include extra packages, edit `preamble.tex`.

### Compiling PDF

1. Download and install the full LaTeX installation. If you use `nix` with flakes enabled, you can get a full installation by using:
   ```
   $ nix develop
   ```
   This will put you in a dev shell with everything you need to build and show the output.

2. Run the `Makefile` by running `make`. This will create a file called `target.pdf` in the `build` directory.

3. (Optional) Change the preview program in the `Makefile` by editing the `SHOW` variable. You can then type `make show` to open the output with
   your viewer of choice. By default, this is set to `zathura`.
