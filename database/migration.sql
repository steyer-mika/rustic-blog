-- Drop the database if it exists
DROP DATABASE IF EXISTS `rustic_blog`;

-- Create the database
CREATE DATABASE `rustic_blog`;

-- Use the created database
USE `rustic_blog`;

-- Create the user table
CREATE TABLE `user` (
    `id` INT NOT NULL AUTO_INCREMENT,

    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,

    `email` VARCHAR(255),
    `firstname` VARCHAR(255),
    `lastname` VARCHAR(255),

    `is_active` TINYINT DEFAULT 1,
    `registration_date` DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `pk_user_id` PRIMARY KEY (`id`),
    CONSTRAINT `uc_user_username` UNIQUE (`username`),
    CONSTRAINT `uc_user_email` UNIQUE (`email`)
);

-- Create the category table
CREATE TABLE `category` (
    `id` INT NOT NULL AUTO_INCREMENT,

    `label` VARCHAR(100) NOT NULL,
    `color` CHAR(7),

    CONSTRAINT `pk_category_id` PRIMARY KEY (`id`),
    CONSTRAINT `uc_category_label` UNIQUE (`label`)
);

-- Create the tag table
CREATE TABLE `tag` (
    `id` INT NOT NULL AUTO_INCREMENT,

    `label` VARCHAR(100) NOT NULL,

    CONSTRAINT `pk_tag_id` PRIMARY KEY (`id`)
);

-- Create the article table
CREATE TABLE `article` (
    `id` INT NOT NULL AUTO_INCREMENT,

    `title` VARCHAR(255) NOT NULL,
    `content` TEXT,

    `like_count` INT DEFAULT 0,

    `published_at` DATETIME,
    `creation_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME ON UPDATE CURRENT_TIMESTAMP,

    `author_id` INT NOT NULL,
    `category_id` INT,

    CONSTRAINT `pk_article_id` PRIMARY KEY (`id`),
    CONSTRAINT `fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `user`(`id`),
    CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`),
    CONSTRAINT `chk_article_like_count` CHECK (`like_count` >= 0)
);

-- Create the article_tag table
CREATE TABLE `article_tag` (
    `article_id` INT NOT NULL,
    `tag_id` INT NOT NULL,

    CONSTRAINT `pk_article_tag` PRIMARY KEY (`article_id`, `tag_id`),
    CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article`(`id`),
    CONSTRAINT `fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag`(`id`)
);

-- Create the article_user table
CREATE TABLE `like_article_user` (
    `article_id` INT NOT NULL,
    `user_id` INT NOT NULL,

    CONSTRAINT `pk_article_user` PRIMARY KEY (`article_id`, `user_id`),
    CONSTRAINT `fk_article_user_article_id` FOREIGN KEY (`article_id`) REFERENCES `article`(`id`),
    CONSTRAINT `fk_article_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);

-- Create the comment table
CREATE TABLE `comment` (
    `id` INT NOT NULL AUTO_INCREMENT,

    `comment_text` TEXT,

    `creation_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `modified_at` DATETIME ON UPDATE CURRENT_TIMESTAMP,

    `tread_id` INT,

    `user_id` INT NOT NULL,
    `article_id` INT NOT NULL,
    
    CONSTRAINT `pk_comment` PRIMARY KEY (`id`),
    CONSTRAINT `fk_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    CONSTRAINT `fk_comment_article_id` FOREIGN KEY (`article_id`) REFERENCES `article`(`id`),
    CONSTRAINT `fk_comment_tread_id` FOREIGN KEY (`tread_id`) REFERENCES `comment`(`id`)
);
