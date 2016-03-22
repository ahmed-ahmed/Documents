siteName=$1
port=$2
cd /var/www
sudo mkdir $siteName
sudo mkdir $siteName/public_html
sudo mkdir $siteName/log
sudo mkdir $siteName/backups
sudo chown -R www-data:www-data /var/www/$siteName

sudo echo '# domain: '$siteName >> /etc/apache2/sites-available/$siteName.conf
sudo echo '# public: /var/www/'$siteName'/public_html' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '<VirtualHost *:'$port'>' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        ServerName  www.'$siteName >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        ServerAlias '$siteName >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        DirectoryIndex index.html index.php' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        DocumentRoot /var/www/'$siteName'/public_html' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        LogLevel warn' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        ErrorLog /var/www/'$siteName'/error.log' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '        CustomLog /var/www/'$siteName'/log/access.log combined' >> /etc/apache2/sites-available/$siteName.conf
sudo echo '</VirtualHost>' >> /etc/apache2/sites-available/$siteName.conf

sudo a2ensite $siteName.conf
sudo chown -R www-data:www-data
sudo chmod -R 755 /var/www
sudo service apache2 restart
