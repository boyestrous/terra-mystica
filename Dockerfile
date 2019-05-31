FROM gitpod/workspace-postgres

USER root
# Install custom tools, runtime, etc.
#RUN sudo apt-get update
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Moose JSON Method::Signatures::Simple Exporter::Easy DBI Bytes::Random::Secure Crypt::Eksblowfish::Bcrypt Crypt::CBC File::Slurp
RUN apt-get update && apt-get install -y emacs23-nox
RUN apt-get -y install postgresql postgresql-contrib mysql-server mysql-client
EXPOSE 5432

# Setup postgres server for user gitpod
USER gitpod

# Give back control
USER root
