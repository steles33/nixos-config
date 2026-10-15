# NixOS Configuration (hobby project: just to learn NixOS)

A modular, Flake-based NixOS configuration tailored for the Lenovo ThinkCentre M920q, featuring a minimalist SwayWM setup and unified system-wide theming via Stylix.

## 🚀 Overview
This repository contains a complete, reproducible system definition. By leveraging **Nix Flakes** and **Home Manager**, it manages everything from low-level system drivers to high-level user applications and shell aliases in a single declarative state.

## 🛠️ Key Features
*   **Window Manager:** `Sway` for a lightweight, tiling Wayland experience.
*   **Theming:** `Stylix` integration for synchronized colors, fonts, and wallpapers across all applications.
*   **Shell:** `Fish` shell configured for productivity.
*   **Terminal:** `Foot` terminal emulator.
*   **Modularity:** Each major component (Waybar, Sway, Fish, etc.) is isolated in its own module for easy maintenance.

## 📂 Structure
*   `flake.nix`: The entry point that locks dependencies and defines the system host.
*   `hosts/`: Machine-specific configurations (currently optimized for the `m920q`).
*   `modules/`: Reusable configuration fragments for system services and user apps.

## 💻 Installation
To apply this configuration to a compatible system, ensure you have Flakes enabled and run:

```bash
sudo nixos-rebuild switch --flake .#m920q
```

*(Note: Ensure you update the hardware configuration and hostname in the flake to match your specific device before applying.)*
