# 始める前に

最新化

```
# apt update

# apt upgrade -y
```

# 日本語化

## 日本語環境

```bash
apt install -y task-japanese task-japanese-desktop
```

## タイムゾーン

- Settings -> Details -> Date & Time -> Time Zone -> JST

## 日本語表示の入力

- Settings -> Region & Language -> Language
- Settings -> Region & Language -> Input Sources

## Installing VirtualBox Guest Additions in Kali Linux

```bash
apt update && apt install -y linux-headers-$(uname -r)
```

apt-get install virtualbox-guest-dkms