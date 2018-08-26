set -gx EDITOR vim
set -gx MANPAGER "less -X"
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/share/man /usr/share/man

#
# Java
#

set -gx PATH $HOME/.jenv/shims $PATH
command jenv rehash 2> /dev/null

#
# Ruby
#

set -gx RUBY_CONFIGURE_OPTS --disable-install-doc
status --is-interactive; and . (rbenv init -|psub)

#
# Shortcuts
#

abbr -a d cd ~/Downloads
abbr -a p cd ~/Projects
abbr -a w cd ~/Workspaces

abbr -a g git
abbr -a b bundle
abbr -a r rails

abbr -a h history
abbr -a j jobs

abbr -a l  ls --color --indicator-style=none -lh
abbr -a la ls --color --indicator-style=none -lh -A
abbr -a ls ls --color --indicator-style=none

abbr -a k  tree --dirsfirst -N -hC -pD -ug    -L 1
abbr -a ka tree --dirsfirst -N -hC -pD -ug -a -L 1
abbr -a ks tree --dirsfirst -N

abbr -a df df -h
abbr -a dn ncdu -2
abbr -a du du -h -d 1

abbr -a cpssh "pbcopy < ~/.ssh/id_rsa.pub"

#
# Network helpers
#

abbr -a ip "dig +short myip.opendns.com @resolver1.opendns.com"
abbr -a ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

#
# macOS helpers
#

# Update brew
alias update "brew update; brew upgrade; brew cleanup; fish_update_completions"

# Update system
alias syupdate "sudo softwareupdate -i -a"

# Flush directory service cache
alias dsflush "dscacheutil -flushcache; and killall -HUP mDNSResponder"

# Recursively delete .DS_Store files
alias dscleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Recursively delete ._* files and merges most recent attributes
alias dtcleanup "dot_clean -mv ."

# Clean up launch services to remove duplicates in open with menus
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# Empty trash on local system and all mounted volumes
alias emptytrash "set x ~/.Trash/* /Volumes/*/.Trashes/* /private/var/log/asl/*.asl; and sudo rm -rfv \$x; and set -e x"

# Enable/disable Spotlight indexing
alias spotoff "sudo mdutil -a -i off"
alias spoton  "sudo mdutil -a -i on"

# Show/hide hidden files
alias showfiles "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
alias hidefiles "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# Show/hide desktop icons
alias showicons "defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"
alias hideicons "defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"

# Lock the screen
alias afk "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession -suspend"

#
# Colors
#

set -g fish_color_clock 04819e
set -g fish_color_cwd 00bf32
set -g fish_color_cwd_root brred
set -g fish_color_git 00bf32
set -g fish_color_host 04819e
set -g fish_color_separator 60b9ce
set -g fish_color_status 60b9ce
set -g fish_color_user 04819e

set -g fish_color_autosuggestion 64df85
set -g fish_color_cancel normal
set -g fish_color_command 00bf32
set -g fish_color_comment 5c9900
set -g fish_color_end 8eeb00
set -g fish_color_error 60b9ce
set -g fish_color_escape bryellow
set -g fish_color_history_current normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param 04819e
set -g fish_color_quote 206676
set -g fish_color_redirection 7cb02c
set -g fish_color_search_match --background=202020
set -g fish_color_selection --background=202020
set -g fish_color_valid_path --underline

set -g fish_pager_color_prefix 60b9ce
set -g fish_pager_color_completion 04819e
set -g fish_pager_color_description 04819e
set -g fish_pager_color_progress normal
set -g fish_pager_color_secondary normal

#
# Fixes
#

# Unique PATH elements preserving order, jenv and rbenv shims add up
set -gx PATH (echo -n $PATH | tr ' ' '\n' | awk '!a[$0]++')
