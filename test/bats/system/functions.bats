#!/usr/bin/env bats

load "${DOTFILES_HOME}/system/functions/.functions"

@test "Invoking ssh-generate-key with no ssh key name" {
  run ssh-generate-key
  [ "$status" -eq 0 ]
  [ "$output" = "Please supply name of the ssh key" ]
}

@test "Verify the calculated sum of 1 and 2 equals 3" {
    actual="$(calc 1+2)"
    expected=3
    [ "$actual" -eq "$expected" ]
}

@test "Verify that record type 'A' on www.example.com is 93.184.216.34" {
  run digs A www.example.com
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "Verify that base64d is able to decode base64 string" {
  expected="this is a password!"
  password=$(echo "$expected" | base64)
  run base64d "$password"
  [ "$status" -eq 0 ]
  [ "$output" = "$expected" ]
}

case $(uname) in
  'Linux')
    @test "Verify that port 80 is closed on localhost" {
      run portCheck localhost 80
      [ "$status" -eq 0 ]
      [ "$output" = "The port 80 is closed on localhost" ]
    }

    @test "Verify that port 80 is open on www.example.com" {
      run portCheck www.example.com 80
      [ "$status" -eq 0 ]
      [ "$output" = "The port 80 is open on the host www.example.com" ]
    }
  ;;
esac