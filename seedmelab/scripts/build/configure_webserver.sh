if [ $WEB_SERVER = "apache_prefork" ]
then
  a2enmod rewrite
  a2enmod proxy_fcgi
  a2enmod remoteip
  a2enmod expires
  a2dismod mpm_event
  a2enmod mpm_prefork

  a2dismod authn_file
  a2dismod authz_user

  # service apache2 reload
  service apache2 restart
elif [ $WEB_SERVER = "apache_fpm" ]
then
  a2enmod rewrite
  a2enmod proxy
  a2enmod proxy_fcgi
  a2enmod remoteip
  a2enmod expires
  a2dismod mpm_prefork
  a2enmod mpm_event
  a2enconf php-fpm

  a2dismod -f authn_file
  a2dismod -f authz_user
  
  # service apache2 reload
  service apache2 restart
else
  echo "Invalid web server type: $WEB_SERVER"
fi
