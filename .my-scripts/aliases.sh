alias ls=colorls
alias bat=batcat
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
# mount the truenas net directory
alias truenas='sudo mount -t drvfs '\\truenas\backup' /mnt/truenas'
tailf(){ tail -f $1 | bat --paging=never -l log; }
# flush all keys in redis-test container
alias flushall='docker exec redis-test redis-cli FLUSHALL; docker exec php-test php artisan config:clear; docker exec php-test php artisan route:clear; docker exec php-test php artisan cache:clear; docker exec php-test php artisan view:clear'
alias flushall='docker exec php-test php artisan config:clear; docker exec php-test php artisan route:clear; docker exec php-test php artisan cache:clear; docker exec php-test php artisan view:clear; docker exec redis-test redis>alias colas="flushall; docker compose -f ~/projects/bplay-pam/.dev-test/docker-compose.yml stop;
        docker compose -f ~/projects/bplay-pam/.dev-test/docker-compose.yml up -d;
        clear;
        echo 'LISTENING QUEUES';
        docker exec php-test php artisan queue:work --queue=sockets,default,calculations,emails,bonusDeposit,integration1,integration2,adjudication --tries=1"'
# get into dev AWS server
alias sshdev='ssh -i ~/ssh_keys/dev_aws/aws_boldt_bplay_bplaybet_development ubuntu@44.215.207.90'
alias sshuat='ssh -i ~/ssh_keys/uat/aws_boldt-bplay-bplaybet-qa_web_key.pem ubuntu@34.203.37.180'
alias tailc='~/.config/tailc.sh'
alias sail='./vendor/bin/sail'
alias composer='~/projects/composer.phar'