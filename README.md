# My Starship configuration

This repository contains my personal configuration for [Starship](https://starship.rs/).

I love Starship because it is incredibly fast and shows me exactly what I need to know without cluttering my screen.

>[!IMPORTANT]
>Because this configuration relies heavily on icons, you need a terminal font that supports them. If you don't use a Nerd Font, you will see weird boxes `()` instead of cool icons.
>
>I recommend using [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip).

## How to use it

### Quick install

I wrote a simple script to set this up for you.

1. Clone this repository:

   ```bash
   git clone https://github.com/ImadSaddik/MyStarshipConfig.git
   cd MyStarshipConfig
    ```

2. Run the installer:

    ```bash
    chmod +x install.sh
    ./install.sh
    ```

### Manual install

If you prefer to move the files yourself:

1. Install Starship:

    ```bash
    curl -sS [https://starship.rs/install.sh](https://starship.rs/install.sh) | sh
    ```

2. Copy the config file:

    ```bash
    mkdir -p ~/.config
    cp starship.toml ~/.config/starship.toml
    ```

3. Add the init script to your shell config (like `.bashrc` or `.zshrc`):

    ```bash
    eval "$(starship init bash)"
    ```
