FROM python:3.8-slim
ARG ANSIBLE_VERSION=2.9.6
ARG USER=ansible
ARG PASS=ansible
ARG UID=1000
ARG GID=1000

RUN apt-get update \
&&  apt-get install -y software-properties-common \
                        ssh \
                        gcc \
                        make \
                        git
    
RUN pip install --upgrade pip \
&&  pip install ansible==${ANSIBLE_VERSION} boto3 docker

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PASS}" | chpasswd
USER ${UID}:${GID}
WORKDIR /home/${USER}