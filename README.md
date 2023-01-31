# personal-stack
Personal services stack
## using the stack
1. clone the repo
1. run `setup.sh` for each service you want to use - just creates a password file in ./secrets for the service to use (avoids putting them in .env files and in the compose file)
1. copy .env files from samples/ to the root project directory and make necessary edits
1. run `docker-compose up [services] -d` where `[services]` is any of the services in the stack; leave blank for all services
1. enjoy easy https access to vaultwarden and some easy-to-use database servers for us with other projects
