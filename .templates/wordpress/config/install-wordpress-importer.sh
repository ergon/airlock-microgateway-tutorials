wp plugin install /var/tmp/plugins/wordpress-importer/wordpress-importer.zip --activate
wp post delete 1 --force
wp import /var/tmp/plugins/wordpress-importer/welcome_post.xml --authors=skip