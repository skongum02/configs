# ~/.config/nix-config/flake.nix
{
  description = "My macOS Home Manager Flake";

  # These are the dependencies of your flake.
  # They are fetched and locked into a `flake.lock` file for reproducibility.
  inputs = {
    # Nixpkgs (the collection of all Nix packages)
    # We point to the `nixpkgs-unstable` channel for newer packages.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      # Make sure Home Manager uses the same version of nixpkgs as our main configuration
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # These are the outputs your flake provides.
  # Here, we're creating a Home Manager configuration.
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    # This is the main output that Home Manager will use.
    # Replace `your-username` with your actual macOS username.
    # For example: homeConfigurations."jdoe" = ...
    homeConfigurations.vk = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Or "x86_64-darwin" for Intel Macs

      # The modules to import. Your actual configuration will live in `home.nix`.
      modules = [
        ./home.nix
      ];
    };
  };
}
