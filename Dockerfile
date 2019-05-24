FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
#RUN sudo apt-get update
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Moose JSON


USER gitpod

# Give back control
USER root
