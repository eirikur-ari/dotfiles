# this file is both a valid
# - overlay which can be loaded with `overlay use starship.nu`
# - module which can be used with `use starship.nu`
# - script which can be used with `source starship.nu`

# The initial value of `$env.CMD_DURATION_MS` is always `0823`, which is an official setting.
# See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
export def starship_prompt [--right] {
    let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS }
    let jobs = if (which "job list" | where type == built-in | is-not-empty) {
        ["--jobs", (job list | length)]
    } else {
        []
    }
    let side = if $right { ["--right"] } else { [] }
    let width = (term size).columns
    ^starship prompt ...$side --cmd-duration $cmd_duration $"--status=($env.LAST_EXIT_CODE)" --terminal-width $width ...$jobs
}

export-env { $env.STARSHIP_SHELL = "nu"; load-env {
    STARSHIP_SESSION_KEY: (random chars -l 16)
    PROMPT_MULTILINE_INDICATOR: (^starship prompt --continuation)

    # Does not play well with default character module.
    PROMPT_INDICATOR: ""
    PROMPT_INDICATOR_VI_INSERT: ": "
    PROMPT_INDICATOR_VI_NORMAL: "〉"

    PROMPT_COMMAND: {|| starship_prompt }

    config: ($env.config? | default {} | merge {
        render_right_prompt_on_last_line: true
    })

    PROMPT_COMMAND_RIGHT: {|| starship_prompt --right }
}}
