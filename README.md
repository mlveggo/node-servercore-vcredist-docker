# Node.js on Windows ServerCore with installed VC redistributable

This project brings [Node.js](https://nodejs.org/) (version 20 to 24) and [VC redist](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) package on [Microsoft Windows Server Core](https://hub.docker.com/r/microsoft/windows-servercore) base image. Based on https://github.com/amitie10g/node-nanoserver-docker project.

## Tags

- `latest` `24-ltsc2019`
- `jod` `jod-ltsc2019` `22-ltsc2019`
- `iron` `iron-ltsc2019` `20-ltsc2019`

[Full list of tags avilable](https://github.com/mlveggo/node-servercore-vcredist-docker/pkgs/container/node-servercore-vcredist) at both GitHub Container registry and [Docker Hub Container registry](https://hub.docker.com/r/mlveggo/mlveggo/node-servercore-vcredist).

## Usage

This project is intended to be used as base image for other Node-based projects. An example Dockerfile:

    FROM mlveggo/node-servercore-vcredist:jod-ltsc2019

    COPY . C:\\Users\\ContainerUser\\app
    RUN npm install --omit=dev

    ENTRYPOINT ["npm", "start"]

If you need to install system-wide software, you need to set `USER` as `ContainerAdministrator`. Afterward, you need to change it back to `ContinerUser`.

If you want to use it within GitHub Actions, prefer the GitHub Container registry: `ghcr.io/mlveggo/node-servercore-vcredist`

## Building

Containers for this project has been built using [GitHub Actions](https://github.com/features/actions) for automated quarterly builds from 20 to 24 under Windows Server Core ltsc2019.

    docker build -t <tag> --build-arg NODE_VER=<node version> --build-arg BASE_IMG=<base image> --build-arg CONT_VER=<container version> --build-arg VCREDIST_VER=<vcredist version> .

Where,

- `NODE_VER` is used to download Node from `https://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}-win-x64.zip`
- `BASE_IMG` is the base image, either `windows/servercore` or `powershell`
- `CONT_VER` is the tag available for each base image. For a full list of available tags, consult the respective page of the base images provided (links above).
- `VCREDIST_VER` is used to specify VC redist version `https://aka.ms/vs/${VCREDIST_VER}/release/vc_redist.x64.exe`

## Licensing

- Everything in this repo is released into the Public domain (the Unlicense)
- **Node.js** is licensed under the **[MIT License](https://opensource.org/license/mit/)**.
- **Microsoft Windows container images** usage is subjected to the **[Microsoft EULA](https://learn.microsoft.com/en-us/virtualization/windowscontainers/images-eula)**
- **Microsoft PowerShell** is licensed under the **MIT License**.
- **VC redist** licensing **[link](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)**
