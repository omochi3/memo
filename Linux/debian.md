# debian setup

## aps sources.list

/etc/apt/sources.list

## sudo

```bash
$ visudo
```

```bash
# /etc/sudoers
#
# This file MUST be edited with the 'visudo' command as root.
#
# See the man page for details on how to write a sudoers file.
#

Defaults        env_reset

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root    ALL=(ALL) ALL
hoge    ALL=(ALL) ALL
# Uncomment to allow members of group sudo to not need a password
# (Note that later entries override this, so you might need to move
# it further down)
# %sudo ALL=NOPASSWD: ALL
```

## VirtualBox Guest Additions

### Guest Additionsのビルド環境をインストールする

```bash
$ sudo apt install -y linux-headers-$(uname -r)
$ sudo apt build-dep -y linux
```

### Guest Additionsをインストールする

```bash
$ cd /media/cdrom
$ sudo sh ./VBoxLinuxAdditions.run
```

## GPG keyの更新

```bash
$ sudo apt-key list | grep exrired
```

```bash
pub 2048R/xxxxxxxx 20xx-xx-xx [expired: 20xx-xx-xx]
          ~~~~~~~~

$ sudo apt-key adv --keyserver keys.gnupg.net --recv-keys xxxxxxxx
Executing: gpg --ignore-time-conflict <xxxxxxx>
gpg requesting key xxxxxxxx
...
```

## docker

https://qiita.com/tatsuya_info/items/f8cee0bae9ec28b560d0

https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository
