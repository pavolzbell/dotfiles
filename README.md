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
    brew pin fish readline elasticsearch postgresql redis sqlite
    ./.macos
    syupdate
    sudo reboot

## Notes

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
