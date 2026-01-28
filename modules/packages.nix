{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # === System Utils ===
    neovim
    wget 
    fastfetch
    htop 
    fzf 
    ripgrep 
    unzip 
    p7zip 
    unrar 
    lshw
    gparted
    xorg.xhost 
    wmctrl 
    xorg.xrandr 

    # === Development ===
    git 
    vscode 
    docker-compose 
    gnumake 
    gcc 
    binutils
    dbeaver-bin 
    
    # Python & AI
    python3 
    ruff 
    pyright 
    ollama
    (python3.withPackages (ps: with ps; [
      ipykernel jupyterlab notebook numpy pandas 
      matplotlib seaborn scikit-learn
    ]))

    # Node / JS
    nodejs_24 
    yarn 
    nodePackages_latest.pnpm 
    nodePackages_latest.npm

    # Java
    jdk21 
    jdk17

    # Language Servers (LSP)
    lua-language-server 
    yaml-language-server 
    bash-language-server

    # === Interface & Theming ===
    kitty 
    rofi 
    picom 
    chafa
    # Nota: Waybar/Swww são para Wayland (Hyprland), Cinnamon usa X11. 
    # Mantenha apenas se for usar Hyprland no futuro.
    waybar 
    dunst 
    libnotify 
    swww 
    
    # === General Apps ===
    brave 
    ferdium 
    anydesk 
    qbittorrent-enhanced 
    mpv
    ani-cli
    libreoffice-qt
  ];
}
