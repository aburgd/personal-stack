# personal-stack
Personal services stack
## using the stack
1. clone the repo
1. run `setup.sh` for each service you want to use - just creates a password file in ./secrets for the service to use (avoids putting them in .env files and in the compose file)
1. copy .env files from samples/ to the root project directory and make necessary edits
1. run `docker-compose up [services] -d` where `[services]` is any of the services in the stack; leave blank for all services
1. enjoy easy https access to vaultwarden and some easy-to-use database servers for us with other projects

### note on AdGuard Home
AdGuard Home can have two different TLS setups at the same time. this stack is using [go-acme/lego](https://github.com/go-acme/lego) to generate Let's Encrypt certs for the DNS-over-HTTPS/-TLS and putting in the path to them in the Encryption Settings in AdGuard Home. automatic HTTPS for the web interface is handled by [caddyserver/caddy](https://github.com/caddyserver/caddy). caddy will handle the auto-renew for the site TLS certs but you'll have to renew with lego on your own (or you can schedule a cron job if you're fancy).
