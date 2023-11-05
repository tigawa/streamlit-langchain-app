{
   description = "A devbox shell";

   inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/75a52265bda7fd25e06e3a67dee3f0354e73243c";
     nixpkgs-75a522.url = "github:NixOS/nixpkgs/75a52265bda7fd25e06e3a67dee3f0354e73243c";
   };

   outputs = {
     self,
     nixpkgs,
     nixpkgs-75a522,
   }:
      let
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        nixpkgs-75a522-pkgs = (import nixpkgs-75a522 {
          system = "aarch64-darwin";
          config.allowUnfree = true;
          config.permittedInsecurePackages = [
          ];
        });
      in
      {
        devShells.aarch64-darwin.default = pkgs.mkShell {
          buildInputs = [
            nixpkgs-75a522-pkgs.python312
          ];
        };
      };
 }
