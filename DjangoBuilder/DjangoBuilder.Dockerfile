FROM ubuntu:22.04 as base

RUN apt update && apt install -y python3 python3-pip
# Install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt


