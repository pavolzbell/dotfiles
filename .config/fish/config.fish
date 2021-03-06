set -gx EDITOR vim

set -gx LC_CTYPE en_US.UTF-8

set -gx QUOTING_STYLE literal
set -gx TIME_STYLE "+%F %T"

set -gx MANPAGER "less -X"
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman:/usr/local/share/man:/usr/share/man

#
# Java
#

set -gx PATH $HOME/.jenv/shims $PATH
command jenv rehash 2> /dev/null

#
# Ruby
#

set -gx JRUBY_OPTS --dev
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
abbr -a r bundle exec rails

abbr -a rails bundle exec rails
abbr -a rake  bundle exec rake
abbr -a rspec bundle exec rspec

abbr -a h history
abbr -a j jobs

abbr -a la ls --group-directories-first --indicator-style=none -lh -A
abbr -a ls ls --group-directories-first --indicator-style=none

abbr -a ta "tree --dirsfirst --timefmt='%F %T' -N -phD -ug -a"
abbr -a tr "tree --dirsfirst --timefmt='%F %T' -N"

abbr -a df df -h
abbr -a dn ncdu -2
abbr -a du du -h -d 1

abbr -a cpssh "pbcopy < ~/.ssh/id_rsa.pub"

#
# Network helpers
#

abbr -a ip "dig +short myip.opendns.com @resolver1.opendns.com"

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
# TODO fix: this operation keeps creation date but changes modification date of affected directories therefore consider keeping .DS_Store files
# alias dscleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Recursively delete ._* files and merges most recent attributes
# TODO fix: consider effects of --keep=native and keeping ._* files
# alias dtcleanup "dot_clean -mv ."

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
