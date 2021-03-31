# TODO
# 1. install clang
# 2. install tools for static analysis (check what is used in Project CMake files)
# 3. install tools for code coverage analysis
# 4. install packages to build docs target
# 5. install ccache and ninja
# 6. install dpkg
# 7. install pre-commit hooks


with (import ./inputs.nix);
with pkgs;
let
  gcc = gcc10;

in mkShell {
  hardeningDisable = [ "all" ];
  LOCALE_ARCHIVE_2_27 = "${glibcLocales}/lib/locale/locale-archive";
  buildInputs = [
    cmake
    glibcLocales
    gcc
    binutils
    qt514.full
    libGLU
    python3
    python3Packages.setuptools
    python3Packages.pip
    python3Packages.virtualenv
  ];

  shellHook = ''
    virtualenv venv
    source venv/bin/activate
    pip install conan==1.34.0
  '';
}
