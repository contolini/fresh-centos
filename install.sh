#!/bin/sh

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
source ~/.bashrc
nvm install 5

sudo sh -c "cat >>/etc/yum.repos.d/10gen.repo" <<-EOF
[10gen]
name=10gen Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64
gpgcheck=0
enabled=1
EOF

sudo yum -y install mongo-10gen mongo-10gen-server git

sudo mkdir -p /var/lib/mongo
sudo mkdir -p /var/log/mongodb
sudo mkdir -p /var/run/mongodb
sudo chown -R mongod:mongod /var/run/mongodb/
sudo chown -R mongod:mongod /var/log/mongodb/
sudo chown -R mongod:mongod /var/lib/mongo/

sudo chkconfig mongod on
mongod
