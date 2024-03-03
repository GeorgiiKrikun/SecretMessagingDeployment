FROM ubuntu:22.04 as base

ARG APP_DIR=home/
COPY requirements.txt /app/requirements.txt
COPY home/ /app/home/


RUN apt update && apt install -y python3 python3-pip
# Install dependencies
RUN pip3 install -r /app/requirements.txt

COPY home/ /app/


