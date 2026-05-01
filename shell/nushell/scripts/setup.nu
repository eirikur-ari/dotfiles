# Creates an empty extra.nu file if it does not already exist.
# This file is excluded from the repository via .gitignore and serves
# as a placeholder for machine-local configuration.
# See extra.nu for more details on how to use it.
let extra = ($nu.default-config-dir | path join "extra.nu")
if not ($extra | path exists) {
    touch $extra
    print "Created empty extra.nu for machine-local configuration."
} else {
    print "extra.nu already exists, skipping."
}
