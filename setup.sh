#! /bin/sh

COMMAND=$1 && shift 1

case "$COMMAND" in
	'env' )
		echo "LOG_FILE=/data/access.log
EMAIL=‘replace@email.com’
VAULT_DOMAIN=‘https://vault.doma.in’
DB_DOMAIN=‘https://db.doma.in’" > caddy.env
		echo "POSTGRES_USER=postgres
POSTGRES_PASSWORD_FILE=/run/secrets/db_user_password
POSTGRES_DB=postgres" > db.env
		touch nocodb.env
		;;
	'vaultwarden' )
		openssl rand -hex 32 > secrets/vw_admin_token
		;;
	'postgres' )
		openssl rand -hex 32 > secrets/pg_user_password
		;;
	'nocodb' )
		openssl rand -hex 32 > secrets/nc_jwt_secret
		;;
	'*' )
		echo "Unknown service"
		;;
esac

exec "$@"
