# Raspberry Pi

## powerup

アップデートをまとめたエイリアス

```sh
vi ~/.bash_aliases

alias powerup='apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt autoclean -y'
```

## Install Node.js

<https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions>

<https://github.com/nodesource/distributions/blob/master/README.md>

### Node.js v10.x:

```sh
curl -sL https://deb.nodesource.com/setup_10.x | bash -
sudo apt-get install -y nodejs

nodejs -v
npm -v
```

## Install Docker

<https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/>

```sh
curl -sSL https://get.docker.com | sh
```
