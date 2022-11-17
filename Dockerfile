FROM ubuntu:18.04

# Install dependencies
# So we don't get prompted when installing stuff
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y texlive-full curl apt-transport-https ca-certificates gnupg make aspell

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get -qq update
RUN apt-get install -y google-cloud-cli

# Create run user
RUN adduser --disabled-password resume
WORKDIR /home/resume
USER resume

# Copy files into container
RUN mkdir resume
WORKDIR /home/resume/resume
#COPY --chown=resume:resume . /home/resume/resume
