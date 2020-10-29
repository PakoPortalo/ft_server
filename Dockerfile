FROM debian:buster

#Updating and installing services

RUN apt-get update
RUN apt-get install nginx php-fpm mariadb-server php-mysql php7.3-mysqli wget unzip -y

#Starting services

RUN service nginx start && \
	service php7.3-fpm start && \
	service mysql start

#Setting phpMyAdmin

RUN cd /var/www/html && \
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip && \
	unzip phpMyAdmin-5.0.4-all-languages.zip && \
	rm phpMyAdmin-5.0.4-all-languages.zip&& \
	mv phpMyAdmin-5.0.4-all-languages phpmyadmin
COPY src/default /etc/nginx/sites-available

#Reloading services

RUN service nginx restart && \
	service php7.3-fpm restart && \
	service mysql restart

#Setting Wordpress

RUN cd /var/www/html && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz
COPY src/wp-config.php /var/www/html/wordpress

#Creating a database in Mariadb


COPY /src/create_db.sql /tmp/create_db.sql
RUN service mysql start && \
	mysql -u root < /tmp/create_db.sql

#Reloading services

COPY src/index.php /var/www/html/
COPY src/info.php /var/www/html/
RUN service nginx restart && \
	service php7.3-fpm restart

CMD service nginx start && \
  service mysql start && \
  service php7.3-fpm start && \
  sleep infinity



