if [ $WEB_SERVER = "apache_prefork" ]
then
  apt install -y apache2
  if [ $PHP_VERSION = "7.2" ]
  then
    apt-get install -y libapache2-mod-php7.2
    a2enmod php7.2
  elif [ $PHP_VERSION = "7.3" ]
  then
    apt-get install -y libapache2-mod-php7.3
    a2enmod php7.3
  elif [ $PHP_VERSION = "7.4" ]
  then
    apt-get install -y libapache2-mod-php7.4
    a2enmod php7.4
  fi
elif [ $WEB_SERVER = "apache_fpm" ]
then
  apt install -y apache2
else
  echo "Invalid web server type: $WEB_SERVER"
fi