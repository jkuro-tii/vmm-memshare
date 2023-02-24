{
  description = "VMM memory sharing";

  outputs = { self, nixpkgs }:
    let
      build_for = system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
          pkgs.callPackage ././TestApp/memtest.nix {};
    in
    {
      packages.x86_64-linux.default = build_for "x86_64-linux";
    };
}
