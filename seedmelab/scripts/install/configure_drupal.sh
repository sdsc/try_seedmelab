cd $DRUPAL_SITE_DIR

configure_foldershare() {
  drush en token restui admin_toolbar --yes
  drush en foldershare foldershare_rest formatter_suite chart_suite --yes

  # Set foldershare settings
  drush config:set foldershare.settings file_scheme private --yes

   # Set foldershare permissions for roles
  drush role-add-perm 'authenticated' 'author foldershare' --yes
  drush role-add-perm 'authenticated' 'share foldershare' --yes
  drush role-add-perm 'authenticated' 'share public foldershare' --yes
  drush role-add-perm 'authenticated' 'view foldershare' --yes
  drush role-add-perm 'anonymous' 'view foldershare' --yes
}

configure_modules() {
  drush en \
    automated_cron \
    ban \
    big_pipe \
    block \
    block_content \
    book \
    breakpoint \
    ckeditor \
    config \
    contact \
    datetime \
    dblog \
    dynamic_page_cache \
    editor \
    entity_reference \
    field \
    field_ui \
    file \
    filter \
    help \
    image \
    link \
    media \
    menu_link_content \
    menu_ui \
    node \
    options \
    page_cache \
    path \
    path_alias \
    telephone \
    text \
    toolbar \
    update \
    views \
    views_ui --yes
}

echo "Enabling core modules..."
configure_modules

# Configure foldershare
echo "Configuring foldeshare & foldershare_rest..."
configure_foldershare

