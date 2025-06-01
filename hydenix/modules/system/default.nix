{ lib, config, ... }:

let
  cfg = config.hydenix;

in
{
  imports = [
    ./audio.nix
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./nix.nix
    ./sddm.nix
    ./system.nix
    ./gaming.nix
  ];

  options.hydenix = {
    enable = lib.mkEnableOption "Enable Hydenix modules globally";
  };

  config = {
    hydenix.enable = lib.mkDefault false;
  };
}
