FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN perl -MCPAN -e install Moose
RUN sudo apt-get update

USER gitpod
# Apply user-specific settings
ENV ...

# Give back control
USER root
