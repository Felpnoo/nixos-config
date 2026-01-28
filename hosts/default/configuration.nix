{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # --- HABILITAR FLAKES (CRÍTICO) ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader (Mantive seu tema Bloodborne, muito bom!)
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    theme = pkgs.fetchFromGitHub {
      owner = "NeiKa0s496";
      repo = "Bloodborne-GRUB";
      rev = "e2755b0";
      hash = "sha256-9vFdwxe7J7zWuUdKOrqwXaNowGfojoCPQUBNsr9gSys";
    } + "/BBGrub";
  };

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Boa_Vista";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Interface Gráfica (Cinnamon)
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  console.keyMap = "br-abnt2";

  services.printing.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Virtualização (Adicionei pois você usa Docker)
  virtualisation.docker.enable = true;

  # Usuário
  users.users.felpnoo = {
    isNormalUser = true;
    description = "Felipe dos Santos Silva";
    extraGroups = [ "networkmanager" "wheel" "docker" ]; # Adicionei docker aqui
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11"; 
}
