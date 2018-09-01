# dotfiles

Fishedotfiles

## Setup

    cd ~
    curl -fsSL 'https://github.com/pavolzbell/dotfiles/archive/master.zip' > dotfiles.zip
    unzip dotfiles.zip
    cd dotfiles-master
    ./bootstrap
    cd ..
    rm -rf dotfiles-master dotfiles.zip
    ./brew
    sudo echo -e "\n/usr/local/bin/fish" >> /etc/shells
    chsh -s fish
    set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths
    sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
    brew pin fish readline elasticsearch postgresql redis sqlite
    ./macos

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
