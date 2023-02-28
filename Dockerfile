ARG BASE_IMAGE=tensorflow/tensorflow:2.9.1-gpu

FROM $BASE_IMAGE

LABEL org.opencontainers.image.authors="Dmitri Rubinstein"
LABEL org.opencontainers.image.source="https://github.com/dmrub/pcdgeneration"

COPY requirements.txt /etc/

RUN set -ex; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libgl1; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    python3 -m pip install --upgrade pip; \
    python3 -m pip install -r /etc/requirements.txt;
