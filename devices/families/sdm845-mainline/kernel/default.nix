{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.5.0-rc4";
  configfile = ./config.aarch64;

  prePatch = ''
    substituteInPlace arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi --replace \
      'dr_mode = "peripheral"' 'dr_mode = "host"'
  '';

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845/6.5-dev";
    hash = "sha256-vPZ0xIBjyFcsJDu2TtKtQwogPsVOGkcp65fUUk9z4eg=";
  };

  isModular = false;
  isCompressed = "gz";
}
