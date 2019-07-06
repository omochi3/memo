# Raspberry Pi

## 認証周り

### アカウント

`pi` ユーザーでログインして、以下のコマンドを実行する。

```sh
# pi ユーザーのパスワードを変更する
sudo passwd pi

# 新規ユーザーを作成する
sudo useradd --groups sudo -m USERNAME
# 登録したユーザーのパスワードを設定する
sudo passwd USERNAME

# root ユーザーのパスワードを変更する
sudo passwd root

# pi ユーザーをロックする
sudo passwd --lock pi
```

`USERNAME` の部分を自分のユーザー名に書き換えること。

### ssh

#### 秘密鍵と公開鍵の作成

ラズパイ以外の端末で以下のコマンドを実行する。
最近のWindows10であれば、OS標準でコマンドが用意されているっぽい。

```sh
ssh-keygen -t rsa
```

指定したディレクトリに秘密鍵 (id_rsa) と公開鍵 (id_rsa.pub) が作成されるので、公開鍵 (id_rsa.pub) をラズパイにコピーする。
ネットワーク経由でのコピーが難しいのであれば、ラズパイをインストールしたmicroSDカードに配置してよい。
( `config.txt` 等のファイルが保管されているパーミッション)

#### ssh サーバーの設定（ラズパイ）

以下のコマンドを実行し、SSHの設定を行う。

```sh
sudo vi /etc/ssh/sshd_config
----------------------------------------
LoginGraceTime 2m           # ログイン猶予時間 (2分)
PermitRootLogin no          # ssh での root ユーザーログイン (許可しない)
StrictModes yes             # ユーザーホームディレクトリのオーナー、パーミッションをチェック (する)
RSAAuthentication yes       # RSA 認証 (許可)
PubkeyAuthentication yes    # 公開鍵認証 (許可)
AuthorizedKeysFile .ssh/authorized_keys # 認証に使用する公開鍵ファイル
PermitEmptyPasswords no     # 空パスワード (許可しない)
ChallengeResponseAuthentication no # チャレンジレスポンス認証 (許可しない)
PasswordAuthentication no   # パスワード認証 (許可しない)
UsePAM no                   # PAM（Pluggable Authentication Module）認証 (許可しない)
```

```sh
# 公開鍵ファイルを登録する
mkdir ~/.ssh
chmod 0700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# sshd を再起動する
sudo systemctl restart ssh
```

#### ssh クライアントの設定（Windows 等）

```sh
ssh -i ~/.ssh/id_rsa user@ラズパイのホスト名 or IP
```

毎回このコマンドをたたくのが面倒なら config ファイルに設定することも可能。

```config
Host raspi
    HostName ラズパイのホスト名 or IP
    Port 22
    User ユーザー名
    IdentityFile id_rsaのパス
```

config ファイルに登録した情報を使って ssh ログイン。
```sh
ssh raspi
```

## powerup

アップデートをまとめたエイリアス

```sh
vi ~/.bash_aliases

alias powerup='sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'
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
