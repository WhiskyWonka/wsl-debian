alias ls=colorls
alias bat=batcat
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
# mount the truenas net directory
alias truenas='sudo mount -t drvfs '\\truenas\backup' /mnt/truenas'
tailf(){ tail -f $1 | bat --paging=never -l log; }
# flush all keys in redis-test container
alias flushall='docker exec redis-test redis-cli FLUSHALL; docker exec php-test php artisan config:clear; docker exec php-test php artisan route:clear; docker exec php-test php artisan cache:clear; docker exec php-test php artisan view:clear'
# get into dev AWS server
alias sshdev='ssh -i /mnt/rgg-lenovo/SERVIDORES/DEV\ AWS/keys/aws_boldt_bplay_bplaybet_development ubuntu@44.215.207.90'
alias sshuat='ssh -i ssh -i /mnt/rgg-lenovo/SERVIDORES/UAT\ AWS/keys/aws_boldt-bplay-bplaybet-qa_web_key.pem ubuntu@34.203.37.180'
alias tailc='~/.config/tailc.sh'