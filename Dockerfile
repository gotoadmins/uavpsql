#Download base image ubuntu 18.04
FROM ubuntu:18.04

# Update Software repository
RUN apt-get update

# Install postgresql Clients
RUN apt-get install -y unzip python3-pip wget && mkdir /root/.aws && echo region = us-east-1 > /root/.aws/credentials && pip3 install awscli
RUN wget https://releases.hashicorp.com/vault/1.1.2/vault_1.1.2_linux_amd64.zip && unzip vault_1.1.2_linux_amd64.zip && mv vault /usr/local/bin/
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'
RUN apt-get update && apt-get -y install postgresql-10
