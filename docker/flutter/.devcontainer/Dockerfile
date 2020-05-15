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
ENV ANDROID_BUILD_TOOLS "29.0.3"
ENV SDK_TOOLS 6200805_latest

RUN mkdir "${ANDROID_HOME}" && \
    apt-get update && \
    apt-get -y install unzip default-jdk

WORKDIR $ANDROID_HOME
ADD https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS}.zip .
RUN unzip commandlinetools-linux-${SDK_TOOLS}.zip && \
    rm commandlinetools-linux-${SDK_TOOLS}.zip && \
    chmod -R +x tools/bin

ENV PATH="${PATH}":"${ANDROID_HOME}/tools/bin":"${ANDROID_HOME}/build-tools/${ANDROID_BUILD_TOOLS}":"${ANDROID_HOME}/platform-tools"

RUN yes | sdkmanager --update --sdk_root=${ANDROID_HOME}
RUN yes | sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null
RUN yes | sdkmanager --sdk_root=${ANDROID_HOME} "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null
RUN yes | sdkmanager --update --sdk_root=${ANDROID_HOME}
RUN yes | sdkmanager --licenses --sdk_root=${ANDROID_HOME}

WORKDIR /flutter
ADD https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.17.1-stable.tar.xz .
RUN cd /flutter \
    && tar xf flutter_linux_1.17.1-stable.tar.xz \
    && rm flutter_linux_1.17.1-stable.tar.xz \
    && flutter precache

WORKDIR /workspace

ENV DEBIAN_FRONTEND=dialog
