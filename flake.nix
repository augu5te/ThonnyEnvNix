{
  description = "Thonny with env";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: (utils.lib.eachSystem ["x86_64-linux" ] (system:
    let
      pkgs = nixpkgs.legacyPackages.${system}; 
    in
    rec {
      packages = {
        thonnyEnv = let
          pythonEnv = with pkgs.python3Packages; [
            matplotlib
            numpy
            pandas
          ];
        in
          pkgs.mkShell {
            buildInputs = [ pkgs.thonny ] ++ pythonEnv;
            #shellHook = ''echo Thonny dev && thonny'';
          };
      };

      defaultPackage = packages.thonnyEnv;
      devShell = packages.thonnyEnv;
    }));
}
