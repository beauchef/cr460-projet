# Image de base
FROM ubuntu:16.04

# Installation d'Apache
RUN apt-get update && apt-get install -y apache2 libapache2-mod-php php-mysql gettext-base
RUN a2enmod php7.0

# Add WordPress files
ADD wordpress/ /var/www/html/wordpress
RUN chmod 777 /var/www/html/wordpress
ADD wp-config.php-template /var/www/html/wordpress
ADD entrypoint.sh /

# Identifie quelle commande rouler
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
