{ lib, ... }:

let
  bitOrType = lib.mkOptionType {
    name = "bitwise-or-integer";
    description = "Integers combined with bitwise OR";
    check = builtins.isInt;
    memrge = loc: defs:
      builtins.foldl' builtins.bitOr 0 (map (d: d.value) defs);
  };
in
{
  options.my.bluetooth.class = lib.mkOption {
    type = bitOrType;
    default = 0;
  };
}
