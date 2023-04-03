{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.3-dev";
  modDirVersion = "6.3.0-rc1";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845/${version}";
    hash = "sha256-rRG7ixH98S/WiCqoQH6M1O//DIzkNVDDnQloiBThTkw=";
  };

  isModular = false;
  isCompressed = "gz";
}
