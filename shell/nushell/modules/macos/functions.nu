export def showports [] {
  lsof -P -iTCP -sTCP:LISTEN
  | lines
  | skip 1
  | each { |line|
    $line | parse -r '(?P<COMMAND>\S+)\s+(?P<PID>\d+)\s+(?P<USER>\S+)\s+(?P<FD>\S+)\s+(?P<TYPE>\S+)\s+(?P<DEVICE>\S+)\s+(?P<SIZE_OFF>\S+)\s+(?P<NODE>\S+)\s+(?P<NAME>.+)$'
  }
  | flatten
}
