{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.4.0";
  configfile = ./config.aarch64;

  prePatch = ''
    substituteInPlace arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi --replace \
      'dr_mode = "peripheral"' 'dr_mode = "host"'
  '';

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.4-r1";
    hash = "sha256-XUYv8tOk0vsG11w8UtBKizlBZ03cbQ2QRGyZEK0ECGU=";
  };

  isModular = false;
  isCompressed = "gz";
}
