# dotfiles

Fishedotfiles

## Setup

    cd ~
    curl -Lo dotfiles.zip https://github.com/pavolzbell/dotfiles/archive/master.zip
    unzip dotfiles.zip
    cd dotfiles-master
    ./bootstrap
    cd ..
    rm -rf dotfiles-master dotfiles.zip
    ./.brew
    echo -e "/usr/local/bin/fish" | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
    fish
    set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths
    sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
    brew pin fish readline elasticsearch@2.4 postgresql@9.5 redis sqlite
    ./.macos
    syupdate
    sudo reboot

### macOS

    set name "vulture"
    sudo scutil --set ComputerName $name
    sudo scutil --set HostName $name
    sudo scutil --set LocalHostName $name
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $name

* Check system integrity protection `csrutil status`
* Permit operations `csrutil disable` and `reboot`, then enable again
* Check `defaults read NSGlobalDomain AppleFontSmoothing` should be `2`
* Check `defaults read NSGlobalDomain KeyRepeat` should be `2`
* Check `defaults read NSGlobalDomain InitialKeyRepeat` should be `14`
* Check `defaults read com.apple.dock tilesize` should be `34` or `48`

### Services

* Configure Elasticsearch at `usr/local/etc/elasticsearch/elasticsearch.yml`
* Configure PostgreSQL at `/usr/local/var/postgres/postgresql.conf`
* Configure Redis at `/usr/local/etc/redis.conf`
* Check pinning versions `brew list --pinned --versions`
* Check running services `brew services list`

## References

* [gf3/dotfiles](https://github.com/gf3/dotfiles)
* [kevinSuttle/dotfiles](https://github.com/kevinSuttle/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

This software is released under the [MIT License](LICENSE.md)
