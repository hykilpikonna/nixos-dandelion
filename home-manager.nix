let
  home-manager = builtins.fetchGit {
    url = "https://github.com/nix-community/home-manager.git";
    ref = "release-22.05"; # the branch to follow: release-xx.yy for stable nixos or master for nixos-unstable.
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.azalea = {
    # Git
    programs.git = {
      enable = true;
      userName = "Azalea";
      userEmail = "me@hydev.org";
    };
  };
}
