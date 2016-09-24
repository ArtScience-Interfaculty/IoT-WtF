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
raspi-config

a) connect to (wifi) network

Either insert a network (utp) cable in a utp socket
Or use wifi, the first time you need to add a wifi network to the RPI, this is done easiest with a screen (HDMI!), usb-keyboard and usb-mouse.

- Click network icon (at top-right) 
- Select the network, and enter password (in case of wifi)
- check that it's connected


b) ssh remote login

// find rpi ip address (in Terminal of rpi)
ifconfig wlan0 

//look for a line like this ('inet' is rpi's ip address) :
	inet 192.168.2.2 netmask 0xffffff00 broadcast 192.168.2.255

// Once the rpi is on the same network,
// you can connect (log in) from a laptop's terminal:
ssh pi@172.17.19.165

Are you sure you want to continue connecting (yes/no)? yes
... password: raspberry


// You end up in a session on the raspberry:
pi@raspberrypi:~ $



c) node-red

http://flows.nodered.org

// start node-red:
pi@raspberrypi:~ $ node-red-start

// Open a browser window and type in the address bar:
// (enter rpi's IP address (see above), followed by :1880 (port number))

http://172.17.19.165:1880/ 

// after doing Control-C to stop, just to avoid a hanging process:
pi@raspberrypi:~ $ node-red-stop 

// Finally, to autostart Node-RED at every boot
pi@raspberrypi:~ $ sudo systemctl enable nodered.service  

// if needed, upgrade nodejs and npm
sudo apt-get update
sudo apt-get upgrade


sudo apt-get install nodejs npm node-semver
sudo npm install -g npm@2.x
sudo apt-get install nodered

// install Open Sound Control module
sudo npm install node-red-contrib-osc




d) camera

// take a picture
// http://elinux.org/Rpi_Camera_Module#RaspiStill
raspistill -v -o test.jpg

// take a video (10 seconds)
// http://elinux.org/Rpi_Camera_Module#RaspiVid
raspivid -o testvid.h264 -t 10000

// If you can't use .h264, convert it to normal .mp4
sudo apt-get update
sudo apt-get install gpac
MP4Box -add testvid.h264 testvid.mp4

-hf and -vf to horizontally/vertically flip the image (both still and vid)


e) serial
// needs screen, which needs to be installed, for example with homebrew (google)

// NB. insert serial cable before powering rpi
// find port:

(before inserting serial cable)
$ls /dev/cu.*
-->
/dev/cu.Bluetooth-Incoming-Port /dev/cu.HC-06-DevB

(after inserting serial cable)
$ls /dev/cu.*
-->
/dev/cu.Bluetooth-Incoming-Port  /dev/cu.HC-06-DevB     /dev/cu.usbserial                

// so, /dev/cu.usbserial is new, that's the one:
// screen allows to open a terminal over the serial connection
// the dumber is the speed of the connection (in bauds/second)
$screen /dev/cu.usbserial 115200


screen /dev/tty.usbserial 115200


(minicom -b 115200 -o -D /dev/tty.usbserial)
(lsof | grep /dev/tty.usbserial)




f) sensortag

// http://mike.saunby.net/2013/04/raspberry-pi-and-ti-cc2541-sensortag.html
sudo apt-get install bluetooth

// find device
sudo hcitool lescan
-->
LE Scan ...
90:59:AF:0A:A8:4E (unknown)
90:59:AF:0A:A8:4E SensorTag
ctrl c

// connect to device
sudo hcitool lecc 90:59:AF:0A:A8:4E

// switch on a sensor, read its value
gatttool -b 90:59:AF:0A:A8:4E --interactive


g) keyboard layout

sudo nano /etc/default/keyboard
XKBLAYOUT=”gb”  ->  XKBLAYOUT=”us”

// set another keyboard mapping
setxkbmap us