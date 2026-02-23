# Simple Calculator
def calc [input: string] {
  echo $input | bc -l
}

# Display free disk space in human readable format
def df [] { 
  if ($nu.os-info.name == 'macos') {
    ^df -H
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