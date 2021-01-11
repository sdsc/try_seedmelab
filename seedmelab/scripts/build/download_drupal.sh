rm -r $DRUPAL_SITE_DIR/*
mkdir -p $DRUPAL_SITE_DIR

cd $DRUPAL_SITE_DIR
echo "Creating drupal project with composer..."
composer create-project drupal/recommended-project:^8.9 $DRUPAL_SITE_DIR --no-interaction

echo "Installing some dependencies with composer..."
composer require drush/drush drupal/token drupal/restui drupal/admin_toolbar drupal/foldershare drupal/foldershare_rest drupal/formatter_suite drupal/chart_suite