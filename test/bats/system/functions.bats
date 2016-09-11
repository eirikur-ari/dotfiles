#!/usr/bin/env bats

load "${DOTFILES_HOME}/system/.functions"

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

@test "Verify that record type 'A' on localhost is 127.0.0.1" {
  run digs A localhost
  [ "$status" -eq 0 ]
  [ "$output" = "127.0.0.1" ]
}

case $(uname) in
  'Linux')
    @test "Verify that port 80 is closed on localhost" {
      run portCheck localhost 80
      [ "$status" -eq 0 ]
      [ "$output" = "The port 80 is closed on localhost" ]
    }

    @test "Verify that port 80 is open on www.mbl.is" {
      run portCheck www.mbl.is 80
      [ "$status" -eq 0 ]
      [ "$output" = "The port 80 is open on the host www.mbl.is" ]
    }
  ;;
esac