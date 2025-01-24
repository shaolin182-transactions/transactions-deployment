FROM docker.io/ubuntu:24.04

# Install Python
RUN apt-get update
RUN apt-get -y install wget python3 python3-pip

# Install ansible and its dependencies
RUN python3 -m pip install --break-system-packages --user ansible

# For running kubernetes ansible task
RUN python3 -m pip install --break-system-packages --user kubernetes

# Install HELM
RUN wget -O- https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null
RUN apt-get install apt-transport-https --yes
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" >> /etc/apt/sources.list.d/helm-stable-debian.list'
RUN apt-get update
RUN apt-get install helm

ENV PATH=$PATH:/root/.local/bin

RUN mkdir -p /app