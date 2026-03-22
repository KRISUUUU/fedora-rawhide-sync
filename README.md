# 🚀 Fedora Rawhide Sync Tool

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Fedora](https://img.shields.io/badge/OS-Fedora_Rawhide-294172?style=for-the-badge&logo=fedora&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)

A professional, enterprise-grade update wrapper for **Fedora Rawhide**. Built with a Hybrid TUI architecture, providing both a modern animated experience (via `gum`) and a bulletproof classic bash fallback. Designed with strict security and safety principles.

[🇵🇱 Przejdź do polskiej wersji językowej](#-polska-wersja-językowa)

---

## 🇬🇧 English Version

### 🎯 Why this tool?

Updating Fedora Rawhide (the rolling, developmental branch) can be risky. Standard `dnf update` might break your system due to package downgrades or conflicts. This tool forces a **Safe-by-Default** approach: it always runs a transaction test (`dry-run` or `tsflags=test`) before touching your disk, uses `distro-sync` to handle downgrades properly, and checks if a system reboot is required.

### ✨ Key Features

- 🛡️ **Security & Safety First** — No arbitrary remote code execution (RCE) via insecure updaters. Requires explicit flags for non-interactive (cron) runs to prevent accidental full-system updates.
- 🎨 **Hybrid UI Architecture**
  - **Modern Mode** — Animated menus, spinners, and confirmations (requires [Charm's Gum](https://github.com/charmbracelet/gum))
  - **Classic Mode** — Pure Bash, zero-dependency ASCII dashboard for minimal environments
- 🔄 **DNF5 Native** — Automatically detects your DNF major version (v4 or v5) and adapts flags (`--dry-run` vs `--setopt=tsflags=test`)
- 🌍 **Bilingual** — Built-in i18n support (English & Polish), toggleable at runtime
- 🔒 **Concurrency Protection** — File locking via `flock` prevents multiple instances from corrupting the RPM database

### 📦 Installation

```bash
git clone https://github.com/KRISUUUU/fedora-rawhide-sync.git
cd fedora-rawhide-sync
sudo ./install.sh
```

During installation you will be prompted to choose your preferred UI (Modern or Classic). The installer will automatically configure the system, handle dependencies, and copy the executable to `/usr/local/bin/`.

### 🚀 Usage

```bash
sudo rawhide-sync
```

#### CLI Flags (for Cron / Automation)

| Flag | Description |
|------|-------------|
| `--test-only` | Run transaction simulation only |
| `--full` | Run simulation and proceed with the update automatically |
| `--fast-upgrade` | Use `dnf upgrade` instead of `distro-sync` (skips downgrading) |
| `--lang EN\|PL` | Force a specific language |

> **Note:** If executed in a non-interactive environment (no TTY) without explicit flags, the script will strictly abort to prevent unmonitored system changes.

---

## 🇵🇱 Polska Wersja Językowa

### 🎯 O projekcie

Aktualizacja Fedory Rawhide (wersji testowej typu rolling-release) bywa ryzykowna. Zwykłe `dnf update` może uszkodzić system przez konflikty pakietów. Ten skrypt wymusza podejście **Safe-by-Default**: zawsze najpierw symuluje transakcję w pamięci, używa `distro-sync` (aby poprawnie obsługiwać downgrade pakietów) oraz analizuje, czy po aktualizacji wymagany jest restart jądra systemu.

### ✨ Główne Funkcje

- 🛡️ **Bezpieczeństwo na pierwszym miejscu** — Brak niebezpiecznych auto-updaterów pobierających kod z sieci jako root. Automatyzacja (cron) wymaga jawnych flag, chroniąc przed przypadkowymi aktualizacjami bez nadzoru.
- 🎨 **Hybrydowy Interfejs (TUI)**
  - **Tryb Modern** — Animowane menu i paski postępu (wykorzystuje bibliotekę [`gum`](https://github.com/charmbracelet/gum))
  - **Tryb Classic** — Lekki, napisany w czystym Bashu (bez zależności) interfejs ASCII
- 🔄 **Natywne wsparcie DNF5** — Skrypt bezpiecznie parsuje wersję DNF i dobiera odpowiednie parametry testowe
- 🌍 **Wielojęzyczność** — Wbudowane wsparcie dla języka polskiego i angielskiego (zmiana „w locie")
- 🔒 **Ochrona bazy RPM** — Blokady plików (`flock`) uniemożliwiają uruchomienie kilku instancji naraz

### 📦 Instalacja

```bash
git clone https://github.com/KRISUUUU/fedora-rawhide-sync.git
cd fedora-rawhide-sync
sudo ./install.sh
```

Instalator zapyta o wybór interfejsu (Modern / Classic), pobierze opcjonalne zależności i bezpiecznie zainstaluje program w `/usr/local/bin/`.

### 🚀 Użycie

```bash
sudo rawhide-sync
```

#### Flagi CLI (dla automatyzacji / Crona)

| Flaga | Opis |
|-------|------|
| `--test-only` | Tylko symulacja (bezpieczne) |
| `--full` | Symulacja i automatyczna instalacja |
| `--fast-upgrade` | Używa `dnf upgrade` zamiast `distro-sync` (omija downgrade'y) |
| `--lang EN\|PL` | Wymusza konkretny język przy starcie |

> **Uwaga:** W przypadku uruchomienia bez dostępu do terminala (np. przez cron) skrypt wymaga podania jawnej flagi (np. `--full`). W przeciwnym razie przerwie działanie, chroniąc system przed niekontrolowanymi zmianami.

---

*Developed with Clean Code principles by [KRISUUUU](https://github.com/KRISUUUU)*