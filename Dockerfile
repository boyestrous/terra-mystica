FROM gitpod/workspace-postgres

USER root
# Install custom tools, runtime, etc.
RUN apt-get update \
 && apt-get -y install apache2 multitail \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Moose JSON Method::Signatures::Simple Exporter::Easy DBI Bytes::Random::Secure Crypt::Eksblowfish::Bcrypt Crypt::CBC File::Slurp
RUN apt-get update && apt-get install -y emacs23-nox
RUN apt-get -y install postgresql postgresql-contrib mysql-server mysql-client
EXPOSE 5432

# 1. give write permission to the gitpod-user to apache directories
# 2. let Apache use apache.conf and apache.env.sh from our /workspace/<myproject> folder
RUN chown -R gitpod:gitpod /var/run/apache2 /var/lock/apache2 /var/log/apache2 \
 && echo "include \${GITPOD_REPO_ROOT}/terra-mystica/config/apache.conf" > /etc/apache2/apache2.conf \
 && echo ". \${GITPOD_REPO_ROOT}/config/apache.env.sh" > /etc/apache2/envvars

# Setup postgres server for user gitpod
USER gitpod

# Give back control
USER root
