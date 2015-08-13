#!/usr/bin/env bats

@test "bats is installed " {
  run file /usr/local/bin/bats
  [ "$status" -eq 0 ]
}
