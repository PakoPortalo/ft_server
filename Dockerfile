FROM debian:buster

#Updating and installing services

RUN apt-get update
RUN apt-get install nginx php-fpm mariadb-server php-mysql php7.3-mysqli wget unzip -y

#Starting services

RUN service nginx start
RUN service php7.3-fpm start
RUN service mysql start

#Setting phpMyAdmin

RUN cd /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip
RUN unzip phpMyAdmin-5.0.4-all-languages.zip
RUN rm phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages phpmyadmin
COPY src/default /etc/nginx/sites-available

#Reloading services

RUN service nginx restart
RUN service php7.3-fpm restart

#Setting Wordpress

RUN cd /var/www/html
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
COPY src/wp-config.php /var/www/html/wordpress

#Creating a database in Mariadb

RUN mariadb
RUN create database database_name default character set utf8 collate utf8_unicode_ci;
RUN grant all on database_name.* to 'database_user'@'localhost' identified by 'user_password';
RUN exit

#Reloading services

RUN service nginx restart

CMD service nginx start && \
  service mysql start && \
  service php7.3-fpm start && \
  sleep infinity



