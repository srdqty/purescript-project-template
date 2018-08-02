{ compiler ? import ./ghc.nix
, extraHaskellOverride ? (pkgs: new: old: {})
}:
let
  haskellOverlay = (self: super: {
    haskellPackages = super.haskell.packages."${compiler}".override {
      overrides = (new: old: {
      } // extraHaskellOverride self new old);
    };
  });

  nonHaskellOverlay = (self: super: {
    purescript = super.callPackage ./pkgs/purescript {};
  });
in
  [nonHaskellOverlay haskellOverlay]
