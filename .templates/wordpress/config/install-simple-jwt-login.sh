wp plugin install /var/tmp/plugins/simple-jwt-login/simple-jwt-login.zip --activate

wp option update simple_jwt_login_settings "
  {
    \"route_namespace\":\"simple-jwt-login\/v1\/\",
    \"decryption_key\":\"${JWT_DECRYPTION_KEY:-raRLlkheZEjYlPE7xMx7WVXN6j0ohGXlPRWLQzfG8inKIxHyamGDhIS6d7eTAbN9iF0pxWHh1uMcjWFw8VfGFw==}\",
    \"jwt_algorithm\":\"HS512\",
    \"jwt_login_by\":0,
    \"jwt_login_by_parameter\":\"email\",
    \"allow_autologin\":true,
    \"redirect\":0,
    \"redirect_url\":\"\",
    \"require_login_auth\":false,
    \"allow_register\":false,
    \"new_user_profile\":\"subscriber\",
    \"login_ip\":\"\",
    \"register_ip\":\"\",
    \"register_domain\":\"\",
    \"require_register_auth\":true,
    \"auth_codes\":[
        {
          \"code\":\"${JWT_AUTH_CODE:-superlongtextthatisusedforjwttoken}\",
          \"role\":\"\",
          \"expiration_date\":\"\"
        }
    ],
    \"auth_code_key\":\"AUTH_KEY\",
    \"allow_delete\":false,
    \"require_delete_auth\":true,
    \"delete_ip\":\"\",
    \"delete_user_by\":0,
    \"jwt_delete_by_parameter\":\"\",
    \"decryption_source\":\"0\",
    \"decryption_key_base64\":true,
    \"decryption_key_public\":\"\",
    \"decryption_key_private\":\"\",
    \"request_jwt_url\":1,
    \"request_jwt_cookie\":1,
    \"request_jwt_header\":1,
    \"request_jwt_session\":0,
    \"api_middleware\":{
        \"enabled\":false
    },
    \"request_keys\":{
        \"url\":\"JWT\",
        \"session\":\"simple-jwt-login-token\",
        \"cookie\":\"simple-jwt-login-token\",
        \"header\":\"Authorization\"
    },
    \"include_login_request_parameters\":false,
    \"allow_usage_redirect_parameter\":false,
    \"allowed   \":true,
    \"allowed_user_meta\":\"\",
    \"random_password\":false,
    \"register_force_login\":false,
    \"enabled_hooks\":[
        
    ],
    \"allow_authentication\":\"0\",
    \"jwt_payload\":[
        
    ],
    \"jwt_auth_ttl\":\"60\",
    \"jwt_auth_refresh_ttl\":\"20160\",
    \"cors\":{
        \"enabled\":0,
        \"allow_origin_enabled\":false,
        \"allow_origin\":\"*\",
        \"allow_methods_enabled\":false,
        \"allow_methods\":\"GET, POST, PUT, DELETE, OPTIONS, HEAD\",
        \"allow_headers_enabled\":false,
        \"allow_headers\":\"*\"
    }
  }"