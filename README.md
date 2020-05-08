# Call of Cthulhu RPG webapp created using Flutter and Flask

This project will be based on [Chaosium: Call of Cthulhu RPG](https://www.chaosium.com/call-of-cthulhu-rpg/) official documentation. All RPG content is reserved to them.

## Project information

Please use [Github: Projects](https://github.com/jsperafico/call_cthulhu/projects) to see our kanban progression.

If you find any issues, please report at [Github: Issues](https://github.com/jsperafico/call_cthulhu/issues),

Specific information about how to use the webapp, consult [Github: Wiki](https://github.com/jsperafico/call_cthulhu/wiki).

## How can you contribute to this project?

Please, if you want to contribute, you can start by recommended steps bellow.
Keep in mind, steps bellow be on folder `C:\Users\Public` consider alias `$USER_FOLDER$`: 


### Required software

Please make sure that you have installed:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)

Also, please create an account on [Hub Docker](https://hub.docker.com/).
This probably will be needed if we need special permission to download any docker image.

### DevContainers

On Visual Studio Code, please make sure that you have `ms-vscode-remote.remote-containers` extension installed.

Create folders inside your `$USER_FOLDER$` folder as follows:
- `$USER_FOLDER$\docker-images\dart\.devcontainer` consider alias `$DART_DEVCONTAINER$`
- `$USER_FOLDER$\workspace\dart` consider alias `$WORKSPACE_DART$`

Add a file `devcontainer.json`, on `$DART_DEVCONTAINER$` folder, with content:

```
{
	"name": "Dart",
	"dockerComposeFile": ["docker-compose.yml"],
	"service": "workspace_dart",
	"workspaceFolder": "/workspace",
	"settings": { 
		"terminal.integrated.shell.linux": "/bin/bash"
	},
	"extensions": [
		"dart-code.dart-code",
		"dart-code.flutter"
	]
}
```

Add a file `docker-compose.yml`, on `$DART_DEVCONTAINER$` folder, with content:

```
version: "3"
services:
    workspace_dart:
        build: .
        volumes:
            - ../../../workspace/dart:/workspace
        command: sleep infinity
```

Add a file `Dockerfile`, on `$DART_DEVCONTAINER$` folder, with content:

```
FROM google/dart:2

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="${PATH}":"/root/.pub-cache/bin":"/flutter/flutter/bin"
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install git openssh-client less iproute2 procps lsb-release \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /workspace \
    && mkdir /flutter

ENV ANDROID_HOME /usr/local/android
ENV ANDROID_COMPILE_SDK 29
ENV SDK_TOOLS 6200805_latest

RUN mkdir "${ANDROID_HOME}" && \
    apt-get update && \
    apt-get -y install unzip default-jdk

WORKDIR $ANDROID_HOME
ADD https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS}.zip .
RUN unzip commandlinetools-linux-${SDK_TOOLS}.zip && \
    rm commandlinetools-linux-${SDK_TOOLS}.zip && \
    chmod -R +x tools/bin

ENV PATH="${PATH}":"${ANDROID_HOME}/tools/bin"

RUN yes | sdkmanager --update --sdk_root=${ANDROID_HOME}
RUN yes | sdkmanager --licenses --sdk_root=${ANDROID_HOME}
RUN sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null

WORKDIR /flutter
ADD https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.17.0-stable.tar.xz .
RUN cd /flutter \
    && tar xf flutter_linux_1.17.0-stable.tar.xz \
    && rm flutter_linux_1.17.0-stable.tar.xz \
    && flutter precache

WORKDIR /workspace

ENV DEBIAN_FRONTEND=dialog
```

You can start a DevContainer from folder `$DART_DEVCONTAINER$`, if further help with **Visual Studio Code DevContainers**, please check [Official Documentation](https://code.visualstudio.com/docs/remote/containers).
