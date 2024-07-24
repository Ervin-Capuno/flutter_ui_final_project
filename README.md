# CozyControl

CozyControl is a sample UI android application created using Flutter and Dart. It allows users to remotely control their home appliances. This project serves as the final project for Application Development.

Created by Bien Joshua Macuha, Ervin Rey Capuno, Karl Phillip Caringal, Nico Angelo Burog

## Features
- By long-pressing a room, the user can view the lux and temperature levels of that room and set the control mode to either automatic or manual.
- By tapping a room once, the user can see the different devices installed in that room.
- The user can view the kWh usage and the current state (on or off) of each device by tapping on it, which will bring up a bottom sheet allowing them to turn the device on or off.
- There is a settings option to connect to the microcontroller via Bluetooth Low Energy (BLE) or WiFi.
- The user can add a new room or add a device to a specific room.

## YouTube Link: 
https://youtu.be/iyiVLka8Ti8

## Environement Configurations
Ensure you have the following installed:
- Flutter SDK (version 3.19.6)
- Android Studio JellyFish or above
- Visual Studio
- Medium Phone API 24 or any version of Android Emulator

## Third-Party Packages Used
##### [To search the packages that used in this project](https://pub.dev/)
- flutter_arc_speed_dial: (version 2.0.1) used to create the arc speed dial.
- flutter_launcher_icons (version 0.13.1): Used to change the app icon.
- rename_app (version 1.6.1): Used to change the app's name.
- skeleton_text: (verion 3.0.1): Used to create a skeleton UI.
- image_picker: (version 0.8.5+3): Used to pick image from the local device.

## Getting Started
1. To download this Flutter project, use the following command in your terminal:
```bash
git clone git@github.com:Ervin-Capuno/flutter_ui_final_project.git
```
2. In the project directory where you clone it type the specific commands on the terminal/bash/cmd.
```bash
flutter pub get
```
This command is used to fetch and install all the package dependencies required for the Flutter project. It initializes the project by ensuring all necessary packages are downloaded and ready to use.
3. Now open the android emulator and type this command.
```bash
flutter run
``` 
It is used to run the flutter 

## Conrtibutors
- [Bien Joshua Macuha]()
- [Ervin Rey Capuno](https://github.com/Ervin-Capuno)
- [Karl Phillip Caringal](https://github.com/caringalkarl)
- [Nico Angelo Burog](https://github.com/NicoAngeloBurog)
