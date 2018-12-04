DROP DATABASE `recipes`;
CREATE DATABASE `recipes`;
USE `recipes`;

-- Create users table
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY (`email`)
);

-- Create ingredients table
CREATE TABLE `ingredient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,

  PRIMARY KEY (`id`)
);

-- Create recipes table
CREATE TABLE `recipe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(2048) NOT NULL,
  `title` varchar(256) NOT NULL,
  `subtitle` varchar(512) NOT NULL,
  `instruction` text DEFAULT NULL,

  PRIMARY KEY (`id`)
);

-- Create join table between recipes and ingredients
CREATE TABLE `recipe_ingredient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` int(10) unsigned NOT NULL,
  `ingredient_id` int(10) unsigned NOT NULL,
  `amount` varchar(256) NOT NULL,

  PRIMARY KEY (`id`),
  
  KEY (`recipe_id`),
  KEY (`ingredient_id`),
  
  FOREIGN KEY (`ingredient_id`) 
    REFERENCES `ingredient` (`id`),

  FOREIGN KEY (`recipe_id`) 
    REFERENCES `recipe` (`id`),
  
  UNIQUE (`recipe_id`, `ingredient_id`)
);
