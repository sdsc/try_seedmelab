# Set the Server Timezone to CST
echo "America/New_York" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Install MySQL Server in a Non-Interactive mode.
echo "mysql-server mysql-server/root_password password ${DB_ROOT_PASS}" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ${DB_ROOT_PASS}" | debconf-set-selections

service mysql start

mysqladmin -u root password "$DB_ROOT_PASS"
mysql -u root --password="$DB_ROOT_PASS" -e "UPDATE mysql.user SET authentication_string=PASSWORD('$DB_ROOT_PASS') WHERE User='root'"
mysql -u root --password="$DB_ROOT_PASS" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root --password="$DB_ROOT_PASS" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root --password="$DB_ROOT_PASS" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root --password="$DB_ROOT_PASS" -e "FLUSH PRIVILEGES"

sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
mysql -u root --password="$DB_ROOT_PASS" -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'

service mysql restart

# setup access permissions
echo "GRANT ALL ON *.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION;" > /tmp/sql
echo "GRANT ALL ON *.* TO ${DB_USER}@'127.0.0.1' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION;" >> /tmp/sql
echo "GRANT ALL ON *.* TO ${DB_USER}@'::1' IDENTIFIED BY '${DB_PASS}' WITH GRANT OPTION;" >> /tmp/sql
cat /tmp/sql | mysql -u root --password=${DB_ROOT_PASS}

cat /db/init_mysql_db.sql | mysql -u root --password=${DB_ROOT_PASS}