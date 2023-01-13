#! /bin/sh

COMMAND=$1 && shift 1

case "$COMMAND" in
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
