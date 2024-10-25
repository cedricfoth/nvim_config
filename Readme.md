# NVIM Config

## Main features

-   **Lazy loading:** Only loads plugins when needed, improving startup time.
-   **Autocompletion:** Provides intelligent autocompletion for code, files, and more.
-   **Linting:** Integrates with linters to catch errors and enforce code style.
-   **Formatting:** Automatically formats code according to predefined rules.
-   **Git integration:** Provides seamless integration with Git for version control.
-   **Debugging:** Supports debugging with breakpoints, stepping, and variable inspection.
-   **Themes:** Includes a variety of themes to customize the editor's appearance.
-   **File management:** Provides a file explorer and other tools for managing files.
-   **Customization:** Highly customizable through Lua configuration files.

## Installation

1.  Install Neovim:
    -   On macOS: `brew install neovim`
    -   On Debian/Ubuntu: `sudo apt-get install neovim`
    -   On Arch Linux: `sudo pacman -S neovim`
    -   Other distributions: Refer to the Neovim website for instructions.

2.  Clone this repository:
    ```bash
    git clone https://github.com/cedricfoth/nvim_config.git ~/.config/nvim
    ```


## Usage

Launch Neovim by running `nvim` in your terminal.


## Customization

You can customize this configuration by editing the files in the `lua/` directory. The `init.lua` file is the main entry point for the configuration.

## Plugins

This configuration uses the following plugins:

-   **LAZY:** Plugin manager.
-   **LSP:** Language Server Protocol support.
-   **Treesitter:** Syntax highlighting and code navigation.
-   **Telescope:** Fuzzy finder.
-   **Nvim-cmp:** Autocompletion engine.
-   **Mason:** LSP installer and manager.
-   **Null-ls:** Linter and formatter framework.
-   **Gitsigns:** Git integration.
-   **Nvim-tree:** File explorer.
-   **Plenary:** Lua utilities.
-   **Comment.nvim:** Commenting plugin.
-   **Indent-blankline:** Indentation guides.
-   **Bufferline:** Buffer management.
-   **Which-key:** Keybinding helper.

## Contributing

Contributions are welcome! Please open an issue or pull request if you have any suggestions or bug reports.

