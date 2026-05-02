# Environment Variables
$env.config.buffer_editor = "nvim"

# Remove default banner
$env.config.show_banner = false

# Import path add to append directories to $env.PATH
use std "path add"
path add "/usr/local/bin"

# Rust packages
path add ".cargo/bin"

# MacOS only
if (sys host).name == "Darwin" {
    $env.HOMEBREW_PREFIX = "/opt/homebrew"
    $env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
    $env.HOMEBREW_REPOSITORY = "/opt/homebrew"
    $env.INFOPATH = "/opt/homebrew/share/info:"
    $env.HOMEBREW_NO_ENV_HINTS = 1
    path add "/opt/homebrew/bin"
    path add "/opt/homebrew/sbin"
}
