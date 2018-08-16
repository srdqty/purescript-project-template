# purescript-project-template

Currently just patching the official binary release of purescript because 0.12
failed to build the last time I tried it and I didn't feel like fucking around
with fixing the dependencies lol. Though I guess I could look into
stackage2nix ha.

Currently incomplete. Work in progress. Todo is to nixify psc-package sets.

Nix project template for purescript.

Use pulp, purs, psc-package and stuff

```
./enter-dev.sh
```

Yeah so atm this setup doesn't work with nix 1.11 because of node2nix 1.6.0...

See: https://github.com/NixOS/nixpkgs/issues/44002
