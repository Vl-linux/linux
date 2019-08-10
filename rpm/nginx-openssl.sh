#!/bin/bash
yum install -y gcc wget yum-utils createrepo rpm-build rpmdevtools redhat-lsb-core
wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.14.1-1.el7_4.ngx.src.rpm #SRPM NGINX
rpm -i nginx-1.14.1-1.el7_4.ngx.src.rpm #SRPM NGINX
wget https://www.openssl.org/source/latest.tar.gz
tar -xvf latest.tar.gz
sudo yum-builddep rpmbuild/SPECS/nginx.spec
sed -i 's/--with-debug/--with-openssl=\/root\/openssl-1.1.1c/' rpmbuild/SPECS/nginx.spec
rpmbuild -bb rpmbuild/SPECS/nginx.spec
yum localinstall -y rpmbuild/RPMS/x86_64/nginx-1.14.1-1.el7_4.ngx.x86_64.rpm #RPM NGINX
systemctl start nginx
#systemctl status nginx
mkdir /usr/share/nginx/html/repo
cp rpmbuild/RPMS/x86_64/nginx-* /usr/share/nginx/html/repo/
wget http://www.percona.com/downloads/percona-release/redhat/0.1-6/percona-release-0.1-6.noarch.rpm -O /usr/share/nginx/html/repo/percona-release-0.1-6.noarch.rpm
createrepo /usr/share/nginx/html/repo/
sed '/index  index.html index.htm;/a\        autoindex on;' /etc/nginx/conf.d/default.conf
nginx -t
nginx -s reload
cat >> /etc/yum.repos.d/mytest.repo << EOF
[mytest]
name=my-test
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF
exit 0;
