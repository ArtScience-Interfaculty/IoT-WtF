CONTENTS

0) raspi-config
a) connect to network
b) access rpi from your laptop (ssh remote login)
c) node-red (browser-based control over rpi, the internet and things)
d) camera commands (for rpi camera)
e) serial connection (requires special cable)
f) sensortag (small all-in-one bluetooth sensorbox from texas instruments)
g) keyboard layout (mapping of characters to keys)


0) main rpi configuration, switch on camera, spi, i2c, etc. 
```bash
raspi-config
```
a) connect to (wifi) network

Either insert a network (utp) cable in a utp socket, or use wifi, the first time you need to add a wifi network to the RPI, this is done easiest with a screen (HDMI!), usb-keyboard and usb-mouse.
- Click network icon (at top-right) 
- Select the network, and enter password (in case of wifi)
- check that it's connected


b) ssh remote login

• find rpi ip address (in Terminal of rpi)
```bash
ifconfig wlan0 
```

• look for a line like this ('inet' is rpi's ip address) :
```bash
inet 192.168.2.2 netmask 0xffffff00 broadcast 192.168.2.255
```

• Once the rpi is on the same network, you can connect (log in) from a laptop's terminal:
```bash
ssh pi@172.17.19.165
Are you sure you want to continue connecting (yes/no)? yes
... password: raspberry
```

// You end up in a session on the raspberry:
```bash
pi@raspberrypi:~ $
```



c) node-red

http://flows.nodered.org

// start node-red:
```bash
pi@raspberrypi:~ $ node-red-start
```

// Open a browser window and type in the address bar, enter rpi's ip/hostname, followed by :1880

http://rpihostname.local:1880/ 

```bash
pi@raspberrypi:~ $ node-red-stop 
```

• Finally, to autostart Node-RED at every boot
pi@raspberrypi:~ $ 
```bash
sudo systemctl enable nodered.service  
```

• if needed, upgrade nodejs and npm
```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nodejs npm node-semver
sudo npm install -g npm@2.x
sudo apt-get install nodered
```

• install Open Sound Control module
```bash
sudo npm install node-red-contrib-osc
```



d) camera

// take a picture
// http://elinux.org/Rpi_Camera_Module#RaspiStill
```bash
raspistill -v -o test.jpg
```
// take a video (10 seconds)
// http://elinux.org/Rpi_Camera_Module#RaspiVid
```bash
raspivid -o testvid.h264 -t 10000
```
// If you can't use .h264, convert it to normal .mp4
```bash
sudo apt-get update
sudo apt-get install gpac
MP4Box -add testvid.h264 testvid.mp4
```
-hf and -vf to horizontally/vertically flip the image (both still and vid)


e) serial
// needs screen, which needs to be installed, for example with homebrew (google)

// NB. insert serial cable before powering rpi
// find port:

(before inserting serial cable)
```bash
ls /dev/cu.*

/dev/cu.Bluetooth-Incoming-Port /dev/cu.HC-06-DevB
```
(after inserting serial cable)
```bash
ls /dev/cu.*
-->
/dev/cu.Bluetooth-Incoming-Port  /dev/cu.HC-06-DevB     /dev/cu.usbserial                
```

so, /dev/cu.usbserial is new, that's the one:
screen allows to open a terminal over the serial connection
the dumber is the speed of the connection (in bauds/second)

```bash
screen /dev/cu.usbserial 115200
screen /dev/tty.usbserial 115200

minicom -b 115200 -o -D /dev/tty.usbserial
lsof | grep /dev/tty.usbserial
```




f) sensortag

// http://mike.saunby.net/2013/04/raspberry-pi-and-ti-cc2541-sensortag.html
```bash
sudo apt-get install bluetooth
```
// find device
```bash
sudo hcitool lescan
-->
LE Scan ...
90:59:AF:0A:A8:4E (unknown)
90:59:AF:0A:A8:4E SensorTag
```
ctrl c

// connect to device
```bash
sudo hcitool lecc 90:59:AF:0A:A8:4E
```
// switch on a sensor, read its value
```bash
gatttool -b 90:59:AF:0A:A8:4E --interactive
```

g) keyboard layout

```bash
sudo nano /etc/default/keyboard
XKBLAYOUT=”gb”  ->  XKBLAYOUT=”us”
```
// set another keyboard mapping
```bash
setxkbmap us
```
