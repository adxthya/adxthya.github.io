{
  description = "adxthya's portfolio";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
    in
    {
      devShells.${system}.default = 
        pkgs.mkShell {
          packages = [
            # use unstable or stable repo 
            pkgs.go
          ];
        };
    };
}

