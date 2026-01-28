# ❄️ Felipe's NixOS Configuration

![NixOS](https://img.shields.io/badge/NixOS-Unstable-blue.svg?style=for-the-badge&logo=nixos&logoColor=white)
![Infrastructure](https://img.shields.io/badge/Infrastructure-As%20Code-green.svg?style=for-the-badge)

**Welcome to my personal infrastructure.**

This repository hosts the **declarative configuration** for my development environment, built on NixOS. It represents my philosophy of **Reproducible Infrastructure**: providing a fully automated, immutable, and consistent workspace across machines.

If my laptop breaks today, I can restore my entire workflow on new hardware in under 15 minutes with a single command.

## 🖼️ The Setup
*(Add a screenshot of your desktop here named 'screenshot.png')*

## 🛠️ Tech Stack
- **OS Base:** NixOS (Unstable Channel)
- **State Management:** Nix Flakes (Modern, hermetic dependency management)
- **DE/WM:** Cinnamon (Customized for productivity)
- **DevOps Tooling:** Docker, Docker Compose, Make
- **Languages:** Python (Data Science stack), Node.js, Java

## 📂 Project Structure
My configuration follows a modular architecture to separate concerns:

```tree
.
├── flake.nix               # Entrypoint & Dependency Lockfile
├── hosts/
│   └── default/            # Machine-specific hardware config
├── modules/
│   └── packages.nix        # Curated list of system packages
└── README.md
