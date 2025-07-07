FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-yaml \
    python3-venv

#create vm
RUN python3 -m venv /venv

#upgrade pip within the vm
RUN /venv/bin/pip install --upgrade pip

#install python dependencies inside the vm
RUN /venv/bin/pip install pyyaml

#copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

#set the cm as the default python environment
ENV PATH="/venv/bin:$PATH"
ENTRYPOINT ["/entrypoint.sh"]