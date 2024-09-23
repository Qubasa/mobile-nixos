{ mobile-nixos
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.11.0-rc2";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.11.0_rc2-r2";
    hash = "sha256-v48UfKESS7SQhLmgsRT6b1IoEcjuhnXBANGUVYz7WSs=";
  };

  isModular = true;
  isCompressed = "gz";
}
