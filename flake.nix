{
  description = "Radical Ace";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems (system: f {
          pkgs = import nixpkgs { inherit system; };
        });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            gradle
            jdk8
          ];

          shellHook =''
          echo "Hello Player! Welcome to Radical Aces."
          echo "Using Java version: $(java -version 2>&1 | head -n1)"
          echo "You can now run: ./run.sh"
          '';
        };
      });
    };
}
