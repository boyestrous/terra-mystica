FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
#RUN sudo apt-get update
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Moose JSON Method::Signatures::Simple Exporter::Easy DBI Bytes::Random::Secure Crypt::Eksblowfish::Bcrypt Crypt::CBC File::Slurp
RUN apt-get update && apt-get install -y emacs23-nox
RUN apt-get -y install postgresql postgresql-contrib mysql-server mysql-client

#Postgres create db, set users
RUN psql createdb terra-mystica
RUN psql terra-mystica < schema/schema.sql
RUN psql createuser gitpod -s


USER gitpod
RUN mkdir public
RUN mkdir public/www-prod

# Give back control
USER root
