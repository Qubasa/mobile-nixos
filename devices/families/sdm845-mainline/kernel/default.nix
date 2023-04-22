{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.2.0";
  modDirVersion = "6.2.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "matthewcroughan";
    repo = "linux";
    rev = "d587ca767ea15a04ae5e5bd293db7f86ce34d142";
    hash = "sha256-VwbrvPhaIkUc5yMz2ZDOih8aUQi4HQ12U4LlkmL5his=";
  };

  isModular = false;
  isCompressed = "gz";
}
