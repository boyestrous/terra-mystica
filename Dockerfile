FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN perl -MCPAN -e install Moose
RUN sudo apt-get update

USER gitpod

# Give back control
USER root
