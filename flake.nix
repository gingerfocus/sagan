{
  description = "dev envirorment for coding in class";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = [ "aarch64-linux" "x86_64-linux" ];
      eachSystem = f:
        lib.foldAttrs lib.mergeAttrs { }
        (map (s: lib.mapAttrs (_: v: { ${s} = v; }) (f s)) systems);
    in eachSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (final: prev: { }) ];
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ gcc-arm-embedded qemu ];
          shellHook = ''
            export PATH=$PWD/bin:$PATH
          '';
        };
      });
}
