#! /bin/sh
openssl rand -base64 32 >> secrets/vw_admin_token
openssl rand -base64 32 >> secrets/pg_user_password
