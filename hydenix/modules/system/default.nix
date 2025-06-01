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

    hostname = lib.mkOption {
      type = lib.types.str;
      description = "Hostname";
      example = "hydenix";
    };

    timezone = lib.mkOption {
      type = lib.types.str;
      description = "Timezone";
      example = "America/Vancouver";
    };

    locale = lib.mkOption {
      type = lib.types.str;
      description = "Locale";
      example = "en_CA.UTF-8";
    };
  };

  config = {
    hydenix.enable = lib.mkDefault false;

    hydenix.timezone = lib.mkDefault "America/Vancouver";
    hydenix.locale = lib.mkDefault "en_CA.UTF-8";
    hydenix.hostname = lib.mkDefault "hydenix";

    # Configuration for variables (only applied when hydenix is enabled)
    time.timeZone = lib.mkDefault cfg.timezone;
    i18n.defaultLocale = lib.mkDefault cfg.locale;
    networking.hostName = lib.mkDefault cfg.hostname;

    system.stateVersion = "25.05";
  };
}
