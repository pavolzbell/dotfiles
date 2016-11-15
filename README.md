# dotfiles

Fishedotfiles

## Setup

* Clone `git clone https://github.com/pavolzbell/dotfiles.git`

### OS X defaults

* Run `./osx`

### Homebrew setup

* Run `./brew`

### Shell bootstrap

* Run `source bootstrap.sh`
* Add fish to known shells `sudo echo -e "\n/usr/local/bin/fish" >> /etc/shells`
* Set fish as default shell `chsh -s fish`
* Set path to GNU coreutils `set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths` to replace outdated OS X utilities

### Notes

* Link SHA256 checksum `sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum`
* Configure Elasticsearch at `usr/local/etc/elasticsearch/elasticsearch.yml`
* Configure PostgreSQL at `/usr/local/var/postgres/postgresql.conf`
* Configure Redis at `/usr/local/etc/redis.conf`
* Consider `brew pin elasticsearch postgresql redis readline sqlite`
* Check `brew list --pinned --versions`
* Check `brew services list`

## References

* [gf3/dotfiles](https://github.com/gf3/dotfiles)
* [kevinSuttle/dotfiles](https://github.com/kevinSuttle/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [smolnar/dotfiles](https://github.com/smolnar/dotfiles)

## License

This software is released under the [MIT License](LICENSE.md)
