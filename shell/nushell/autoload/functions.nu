# Simple Calculator
def calc [input: string] {
  echo $input | bc -l
}

# Display free disk space in human readable format
def df [] { 
  if ($nu.os-info.name == 'macos') {
    # The str replace is needed here because header and data has a space in it.
    ^df -h | str replace "Mounted on" Mounted_On | str replace "map auto_home" map_auto_home | detect columns
  } else {
    ^df -Th --total
  }
}

# Wifi IP Address
def wifi [] { 
  if ($nu.os-info.name == 'macos') {
    ^ipconfig getifaddr en0
  }
}

# Local IP Address
def localip [] { 
  if ($nu.os-info.name == 'macos') {
    ^ipconfig getifaddr en1
  }
}

def showports [] {
  if ($nu.os-info.name == 'macos') {
    ^lsof -P -iTCP -sTCP:LISTEN 
    | lines
    | skip 1
    | each { |line| $line 
    | parse -r '(?P<COMMAND>\S+)\s+(?P<PID>\d+)\s+(?P<USER>\S+)\s+(?P<FD>\S+)\s+(?P<TYPE>\S+)\s+(?P<DEVICE>\S+)\s+(?P<SIZE_OFF>\S+)\s+(?P<NODE>\S+)\s+(?P<NAME>.+)$'}
    | flatten
  } else {
    ^ss -tuln
  }
}