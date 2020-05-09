# Docker DevContainer

You will use this folder to easly setup your dev environment.

### Required software

Please make sure that you have installed:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)

Also, please create an account on [Hub Docker](https://hub.docker.com/).
This probably will be needed if we need special permission to download any docker image.

### DevContainers

On Visual Studio Code, please make sure that you have `ms-vscode-remote.remote-containers` extension installed.

You can start Flutter DevContainer by opening `flutter` folder present alongside with this `README.md` file that you are reading. Almost everything that you need is already configured.

Now you will need to open `flutter` folder using Visual Studio Code `Remote Containers` extension. So to know how to **Open a Folder** in DevContainers, please see [Official Documentation](https://code.visualstudio.com/docs/remote/containers).

## How to connect your Android Device from DevContainer

**Solution bellow is based on [Blog Codemagic](https://blog.codemagic.io/how-to-dockerize-flutter-apps/). All credits to them and thank you by the way.**

If you are using Windows Machine with Linux Containers, you will need ADB installed on your Windows to create a bridge between ADB Linux. So what you need is:
1) On your Windows Machine
   1) Download [Platform Tools from Google](https://developer.android.com/studio/releases/platform-tools)
   2) Extract adb on your Machine (Recommended: `C:\android`)
   3) Add to `PATH` system variable `C:\android\platform-tools`
2) On your Mobile Device
   1) Plug you Device on USB port
3) On your Windows Machine
   1) Open Command Prompt
   2) Type: `adb tcpip 5555`
4) On your Mobile Device
   1) Authorize debugging on your Mobile Device
   2) Save IP Address of your Mobile
5) On your Windows Machine
   1) Type: `adb connect {Your device ip address}:5555`
6) On Visual Studio Code opened with FLutter DevContainer
   1) On this DevContainer, type: `adb connect {Your device ip address}:5555`
7) On your Mobile Device
   1) Authorize debugging on your Mobile Device

If you are using Linux Machine, please ignore everything above. On `devcontainer.json` add the following code before closing braquets:
```
"runArgs": ["--privileged", "-v", "/dev/bus/usb:/dev/bus/usb"]
```