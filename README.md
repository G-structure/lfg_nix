# LFG !!!
```
nix --extra-experimental-features "nix-command flakes" run . switch
nix build --extra-experimental-features "nix-command flakes" .#homeConfigurations.ubuntu.activationPackage
```
