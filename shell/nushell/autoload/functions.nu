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
