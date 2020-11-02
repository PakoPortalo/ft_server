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

#SSL

RUN cd /home/ && \
	openssl req -newkey rsa:2048 -nodes -keyout privkey.pem -x509 -days 36500 -out certificate.pem -subj \
	"/C=US/ST=NRW/L=Earth/O=CompanyName/OU=IT/CN=www.example.com/emailAddress=email@example.com"
RUN chown -R www-data:www-data /var/www/* && \
	chmod -R 775 /var/www/*

#Setting Wordpress

RUN cd /var/www/html && \
	wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz
RUN chown -R www-data:www-data /var/www/html/ && \
	chmod -R 755 /var/www/html/
COPY src/wp-config.php /var/www/html/wordpress

#Creating a database in Mariadb


COPY /src/create_db.sql /tmp/create_db.sql
RUN rm /var/www/html/index.nginx-debian.html && \
	service mysql start && \
	mysql -u root < /tmp/create_db.sql;

#Reloading services

COPY src/porrasconchorizo.php /var/www/html/
COPY src/info.php /var/www/html/
RUN service nginx restart && \
	service php7.3-fpm restart

CMD service nginx start && \
  service mysql start && \
  service php7.3-fpm start && \
  sleep infinity



