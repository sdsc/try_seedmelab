cd $DRUPAL_SITE_DIR

mkdir -p /var/private /var/www/sync

echo '$config_directories["sync"] = "/var/www/sync";' >> $DRUPAL_SITE_DIR/web/sites/default/default.settings.php
echo '$settings["file_private_path"] = "/var/private";' >> $DRUPAL_SITE_DIR/web/sites/default/default.settings.php

echo "Installing drupal site..."
drush si -vvv --db-url=mysql://drupal:drupal@db/drupal -site-name $SITE_NAME --yes

chown -R www-data $DRUPAL_SITE_DIR/web/sites/default
chown -R www-data /var/private
chown -R www-data /var/www/sync

echo "Clearing drupal cache..."
drush cr

echo "Updating drupal admin password to: $DRUPAL_ADMIN_PASS"
drush user:password admin "$DRUPAL_ADMIN_PASS"

echo "Creating drupal $DRUPAL_DEMO_USER user with password: $DRUPAL_DEMO_PASS"
drush user:create $DRUPAL_DEMO_USER --password="$DRUPAL_DEMO_PASS"