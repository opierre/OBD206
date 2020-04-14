# OBD206

Car Dashboard using Raspberry Pi 3 B+

## Notes

This project was initiated in 2018 from scratch to learn QML and to start practicing with RPI and official 7" touchscreen monitor. Unfortunatly there are no comments in code...

### Prerequisites

To deploy the app on RPI, tested environment is based on:

* Raspbian Lite Stretch (*Linux pi 4.19.76-v7+*)
* Qt5 version 5.10.1 compiled for [RPI](https://wiki.qt.io/Native_Build_of_Qt5_on_a_Raspberry_Pi)

On host :

* ARM cross compiler toolchain (GCC/G++ 6.3)
* RPI sysroot to cross compile on host and deploy app via ssh

### TODO

* **First Page**: 
  * Mapbox GL plugin to implement Navigation module with [GPS module](https://www.kubii.fr/cartes-extension-cameras-raspberry-pi/1922-module-gps-pour-raspberry-pi-kubii-3272496007888.html)
  * Traffic On/Off
  * Dark/Light mode for navigation
* **Third Page**: Implement music control from car (Radio, External music, Spotify plugin ?)
* **Fourth Page**: Rear view camera with [camera module](https://www.kubii.fr/cameras-accessoires/1653-module-camera-v2-8mp-kubii-640522710881.html) 


## Captures

This project is intended to display data coming from OBD adapter in car. OBD protocol is not implemented but a QML animation is able to simulate all widgets.

**Page 1**

![page1](https://github.com/polivier2/OBD206/raw/master/captures/page1.png "Page 1")

**Page 2 - Fuel**

![page2fuel](https://github.com/polivier2/OBD206/raw/master/captures/page2_fuel.png "Page 2 - Fuel")

**Page 2 - KM**

![page2km](https://github.com/polivier2/OBD206/raw/master/captures/page2_kms.png "Page 2 - KM")

**Page 2 - Temperature**

![page2temp](https://github.com/polivier2/OBD206/raw/master/captures/page2_temp.png "Page 2 - Temperature")

**Settings**

![settings](https://github.com/polivier2/OBD206/raw/master/captures/settings.png "Settings")

**Settings - Bluetooth**

![settingsblue](https://github.com/polivier2/OBD206/raw/master/captures/settings_bluetooth.png "Settings - Bluetooth")

## Assets

Logo (*to download/custom*:

* Bluetooth logo: Icon made by Google from [flaticon](www.flaticon.com)
* Camera Night Mode logo: Icon made by Freepik from [flaticon](www.flaticon.com)
* Gas Station logo: Icon made by Freepik from [flaticon](www.flaticon.com)
* GPS logo: Icon made by Vectors Market from [flaticon](www.flaticon.com)
* Home logo: Icon made by Pixel Perfect from [flaticon](www.flaticon.com)
* Idea logo: Icon from [flaticon](www.flaticon.com)
* Peugeot logo: Icon from Peugeot
* Sun logo: Icon made by Freepik from [flaticon](www.flaticon.com)
* More logo: Icon made by Smartline from [flaticon](www.flaticon.com)
* Music logo: Icon made by Pixel Perfect from [flaticon](www.flaticon.com)
* Navigation logo: Icon made by Smashicons from [flaticon](www.flaticon.com)
* Reverse Camera logo: Icon made by Freepik from [flaticon](www.flaticon.com)
* Speaker logo: Icon made by Pixel Perfect from [flaticon](www.flaticon.com)
* Traffic lights logo: Icon from [flaticon](www.flaticon.com)
* Wifi logo: Icon made by RoundIcons from [flaticon](www.flaticon.com)

Fonts: 

* Digital 7
* DEJAVU SANS
* Neo Sans
 
## Author

* **Pierre OLIVIER** - [polivier2](https://github.com/polivier2)