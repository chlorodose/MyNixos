prev: final: 
let 
  lib = prev;
in {
  getModule = lib.path.append ../modules;
  getAsset = lib.path.append ../assets;
  getSecret = p: lib.path.append ../secrets (p + ".age");
  scanPath = path:
    builtins.map
    (f: (path + "/${f}"))
    (builtins.attrNames
      (lib.attrsets.filterAttrs
        (
          path: type:
            (type == "directory")
            || (
              (path != "default.nix")
              && (lib.strings.hasSuffix ".nix" path)
            )
        )
        (builtins.readDir path)));
}