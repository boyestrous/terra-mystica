FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
#RUN sudo apt-get update
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Moose JSON Method::Signatures::Simple Exporter::Easy DBI Bytes::Random::Secure Crypt::Eksblowfish::Bcrypt Crypt::CBC File::Slurp
RUN sudo apt-get install emacs
RUN sudo apt install postgresql

USER gitpod

# Give back control
USER root
