# Kali Linux Pi3

## 初期セットアップ

### パーティションのリサイズ

```
apt update
apt install gparted
...
gparted
```

カレントパーティションをResizeする。

### 最新化

```
apt update
apt full-upgrade
```

### 日本語化

#### キーボードレイアウト

```
dpkg-reconfigure keyboard-configuration
[Generic 105-key (Intel) PC > Japanese > Japanese > The default for the keyboard layout > No compose key]
```

#### ロケール

```
dpkg-reconfigure locales
[ja_JP.UTF-8 UTF-8]
[ja_JP.UTF-8]
```

#### タイムゾーン

```
dpkg-reconfigure tzdata
[Asia > Tokyo]
```

#### フォント

```
apt install fonts-noto
```

#### IME

```
apt install uim uim-anthy
# apt install fcitx-mozc
```

mozcはrootユーザーだと動作しない。

### 画面解像度

```bash
vi /boot/config.txt
===
hdmi_group=2   # <--- HDMI
hdmi_mode=82   # <--- 1920x1080 60 Hz
===
```

### その他

#### 便利なツール

```
apt install xfce4-goodies
```

パネルにいろいろ追加できたりする

## セキュリティ設定

Secure Kali Pi 2018
<https://www.kali.org/tutorials/secure-kali-pi-2018/>

### パスワード変更

```
passwd

```



## 導入済みツール

### nmap

...

## 入れたいツール

zap
openvas
metsploit
vuls
