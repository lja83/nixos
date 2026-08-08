{ lib, ... }:

let
  bitOrType = lib.mkOptionType {
    name = "hex-bitwise-or";
    description = "Hex strings merged using bitwise OR";
    check = builtins.isString;
    merge = loc: defs:
      let
        values = map (d: lib.fromHexString d.value) defs;
        combined = builtins.foldl' builtins.bitOr 0 values;
      in
        "0x" + lib.toHexString combined;
  };
in
{
  options.my.bluetooth.class = lib.mkOption {
    type = bitOrType;
    default = 0;
  };
}
