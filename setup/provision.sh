# SELinuxの停止
sudo setenforce 0
sed -e "s/enforcing/disabled/g" /etc/selinux/config

# カーネルのアップデートを抑止
sudo sed -i -e "13i exclude=kernel*" /etc/yum.conf

# パッケージ管理システムの更新
sudo yum update -y

# コマンドインストール
sudo yum install -y wget
sudo yum install -y mercurial
sudo yum install -y ncurses-devel
sudo yum install -y make
sudo yum install -y gcc

## nginx1.8.1, php7.0, mysql5.6設定
# Nginxの導入
sudo rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
sudo yum -y install nginx

# nginxがセッションディレクトリにアクセスできるようにパーミッションの変更
sudo chown -R root.nginx /var/lib/php/session

# nginx.confのコピー
sudo cp /vagrant/setup/laravel.conf /etc/nginx/conf.d/laravel.conf

# PHP7の導入
sudo yum install epel-release
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo yum install -y --enablerepo=remi --enablerepo=remi-php70 php php-opcache php-devel php-fpm php-gd php-pdo php-dom php-mbstring php-mcrypt php-mysqlnd php-mssql php-pecl-xdebug php-openssl php-json php-pecl-apcu php-pdo_sqlite php-pdo_mysql php-pecl-memcached php-bcmath php-msgpack php-ldap php-pecl-imagick php-pgsql php-pecl-pthreads php-pecl-msgpack phpmyadmin

# php.ini設置
sudo mv /etc/php.ini /etc/php.ini_org
sudo cp /vagrant/setup/php.ini /etc/php.ini

# サーバの起動
sudo service nginx start
sudo service php-fpm start

# サーバ自動起動の設定
sudo chkconfig nginx on
sudo chkconfig php-fpm on

# mysqlの導入
sudo wget http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
sudo rpm -Uvh mysql-community-release-el6-5.noarch.rpm
sudo yum install -y mysql mysql-devel mysql-server mysql-libs
sudo rm -f mysql-community-release-el6-5.noarch.rpm

# mysql起動
sudo service mysqld start

# mysqlを自動起動
sudo chkconfig mysqld on

# redisインストール
sudo yum --enablerepo=epel install -y redis

# redis起動
sudo service redis start

# redis自動起動設定
sudo chkconfig redis on

## 便利ツール導入
# commposer導入
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# git vim導入
sudo yum install -y git vim tig
