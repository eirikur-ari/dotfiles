# This file serves as a placeholder for machine-local configuration that is
# intentionally excluded from version control via .gitignore.
#
# It exists as an empty file in the repository solely to satisfy Nushell's
# parse-time requirement for the `source` command in config.nu.
#
# There are two ways to use this file for machine-specific configuration:
#
# Option 1 - Symlink (recommended):
#   Replace this file with a symlink pointing to a configuration file that
#   lives outside the repository:
#   ln -sf /path/to/machine-specific.nu ~/.config/nushell/extra.nu
#
# Option 2 - Edit directly:
#   Add machine-specific configuration directly to this file. Since it is
#   listed in .gitignore, changes will not be tracked or committed.
#
# Examples of machine-specific configuration:
#   - Startup routines (e.g. moo)
#   - Machine-specific environment variables
#   - Work or personal aliases that should not be shared across machines
