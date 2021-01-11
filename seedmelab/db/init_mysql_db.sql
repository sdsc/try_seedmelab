CREATE DATABASE drupal;
GRANT ALL PRIVILEGES ON drupal.* TO "root";
GRANT ALL PRIVILEGES ON drupal.* TO 'drupal_user'@'localhost';
GRANT ALL PRIVILEGES ON drupal.* TO 'drupal_user'@'127.0.0.1';
GRANT ALL PRIVILEGES ON drupal.* TO 'drupal_user'@'::1';

FLUSH PRIVILEGES;
EXIT