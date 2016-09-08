#!/usr/bin/env bats

# TODO: Load from absolute path
load "${MY_DOTFILES}/system/.functions"

@test "Calculate the sum of 1 and 2" {
    actual="$(calc 1+2)"
    expected=3
    [ "$actual" -eq "$expected" ]
}