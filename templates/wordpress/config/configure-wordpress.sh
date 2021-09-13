wp theme activate twentytwenty
wp menu create site-menu
wp menu item add-custom site-menu Admin /wp-admin/ --position=1
wp menu item add-custom site-menu Logout /auth-logout/ --position=2
wp menu location assign site-menu primary

wp option update blogdescription "The virtual company for Airlock Secure Access Hub"
wp option update time_format "H:i"
wp option update comments_notify ""
wp option update comment_moderation ""
wp option update moderation_notify ""
wp option update comment_registration ""
wp option update close_comments_for_old_posts ""
wp option update page_comments ""
wp option update comment_previously_approved ""
wp option update widget_block "array (
    2 =>
    array (
      'content' => '<!-- wp:search /-->',
    ),
    3 =>
    array (
      'content' => '<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-
  posts /--></div><!-- /wp:group -->',
    ),
    4 =>
    array (
      'content' => '<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:late
  st-comments {"displayAvatar":false,"displayDate":false,"displayExcerpt":false} /--></div><!-- /wp:group -->',
    ),
    5 =>
    array (
      'content' => '<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /-
  -></div><!-- /wp:group -->',
    ),
    6 =>
    array (
      'content' => '<!-- wp:group --><div class="wp-block-group"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categorie
  s /--></div><!-- /wp:group -->',
    ),
    '_multiwidget' => 1,
    9 =>
    array (
      'content' => '<!-- wp:search {"showLabel":false,"width":100,"widthUnit":"%","buttonUseIcon":true,"align":"right"} /-->',
    ),
    8 =>
    array (
      'content' => '<!-- wp:group -->
  <div class="wp-block-group"><!-- wp:search {"showLabel":false,"width":100,"widthUnit":"%","buttonUseIcon":true,"align":"right"} /--></div>
  <!-- /wp:group -->',
    ),
    10 =>
    array (
      'content' => '<!-- wp:paragraph -->
  <p></p>
  <!-- /wp:paragraph -->',
    ),
    11 =>
    array (
      'content' => '<!-- wp:paragraph -->
  <p></p>
  <!-- /wp:paragraph -->',
    ),
  )"