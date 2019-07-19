# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
apt-get install -y git
apt-get install -y sshpass

# Apache
apt-get install -y apache2

# Enable Apache Mods
a2enmod rewrite

#Add Onrej PPA Repo
apt-add-repository ppa:ondrej/php
apt-get update

# Install PHP
apt-get install -y php7.0

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.0

# Restart Apache
service apache2 restart

# PHP Mods
apt-get install -y php7.0-common
apt-get install -y php7.0-mbstring
apt-get install -y php7.0-zip
apt-get install -y php7.0-gd
apt-get install -y php7.0-mcrypt
apt-get install -y php7.0-curl
apt-get install -y php-imagick

# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server-5.7

# PHP-MYSQL lib
apt-get install -y php7.0-mysql
apt-get update

# Apache virtualhost configuration
cat > /etc/apache2/sites-available/000-default.conf << EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/public_html
    <Directory /var/www/public_html>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF

# Install Python v2.7
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install -y python2.7

# Install nodejs v8.11.4 and gulp
#wget https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.g‌​z
#mkdir -p /opt/nodejs
#tar -xvzf node-v8.11.4-linux-x64.tar.gz -C /opt/nodejs/
#mv /opt/nodejs/node-v8.11.4-linux-x64 /opt/nodejs/8.11.4
#ln -s /opt/nodejs/6.11.3 /opt/nodejs/current
#ln -s /opt/nodejs/current/bin/node /bin/node
#rm node-v8.11.4-linux-x64.tar.gz
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install -y nodejs
apt-get install -y build-essential
npm install --global gulp-cli

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y yarn


# Install Ansible v2.6
apt-get install -y python-pip python-dev
pip install ansible==2.6

# Disable MySQL 5.7.5+ ONLY_FULL_GROUP_BY
mysql -uroot -proot -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));"

# Clean WWW folder
rm -r /var/www/*

# Restart Apache
service apache2 restart
