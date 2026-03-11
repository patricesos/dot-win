# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.show_banner = false
$env.config.buffer_editor = 'code'

alias vi = nvim
alias ll = eza -axl --icons=always --group-directories-first

const env_dir = "./.venv/Scripts"
alias venv = overlay use $"($env_dir)/activate.nu"

# Starship init
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# zoxide initialization
mkdir ($nu.data-dir | path join "zoxide")
zoxide init nushell | save -f ($nu.data-dir | path join "zoxide/zoxide.nu")
source ($nu.data-dir | path join "zoxide/zoxide.nu")
