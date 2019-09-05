FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y texlive-full curl

RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get -qq update
RUN apt-get install -y google-cloud-sdk

# Create run user
RUN adduser --disabled-password resume
WORKDIR /home/resume
USER resume

# Copy files into container
RUN mkdir resume
WORKDIR /home/resume/resume
COPY --chown=resume:resume . /home/resume/resume

