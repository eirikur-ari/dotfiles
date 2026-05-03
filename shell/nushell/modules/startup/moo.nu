# Startup routine that displays a random fortune message spoken by a random cow.
# Combines fortune, fmt, and cowsay/cowthink to create a randomized greeting
# each time a new shell session is started.
export def main [] {
  # Randomly pick between cowsay (speech bubble) and cowthink (thought bubble)
  let effect = (["cowsay" "cowthink"] | get (random int 0..1))

  # Randomly pick a cowsay display flag:
  # -b borg, -d dead, -g greedy, -p paranoid, -s stoned, -t tired, -w wired, -y youthful
  let flag = (["-b" "-d" "-g" "-p" "-s" "-t" "-w" "-y"] | get (random int 0..7))

  # Get the list of available cow files from cowsay, skipping the header line,
  # then flatten and clean up whitespace to produce a usable list
  let cows = (^cowsay -l | lines | skip 1 | each { split row " " } | flatten | where { |it| $it != "" })

  # Randomly pick one cow from the list
  let cow = ($cows | get (random int 0..($cows | length | $in - 1)))

  # Generate a fortune, wrap it at 80 chars, and pipe it through the chosen cow
  ^fortune | ^fmt -80 -s | ^$effect $flag -f $cow -n | print --stderr
}
