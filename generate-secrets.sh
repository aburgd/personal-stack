#! /bin/sh
# vaultwarden secrets
# postgresql secrets
# authelia secrets

COMMAND=$1 && shift 1

case "$COMMAND" in
	'authelia' )
		openssl rand -hex 32 > secrets/authelia/auth_jwt_secret
		openssl rand -hex 32 > secrets/authelia/auth_oidc_hmac_secret
		openssl rand -hex 32 > secrets/authelia/auth_session_redis_password
		openssl rand -hex 32 > secrets/authelia/auth_session_secret
		openssl rand -hex 32 > secrets/authelia/auth_smtp_password
		;;
	'vaultwarden' )
		openssl rand -hex 32 > secrets/vw_admin_token
		;;
	'postgres' )
		openssl rand -hex 32 > secrets/pg_user_password
		;;
	'*' )
		echo "Unknown service"
		;;
esac

exec "$@"
