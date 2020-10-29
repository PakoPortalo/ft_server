create database database_name default character set utf8 collate utf8_unicode_ci;
grant all on database_name.* to 'database_user'@'localhost' identified by 'user_password';
