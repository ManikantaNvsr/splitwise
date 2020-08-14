CREATE USER 'splitwiseuser'@'localhost' IDENTIFIED BY 'splitwiseuser';

GRANT ALL PRIVILEGES ON * . * TO 'splitwiseuser'@'localhost';

ALTER USER 'splitwiseuser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'splitwiseuser';

CREATE DATABASE  IF NOT EXISTS `splitwise`;

USE `splitwise`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `paid_by` varchar(30) NOT NULL,
  `received_by` varchar(30) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `amount` int(10),
  `paid_on` timestamp,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `id` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `friend_user_id` int(10) NOT NULL,
  `friend_email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
);