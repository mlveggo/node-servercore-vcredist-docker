ARG BASE_IMG=windows/servercore
ARG CONT_VER=ltsc2025

FROM mcr.microsoft.com/${BASE_IMG}:${CONT_VER}

ARG NODE_VER=22.14.0
ARG BASE_URL=https://nodejs.org/dist
ARG VCREDIST_VER=15
ARG VCREDIST_URL=https://aka.ms/vs/${VCREDIST_VER}/release/vc_redist.x64.exe

ADD ${VCREDIST_URL} vc_redist.x64.exe
RUN vc_redist.x64.exe /install /quiet /norestart && del vc_redist.x64.exe

ADD ${BASE_URL}/v${NODE_VER}/node-v${NODE_VER}-x64.msi node.msi
RUN msiexec /i node.msi /quiet /norestart && del node.msi

LABEL \
  org.opencontainers.image.title="Node.js on Windows Server Core with VC redist" \
  org.opencontainers.image.description="Node.js on Windows Server Core with VC redist"
