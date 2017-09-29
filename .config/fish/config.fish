# TODO find a better way how to fix bin & man for GNU coreutils,
# see http://www.softec.lu/site/DevelopersCorner/MasteringThePathHelper
# add /usr/local/opt/coreutils/libexec/gnuman to /etc/manpaths -> does not work
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/share/man /usr/share/man
# add /usr/local/opt/coreutils/libexec/gnubin to /etc/paths -> works
# set -x PATH /usr/local/opt/coreutils/libexec/gnubin ... -> works, but not a good solution
# set -x fish_user_paths /usr/local/opt/coreutils/libexec/gnubin -> works, but not a good solution

set -gx EDITOR vim
set -gx MANPAGER "less -X"

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
# Git
#

set -g __fish_git_prompt_show_informative_status 1

set -g __fish_git_prompt_char_cleanstate ≀
set -g __fish_git_prompt_char_dirtystate ±
set -g __fish_git_prompt_char_invalidstate ×
set -g __fish_git_prompt_char_stagedstate ◴
set -g __fish_git_prompt_char_stashstate *
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_untrackedfiles …
set -g __fish_git_prompt_char_upstream_ahead ↥
set -g __fish_git_prompt_char_upstream_behind ↧
set -g __fish_git_prompt_char_upstream_diverged ≠
set -g __fish_git_prompt_char_upstream_equal =
set -g __fish_git_prompt_char_upstream_prefix ' '

eval (hub alias -s)

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

# Copy SSH public key to clipboard
abbr -a cpssh "pbcopy < ~/.ssh/id_rsa.pub"

#
# Network helpers
#

abbr -a ip "dig +short myip.opendns.com @resolver1.opendns.com"
abbr -a ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

#
# macOS helpers
#

# Update system, brew and fish completions
alias update "sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; fish_update_completions"

# Flush Directory Service cache
alias dsflush "dscacheutil -flushcache; and killall -HUP mDNSResponder"

# Recursively delete .DS_Store files
alias dscleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Recursively delete ._* files, merges most recent attributes
alias dtcleanup "dot_clean -mv ."

# Clean up Launch Services to remove duplicates in the Open With menu
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# Empty the Trash on local system and all mounted volumes
alias emptytrash "set x ~/.Trash/* /Volumes/*/.Trashes/* /private/var/log/asl/*.asl; and sudo rm -rfv \$x; and set -e x"

# Enable/disable Spotlight indexing
alias spotoff "sudo mdutil -a -i off"
alias spoton  "sudo mdutil -a -i on"

# Show/hide hidden files
alias showfiles "defaults write com.apple.finder AppleShowAllFiles -bool true;  and killall Finder"
alias hidefiles "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# Show/hide desktop icons
alias showicons "defaults write com.apple.finder CreateDesktop -bool true;  and killall Finder"
alias hideicons "defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"

# Lock the screen
alias afk "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession -suspend"

#
# Fixes
#

# Unique PATH elements by preserving order, jenv and rbenv shims seem to add up
set -gx PATH (echo -n $PATH | tr ' ' '\n' | awk '!a[$0]++')
