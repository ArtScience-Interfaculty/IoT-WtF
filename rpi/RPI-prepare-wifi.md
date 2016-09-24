# easily access pi on your home network, plus some other stuff (tired of the cat?)


## change hostname, on the pi, by default it is rapberrypi.local
```bash
sudo nano /etc/hostname
```

## change password
```bash
passwd
```

## add your home network
* on the raspberry, do:
```bash
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf 
```

* add (and fill in) this:
```bash
network={
        ssid="YOURWIRELESSNETWORKNAME"
        psk="ITSPASSWORD"
        key_mgmt=WPA-PSK
}
```

## when at home, you can find out rpi's ip
### use ping for this
### NB. you may need to add .local:
```bash
ping raspberrypi

BAD: ping: cannot resolve raspberrypi: Unknown host

ping raspberrypi.local

PING raspberrypi.local (192.168.1.45)

GOOD: 64 bytes from 192.168.1.45: icmp_seq=0 ttl=64 time=5.240 ms
```


## ssh
```bash
ssh pi@mynewrpihostname.local
```
## nodered in browser:
```bash
http://mynewrpihostname.local:1880
```






## cosmetics
### when tired of the daring cat
replace ~/share/cat-desktop-wallpaper-5.jpg with another image (but keep the name)

### change msg of the day (what you see when logging in):
```bash
sudo nano /etc/motd
```
