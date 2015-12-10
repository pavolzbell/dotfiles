# dotfiles

## Clone repository

* Clone `git clone https://github.com/pavolzbell/dotfiles.git`

### OS X defaults

* Run `./osx`

### Homebrew formulae

* Run `./brew.sh`, installs brew, shells, utilities etc.

### Bootstrap shell

* Run `source bootstrap.sh`
* Add fish to known shells `sudo echo -e "\n/usr/local/bin/fish" >> /etc/shells`
* Set as default shell `chsh -s fish`
* Set path to GNU coreutils `set -U fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $fish_user_paths` to replace outdated OS X utilities

### Notes

* Install PostgreSQL, Elasticsearch, etc. with homebrew manually
* Configure PostgreSQL at `/usr/local/var/postgres/postgresql.conf`
* Configure Elasticsearch at `/usr/local/opt/elasticsearch/config/elasticsearch.yml`

## References

* [gf3/dotfiles](https://github.com/gf3/dotfiles)
* [kevinSuttle/dotfiles](https://github.com/kevinSuttle/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [smolnar/dotfiles](https://github.com/smolnar/dotfiles)

## License

This software is released under the [MIT License](LICENSE.md)
