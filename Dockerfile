FROM ubuntu:14.04
MAINTAINER Alwin Mark <alwin@atk-solutions.de>

RUN apt-get update

# install supervisor to manage all mailserver deamons
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install mysql
RUN apt-get install -y mysql-server
ADD mysql.cnf /etc/mysql/conf.d/my.cnf
ADD init.sql /tmp/init.sql
RUN /usr/sbin/mysqld --bootstrap < /tmp/init.sql

# VMail Directory
RUN mkdir /var/vmail
RUN useradd vmail
RUN chown -R vmail:vmail /var/vmail
RUN chmod -R 770 /var/vmail/

# Dovecot installieren
WORKDIR /etc/dovecot
RUN apt-get install dovecot-core dovecot-imapd dovecot-mysql dovecot-lmtpd



EXPOSE 3306
CMD ["/usr/bin/supervisord"]

