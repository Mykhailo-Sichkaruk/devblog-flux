{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { pkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system:
      let
        nixpkgs = pkgs.legacyPackages.${system};
      in
      {
        devShell = nixpkgs.mkShell {
          buildInputs = with nixpkgs; [
            istioctl
            minikube
            kubectl
            docker
            kubernetes-helm
            k9s
            devspace
            openssl
            fluxcd
            kustomize
          ];
        };
      }
    );
}
