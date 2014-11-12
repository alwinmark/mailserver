USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("%password%") WHERE user='root';

create database vmail;
use vmail;

# Tabelle für Benutzerkonten erstellen
create table users (id INT UNSIGNED AUTO_INCREMENT NOT NULL, username VARCHAR(128) NOT NULL, domain VARCHAR(128) NOT NULL, password VARCHAR(128) NOT NULL, UNIQUE (id), PRIMARY KEY (username, domain) );

# Tabelle für Domains
create table domains (domain VARCHAR(128) NOT NULL, UNIQUE (domain));

# Tabelle für Aliase
create table aliases (id INT UNSIGNED AUTO_INCREMENT NOT NULL, source VARCHAR(128) NOT NULL, destination VARCHAR(128) NOT NULL, UNIQUE (id), PRIMARY KEY (source, destination) );

GRANT ALL ON vmail.* TO 'vmail'@'localhost' IDENTIFIED BY 'vmailpasswort';
