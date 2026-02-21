# Abbreviations
# alias : symlink :: abbreviation : textexpander
abbr --add g git
abbr --add l ls
abbr --add p python
abbr --add v nvim
abbr --add vim nvim
abbr --add b 'bash -c'
abbr --add t 'tmux attach || tmux new'
abbr --add gst 'git status'
abbr --add gl 'git log --all --graph --decorate --oneline'
abbr --add ga 'git add'
abbr --add unset 'set --erase'
abbr --add tree 'eza -T'

# Aliases
alias mv='mv -i'
alias resource='source ~/.config/fish/config.fish'

# Functions
function chrome
    if test (count $argv) -gt 0
        open -na "Google Chrome" --args $argv
    else
        open -na "Google Chrome"
    end
end

# Initialize homebrew environment variables (set HOMEBREW_PREFIX, add to PATH, etc.)
if status --is-interactive
   eval "$(/opt/homebrew/bin/brew shellenv)"
end

# Set install directories
set -gx GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx BUN_INSTALL $HOME/.bun
set -gx PNPM_HOME $HOME/Library/pnpm

# Add directories to PATH
fish_add_path -g $HOME/.local/bin $HOME/.cargo/bin $HOME/.cabal/bin $BUN_INSTALL/bin \
    $GHCUP_INSTALL_BASE_PREFIX/.cabal/bin $GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin \
    $PNPM_HOME

# Set configuration folder to ~/.config
# This is native to Linux, but some programs follow it on macOS
set -gx XDG_CONFIG_HOME ~/.config

# Make Go workspace a hidden folder
set -gx GOPATH ~/.go

# Enable zoxide
zoxide init fish | source

# Do not abbreviate the working directory in `prompt_pwd`
set -g fish_prompt_pwd_dir_length 0

# Disable greeting at startup
set -g fish_greeting

# Set default editor to Neovim
set -gx EDITOR nvim

# Enable mouse support and case-insensitive search in less, but keep default behavior for macOS
set -gx LESS '--RAW-CONTROL-CHARS --mouse --ignore-case --tabs=4 --quit-if-one-screen'
set -gx MANPAGER 'less -+F' # Always show short man pages in pager
set -gx PAGER 'less -FX'

# Custom syntax highlighting colors
# - Yellow for commands
# - White for subcommands
# - Blue for operators
# - Green for quotes
# - Red for errors
# To restore defaults, run `unset -g <element>`
# set -g fish_color_autosuggestion 555 brblack # default
set -g fish_color_command yellow
set -g fish_color_comment brblack
set -g fish_color_end blue # ; &&
set -g fish_color_error red
set -g fish_color_escape blue # \n
set -g fish_color_operator brwhite # () $i
set -g fish_color_param brwhite
set -g fish_color_quote green
set -g fish_color_redirection blue --bold # > < 2>

# Make prompt look like this:
# user@hostname pwd $ ...
function fish_prompt
    # set_color brblack
    # echo -n '['(date +"%I:%M %p")'] '
    set_color yellow
    echo -n $USER
    set_color normal
    echo -n '@'
    set_color blue
    echo -n (prompt_hostname)
    set_color green
    echo -n ' '(basename (prompt_pwd))
    set_color normal
    # echo -n (fish_vcs_prompt)
    echo -n ' $ '
end

# Display exit code on right hand side of prompt line
# [EXIT_CODE] or [EXIT|CODE]
function fish_right_prompt
    # Save the return status of the previous command(s)
    set -l last_status $pipestatus
    # Create a fancy string with said return status
    set -l status_string (__fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) \
        (set_color --bold $fish_color_status) $last_status)
    # Print it
    echo -n $status_string
end

# Show the full working directory in the title along with the fish command name
# Copied from an older version of fish
function fish_title
    # emacs' "term" is basically the only term that can't handle it.
    if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        # If we're connected via ssh, we print the hostname.
        set -l ssh
        set -q SSH_TTY
        and set ssh "["(prompt_hostname | string collect)"]"
        # An override for the current command is passed as the first parameter.
        # This is used by `fg` to show the true process name, among others.
        if set -q argv[1]
            echo -- $ssh $argv[1] (prompt_pwd)
        else
            set -l command (status current-command)
            # Uncomment this if you don't want to print "fish" in the title
            # if test "$command" = fish
            #     set command
            # end
            echo -- $ssh $command (prompt_pwd)
        end
    end
end
