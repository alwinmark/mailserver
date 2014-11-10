mailserver
==========

Mailserver Dockercontainer like described here: https://thomas-leister.de/internet/mailserver-ubuntu-server-dovecot-postfix-mysql/


build container:
 `sudo docker build -t alwinmark/mailserver .`
run a bash command inside:

  `sudo docker run --name ubuntu_bash --rm -i -t  alwinmark/mailserver bash`
