# Set the Server Timezone to CST
echo "America/New_York" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

service postgresql start

su - postgres -c "psql -U postgres -d postgres -c \"alter user postgres with password '${DB_ROOT_PASS}';\""
su - postgres -c "psql -U postgres -d postgres -c \"create database drupal encoding 'UTF8';\""
#su - postgres -c "psql -U postgres -d postgres -c \"create user ${DB_USER} with password '${DB_PASS}';\""
#su - postgres -c "psql -U postgres -d postgres -c \"grant all privileges on database drupal to ${DB_USER};\""