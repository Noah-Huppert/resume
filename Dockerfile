FROM ubuntu:18.04

# Install dependencies
COPY ./scripts/container/install-deps.sh /tmp/install-deps.sh
RUN /tmp/install-deps.sh
RUN rm /tmp/install-deps.sh

# Create run user
RUN adduser --disabled-password resume
WORKDIR /home/resume
USER resume

# Copy files into container
RUN mkdir resume
WORKDIR /home/resume/resume
COPY --chown=resume:resume . /home/resume/resume

