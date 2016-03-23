site = $1
#cd ~
#wget http://wordpress.org/latest.tar.gz
#tar xzvf latest.tar.gz
#cd ~/wordpress
#/var/www/ahmed.com/public_html/
sudo rsync -avP ~/wordpress/ /var/www/$1/public_html
cd /var/www/$1/public_html
sudo chown -R www-data:www-data *
mkdir /var/www/$1/public_html/wp-content/uploads
sudo chown -R :www-data /var/www/$1/public_html/wp-content/uploads
