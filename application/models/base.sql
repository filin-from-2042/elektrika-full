DROP DATA `elektrika-db`;
CREATE DATABASE IF NOT EXISTS  `elektrika-db`;

USE `elektrika-db`;

CREATE TABLE el_comments
(
    	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      `comments_content` TEXT NOT NULL,
      `comments_create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
      `comments_author` VARCHAR(128) NOT NULL,
      `comments_email` VARCHAR(128) NOT NULL,
      `comments_status` enum('enable','disable') DEFAULT 'enable',
      `comments_article_id` INTEGER UNSIGNED NOT NULL,
      CONSTRAINT `FK_comments_article_id` FOREIGN KEY (comments_article_id) REFERENCES el_articles (id) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE el_articles
(
    	id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
      `article_title` VARCHAR(128) NOT NULL,
      `article_description` VARCHAR(128) NOT NULL,
      `article_keywords` VARCHAR(128) NOT NULL,
      `article_content` TEXT NOT NULL,
      `article_tags` TEXT,
      `article_create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
      `article_update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
      `article_author` VARCHAR(128) NOT NULL,
      `article_status` enum('enable','disable') DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE el_pages
(
    `pages_title` VARCHAR(255),
    `pages_id` INT PRIMARY KEY NOT NULL,
    `pages_description` VARCHAR(255),
    `pages_keywords` VARCHAR(255),
    `pages_text` LONGTEXT NOT NULL,
    `pages_create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;