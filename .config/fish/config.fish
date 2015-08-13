# TODO find a better way how to: fix bin & man for GNU coreutils,
# http://www.softec.lu/site/DevelopersCorner/MasteringThePathHelper
# add /usr/local/opt/coreutils/libexec/gnuman to /etc/manpaths -> does not work
set -Ux MANPATH /usr/local/opt/coreutils/libexec/gnuman /usr/local/share/man /usr/share/man
# add /usr/local/opt/coreutils/libexec/gnubin to /etc/paths -> works
# set -Ux PATH /usr/local/opt/coreutils/libexec/gnubin ... -> works, but not a good solution
# set -Ux fish_user_paths /usr/local/opt/coreutils/libexec/gnubin -> works, but not a good solution

# TODO find a better way how to: fix default ruby on start
#rvm default

set -x EDITOR vim
set -x MANPAGER "less -X"

#
# Git
#

set -g __fish_git_prompt_show_informative_status 1

set -g __fish_git_prompt_char_cleanstate ≀
set -g __fish_git_prompt_char_dirtystate +
set -g __fish_git_prompt_char_invalidstate ×
set -g __fish_git_prompt_char_stagedstate ◴
set -g __fish_git_prompt_char_stashstate ✱
set -g __fish_git_prompt_char_stateseparator ¦
set -g __fish_git_prompt_char_untrackedfiles …
set -g __fish_git_prompt_char_upstream_ahead ⇡
set -g __fish_git_prompt_char_upstream_behind ⇣
set -g __fish_git_prompt_char_upstream_diverged ≠
set -g __fish_git_prompt_char_upstream_equal =
set -g __fish_git_prompt_char_upstream_prefix ''

#
# Shortcuts
#

abbr -a d cd ~/Downloads
abbr -a p cd ~/Projects
abbr -a w cd ~/Workspace

abbr -a b bundle
abbr -a r rails
abbr -a g git

abbr -a h history
abbr -a j jobs

abbr -a l  ls --indicator-style=none -lh
abbr -a la ls --indicator-style=none -lh -A
abbr -a ls ls --indicator-style=none

abbr -a k  tree --dirsfirst -hC -pD -ug -L 1
abbr -a ka tree --dirsfirst -hC -pD -ug -L 1 -a
abbr -a ks tree --dirsfirst

abbr -a du du -h -d 1
abbr -a df df -h

# Copy SSH public key to clipboard
abbr -a cpssh "pbcopy < ~/.ssh/id_rsa.pub"

# Intuitive map function, find . -name .gitattributes | map dirname
alias map "xargs -n1"

#
# Application helpers
#

# Kill all the tabs in Chrome to free up memory
abbr -a killchrome "ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

#
# Network helpers
#

abbr -a ip "dig +short myip.opendns.com @resolver1.opendns.com"
abbr -a ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
abbr -a localip "ipconfig getifaddr en0"

for method in GET HEAD POST PUT DELETE TRACE OPTIONS
	abbr -a "$method" "lwp-request -m '$method'"
end

#
# OS X helpers
#

# Update OS X, brew and gems
alias update "sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; sudo gem update --system; sudo gem update"

# Flush Directory Service cache
alias dsflush "dscacheutil -flushcache; and killall -HUP mDNSResponder"

# Recursively delete `.DS_Store` files
alias dscleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Clean up Launch Services to remove duplicates in the “Open With” menu
alias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# Empty the Trash on all mounted volumes
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Enable/disable Spotlight indexing
alias spotoff "sudo mdutil -a -i off"
alias spoton  "sudo mdutil -a -i on"

# Show/hide hidden files
alias showfiles "defaults write com.apple.finder AppleShowAllFiles -bool true;  and killall Finder"
alias hidefiles "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# Show/hide desktop icons
alias showicons "defaults write com.apple.finder CreateDesktop -bool true;  and killall Finder"
alias hideicons "defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"

# Merge PDF files, usage: `mergepdf output.pdf input{1,2,3}.pdf`
alias mergepdf "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py -o"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530
alias stfu "osascript -e 'set volume output muted true'"
alias pumpitup "osascript -e 'set volume 7'"

# Lock the screen
alias afk "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession -suspend"
