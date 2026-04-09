# Environment Variables
$env.config.buffer_editor = "vim"


## HOMEBREW
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"
$env.INFOPATH = "/opt/homebrew/share/info:"
$env.HOMEBREW_NO_ENV_HINTS = 1

use std "path add"
path add "/opt/homebrew/bin"
path add "/opt/homebrew/sbin"
path add ".cargo/bin"

## NuShell Prompts - Starthip
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

### Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

### The prompt indicators are environmental variables that represent
### the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "