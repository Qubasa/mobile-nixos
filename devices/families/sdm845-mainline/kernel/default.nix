{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, pkgs
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.3.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "ee8604001bd57428b89f3e1c3574af743b909502";
    hash = "sha256-7VaaxZs5QTW332bKVolks/GRNPa34o9q8WYi3wl6Iic=";
  };
  patches = [
    (pkgs.fetchpatch { url = "https://github.com/torvalds/linux/commit/44c89ef3d1096f92712e11675329c3f1fca96c47.patch"; sha256 = "sha256-3/NhUuouHmfqr1Cdymx8+32qd1203NA9ed3Wlcss9do="; })
  ];
  isModular = false;
  isCompressed = "gz";
}
