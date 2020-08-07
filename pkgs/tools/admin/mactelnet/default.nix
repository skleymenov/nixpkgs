{ stdenv,  automake, autoconf, gettext}:

let inherit (stdenv.lib) optional; in

let self = stdenv.mkDerivation rec {
    name = "mactelnet-20200331";

    src = builtins.fetchGit {
        url = "https://github.com/haakonnessjoen/MAC-Telnet.git";
        ref = "master";
        rev = "4698ba0223cc6add38b3b33be8367f635614aaa5";
    };

    postPatch = ''
        sed -i -e '/chown root /d' */Makefile{.in,.am}
    '';

    preConfigure = ''
    ./autogen.sh
  '';
    nativeBuildInputs = [ gettext autoconf automake ];
};
in self