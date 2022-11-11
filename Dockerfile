# syntax = docker/dockerfile:1.4
FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04

ENV CONDA_HOME=/opt/anaconda3
ENV JUPYTER_ROOT_DIR=/root/project

COPY ./scripts/anaconda-install.sh /opt/
COPY ./scripts/pkg-install.sh /opt/
COPY ./scripts/jupyterlab-run.sh /root/
COPY ./resources/.condarc /root/.condarc
COPY ./resources/sources.list /etc/apt/sources.list

RUN rm -rf /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt apt update -yq \
    && apt install curl wget -yq \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install nodejs yarn -yq

# Install anaconda3
RUN --mount=type=cache,target=/root/.cache/pip bash /opt/anaconda-install.sh \
    && bash /opt/pkg-install.sh \
    && echo "/root/jupyterlab-run.sh" >> /root/.bashrc
    
COPY ./resources/ipython_config.py /root/.ipython/profile_default/ipython_config.py
COPY ./resources/jupyter_lab_config.py /root/.jupyter/jupyter_lab_config.py

ENTRYPOINT /bin/bash /root/jupyterlab-run.sh
