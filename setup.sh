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
		;;
	'vaultwarden' )
		openssl rand -hex 32 > secrets/vw_admin_token
		;;
	'postgres' )
		openssl rand -hex 32 > secrets/pg_user_password
		;;
	'redis' )
		openssl rand -hex 32 > secrets/red_user_password
		;;
	'*' )
		echo "Unknown service"
		;;
esac

exec "$@"
