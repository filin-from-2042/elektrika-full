-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 05 2014 г., 19:28
-- Версия сервера: 5.5.37-log
-- Версия PHP: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `elektrika-db`
--
CREATE DATABASE IF NOT EXISTS `elektrika-db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `elektrika-db`;

-- --------------------------------------------------------

--
-- Структура таблицы `el_archives`
--

DROP TABLE IF EXISTS `el_archives`;
CREATE TABLE IF NOT EXISTS `el_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archive_name` varchar(100) NOT NULL,
  `archive_date` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `el_archives`
--

INSERT INTO `el_archives` (`id`, `archive_name`, `archive_date`) VALUES
(1, 'September 2014', '2014-09'),
(2, 'October 2014', '2014-10'),
(3, 'November 2014', '2014-11'),
(4, 'December 2014', '2014-12'),
(5, 'August 2014', '2014-08'),
(6, 'July 2014', '2014-07'),
(7, 'June 2014', '2014-06'),
(8, 'May 2014', '2014-05'),
(9, 'April 2014', '2014-04'),
(10, 'March 2014', '2014-03'),
(11, 'February 2014', '2014-02'),
(12, 'January 2014', '2014-01');

-- --------------------------------------------------------

--
-- Структура таблицы `el_articles`
--

DROP TABLE IF EXISTS `el_articles`;
CREATE TABLE IF NOT EXISTS `el_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `article_description` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `article_keywords` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `article_content` text COLLATE utf8_unicode_ci NOT NULL,
  `article_tags` text COLLATE utf8_unicode_ci,
  `article_create_date` datetime DEFAULT NULL,
  `article_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `article_status` enum('enable','disable') COLLATE utf8_unicode_ci DEFAULT 'enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `el_categories`
--

DROP TABLE IF EXISTS `el_categories`;
CREATE TABLE IF NOT EXISTS `el_categories` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `el_categories`
--

INSERT INTO `el_categories` (`id`, `categories_name`) VALUES
(1, 'App Media'),
(2, 'Brand Media'),
(3, 'CASE Study'),
(4, 'Digital'),
(5, 'E - Mail'),
(6, 'Featured Articles'),
(7, 'Graphic Design'),
(8, 'Jobs'),
(9, 'Multimedia'),
(10, 'Networks');

-- --------------------------------------------------------

--
-- Структура таблицы `el_comments`
--

DROP TABLE IF EXISTS `el_comments`;
CREATE TABLE IF NOT EXISTS `el_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comments_content` text COLLATE utf8_unicode_ci NOT NULL,
  `comments_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments_author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `comments_email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `comments_status` enum('ENABLE','DISABLE') COLLATE utf8_unicode_ci DEFAULT 'ENABLE',
  `comments_news_id` int(11) DEFAULT NULL,
  `comments_parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id` (`comments_parent_id`),
  KEY `fk_parent_id` (`comments_news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=91 ;

--
-- Дамп данных таблицы `el_comments`
--

INSERT INTO `el_comments` (`id`, `comments_content`, `comments_create_time`, `comments_author`, `comments_email`, `comments_status`, `comments_news_id`, `comments_parent_id`) VALUES
(1, 'Тестовый коммент к статье 1\r\nТестовый коммент к статье 1\r\nТестовый коммент к статье 1\r\nТестовый коммент к статье 1\r\nТестовый коммент к статье 1\r\nТестовый коммент к статье 1', '2014-09-16 20:00:00', 'admin', 'admin@admin.ru', 'ENABLE', 1, NULL),
(2, 'Тестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 2, 10),
(3, 'Тестовый коммент к статье 3\r\nТестовый коммент к статье 3\r\nТестовый коммент к статье 3\r\nТестовый коммент к статье 3\r\nТестовый коммент к статье 3', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 3, NULL),
(4, 'Тестовый коммент к статье 4\r\nТестовый коммент к статье 4\r\nТестовый коммент к статье 4\r\nТестовый коммент к статье 4\r\nТестовый коммент к статье 4\r\nТестовый коммент к статье 4\r\nТестовый коммент к статье 4', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 4, NULL),
(7, 'Тестовый коммент к статье 1 Sub\r\nТестовый коммент к статье 1 Sub\r\nТестовый коммент к статье 1 Sub\r\nТестовый коммент к статье 1 Sub\r\nТестовый коммент к статье 1 Sub\r\n', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 1, 1),
(10, 'Тестовый коммент к статье 2\r\nТестовый коммент к статье 2\r\nТестовый коммент к статье 2\r\nТестовый коммент к статье 2\r\nТестовый коммент к статье 2\r\nТестовый коммент к статье 2', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 2, NULL),
(11, 'Тестовый коммент к статье 3 Sub\r\nТестовый коммент к статье 3 Sub\r\nТестовый коммент к статье 3 Sub\r\nТестовый коммент к статье 3 Sub\r\nТестовый коммент к статье 3 Sub\r\nТестовый коммент к статье 3 Sub\r\nТестовый коммент к статье 3 Sub', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 3, 3),
(12, 'Тестовый коммент к статье 4 Sub\r\nТестовый коммент к статье 4 Sub\r\nТестовый коммент к статье 4 Sub\r\nТестовый коммент к статье 4 Sub\r\nТестовый коммент к статье 4 Sub\r\nТестовый коммент к статье 4 Sub\r\nТестовый коммент к статье 4 Sub', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 4, 4),
(13, 'Тестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub\r\nТестовый коммент к статье 2 Sub', '2014-09-15 17:49:04', 'admin', 'admin@admin.ru', 'ENABLE', 2, 10),
(14, 'Тестовый коммент к статье 1 Sub Sub\r\nТестовый коммент к статье 1 Sub Sub\r\nТестовый коммент к статье 1 Sub Sub\r\nТестовый коммент к статье 1 Sub Sub\r\nТестовый коммент к статье 1 Sub Sub\r\n', '2014-09-28 06:46:43', '', '', 'ENABLE', 1, 7),
(77, 'asdsad', '2014-09-30 18:44:22', 'sddsd', 'sd@sdasd', 'ENABLE', 1, 7),
(78, 'asdas', '2014-09-30 18:44:35', 'asdsd', 'sad@adasd', 'ENABLE', 1, NULL),
(79, 'asdas', '2014-09-30 18:44:42', 'asdsd', 'sad@adasd', 'ENABLE', 1, 78),
(80, 'asdas', '2014-09-30 18:44:47', 'asdsd', 'sad@adasd', 'ENABLE', 1, 79),
(81, 'asdas', '2014-09-30 18:44:52', 'asdsd', 'sad@adasd', 'ENABLE', 1, 78),
(90, 'asdasd', '2014-10-03 16:47:19', 'asd', 'asd@asdas', 'ENABLE', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `el_news`
--

DROP TABLE IF EXISTS `el_news`;
CREATE TABLE IF NOT EXISTS `el_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_description` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_keywords` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_content` longtext COLLATE utf8_unicode_ci,
  `news_create_date` datetime DEFAULT NULL,
  `news_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `news_preview_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_author` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_status` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `el_news`
--

INSERT INTO `el_news` (`id`, `news_title`, `news_description`, `news_keywords`, `news_content`, `news_create_date`, `news_update_date`, `news_preview_image`, `news_author`, `news_status`, `news_type`) VALUES
(1, 'Тестирование сайта', 'Тестируем сайт магазина "Электрика"', 'тестирование', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,\r\n   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,\r\n   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,\r\n   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,\r\n   quis ultrices lacus suscipit vitae.<!--PreviewDelimiter--> Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,\r\n   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,\r\n   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,\r\n   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,\r\n   quis ultrices lacus suscipit vitae.', '2014-09-02 00:00:00', '2014-09-12 17:22:06', '/images/image-post-preview.png', 'admin', '1', 'news'),
(2, 'Тестирование сайта часть 2', 'Тестируем сайт магазина "Электрика"', 'тесирование', 'Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,\r\n   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,\r\n   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,\r\n   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.<!--PreviewDelimiter-->Maecenas sed ligula eget risus dictum ornare a et diam.Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,\r\n   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,\r\n   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,\r\n   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.', '2014-09-12 00:00:00', '2014-09-12 17:41:55', '/images/image-post-preview.png', 'admin', '1\r\n', 'news'),
(3, 'Тестирование сайта - ', 'Тестируем сайт магазина "Электрика"', 'тестирование', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,\r\n   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,\r\n   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,\r\n   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,\r\n   quis ultrices lacus suscipit vitae.<!--PreviewDelimiter--> Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,\r\n   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,\r\n   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,\r\n   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,\r\n   quis ultrices lacus suscipit vitae.', '2014-09-12 00:00:00', '2014-09-12 17:42:12', '/images/image-post-preview.png', 'admin', '1', 'news'),
(4, 'Тестирование сайта часть 2 - ', 'Тестируем сайт магазина "Электрика"', 'тесирование', 'Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,\r\n   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,\r\n   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,\r\n   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.<!--PreviewDelimiter-->Maecenas sed ligula eget risus dictum ornare a et diam.Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,\r\n   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,\r\n   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,\r\n   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.', '0000-00-00 00:00:00', '2014-09-12 17:14:26', '/images/image-post-preview.png', 'admin', '1\r\n', 'news'),
(5, 'Тестирование сайта3 - ', 'Тестируем сайт магазина "Электрика"', 'тестирование', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,\r\n   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,\r\n   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,\r\n   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,\r\n   quis ultrices lacus suscipit vitae.<!--PreviewDelimiter--> Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,\r\n   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,\r\n   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,\r\n   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,\r\n   quis ultrices lacus suscipit vitae.', '0000-00-00 00:00:00', '2014-09-12 17:14:52', '/images/image-post-preview.png', 'admin', '1', 'news');

-- --------------------------------------------------------

--
-- Структура таблицы `el_news2categories`
--

DROP TABLE IF EXISTS `el_news2categories`;
CREATE TABLE IF NOT EXISTS `el_news2categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`news_id`,`category_id`) COMMENT 'UNIQUE',
  KEY `FK_news2categories_category_id` (`category_id`),
  KEY `FK_news2categories_news_id` (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `el_news2categories`
--

INSERT INTO `el_news2categories` (`id`, `news_id`, `category_id`) VALUES
(1, 1, 1),
(6, 1, 2),
(11, 1, 8),
(7, 1, 9),
(2, 2, 2),
(14, 3, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `el_pages`
--

DROP TABLE IF EXISTS `el_pages`;
CREATE TABLE IF NOT EXISTS `el_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_subtitle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pages_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pages_preview_text` text COLLATE utf8_unicode_ci,
  `pages_preview_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `page_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_type` char(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_page_name` (`page_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `el_pages`
--

INSERT INTO `el_pages` (`id`, `pages_title`, `pages_subtitle`, `pages_description`, `pages_keywords`, `pages_text`, `pages_preview_text`, `pages_preview_image`, `pages_create_date`, `page_name`, `page_type`) VALUES
(2, 'Магазин Электрика', 'Главная страница', 'Магазин электро - товаров в Новомосковске', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra,\r\n   per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui,\r\n   non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.<!--TabDelimiter-->Ut a elit eget mi ornare mattis.Etiam dignissim,\r\n   diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis.Donec id ante dapibus,\r\n   aliquet tellus non,\r\n   semper erat.Nulla non dapibus lorem.Proin vitae lacinia nisi.Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit.Morbi dapibus cursus erat,\r\n   et pharetra risus luctus sit amet.Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet.Fusce nec sapien dolor.Vestibulum mollis eleifend lorem,\r\n   a rhoncus dui euismod ut.Nam pulvinar nibh et leo sodales,\r\n   quis sagittis libero pellentesque.IN egestas rhoncus augue non molestie. IN suscipit felis erat, IN\r\n   cursus arcu euismod et.<!--TabDelimiter-->Proin AT erat quis elit euismod pulvinar.Nulla luctus,\r\n   mauris eget condimentum faucibus, est velit ultrices mi,\r\n   quis euismod tortor diam non nunc.Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet.Nam aliquet est congue neque ornare ullamcorper.Class aptent taciti sociosqu ad litora torquent per conubia nostra,\r\n   per inceptos himenaeos.Donec est ante, eleifend sit amet adipiscing pellentesque,\r\n   facilisis quis arcu.Suspendisse sapien velit, interdum non ligula id,\r\n   tincidunt commodo massa.Nullam suscipit blandit nunc,\r\n   convallis elementum nibh semper vehicula.Pellentesque dictum nisi IN neque hendrerit,\r\n   quis volutpat justo vulputate.Nunc sit amet risus viverra, posuere libero accumsan,\r\n   mattis nulla.Proin vitae fringilla sem.Curabitur non eros dui.<!--TabDelimiter-->Suspendisse fringilla varius sagittis.Pellentesque nisi ligula,\r\n   tincidunt quis sollicitudin a, ultrices vitae lorem.Vivamus auctor, orci sed aliquam suscipit,\r\n   neque neque molestie lectus,\r\n   sit amet porta mi odio vitae elit.Phasellus auctor volutpat sapien eu ornare.Nam auctor lacus felis,\r\n   quis vehicula quam ultrices IN.Aliquam erat volutpat.Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula,\r\n   sed tincidunt dui nisi et est.', NULL, NULL, '0000-00-00 00:00:00', 'home', 'GENERAL'),
(3, 'О Нас', 'Информация о компании', 'Магазин электро - товаров в Новомосковске', 'Розетки, лампочки, кабель', 'Наша профессия – электричество и все, что с ним связано. В 1992 году мы пришли на рынок электротоваров, и за прошедшее время сумели стать на нем одним из ведущих игроков с безупречной деловой репутацией. Сегодня главные направления деятельности нашей компании – это продажа электротехнического оборудования. Тесные партнёрские связи с компаниями-разработчиками позволяют нам быть в курсе всех новых идей и тенденций в электротехнической области. Мы предлагаем нашим клиентам только качественную продукцию отечественных и зарубежных производителей, хорошо зарекомендовавшую себя на отечественном рынке. Мы ценим и уважаем наших клиентов, поэтому основными принципами нашей работы являются качество, надежность и профессионализм.<!--TabDelimiter-->\nСегодня мы предлагаем широкий ассортимент электротехнической продукции и оборудования различной сложности - от провода и крепежа до инверторов и стабилизаторов. В нашем каталоге товаров продукция более ста производителей; мы следим за новинками на рынке электротоваров и постоянно пополняем свой ассортимент. У нас вы можете приобрести как штучный или погонный товар (например, купить кабель, лампочки, провод с ответвительными коробами или автоматические выключатели для дома), так и подобрать полный комплект установочного электротехнического оборудования для крупного промышленного предприятия\nДля нас нет мелочей; мы с одинаковым вниманием относимся и к большим, и к маленьким заказам. Если выбранного вами товара не окажется в магазине, мы в кратчайшие сроки доставим его.\nОптовым покупателям мы предлагаем специальные цены и доставку товара со склада в тот же день. Мы надеемся на долгосрочное сотрудничество со всеми нашими партнерами и клиентами, поэтому разрабатываем гибкую ценовую политику, а также используем в своей работе систему бонусов и скидок.\nЕсли вы еще не определились с выбором, наши консультанты помогут вам и подберут весь комплект необходимого оборудования с учетом ваших потребностей и финансовых возможностей.\nОбращайтесь к нам! Все, что касается электричества – предмет компетенции наших сотрудников. Ответим на любой ваш вопрос и поможем принять правильное решение. Помните, что правильный выбор электрооборудования поможет вам избежать больших неприятностей.\nКачество и безопасность – вот то, что мы гарантируем любому пользователю нашей продукции и услуг.\nС уважением, “Электрика”\n\n', NULL, NULL, '0000-00-00 00:00:00', 'about', 'GENERAL'),
(4, 'Контакты', 'Контактная информация компании', 'Контакты "Электрики"', 'Лампочки, розетки, батарейки', '<a href="http://elektrika/images/logo-el.png"><img class="alignnone size-full wp-image-5" src="http://elektrika/images/logo-el.png" alt="logo-el" width="320" height="79" /></a>\r\n&nbsp;\r\n<div style="width:45%; float:left;">\r\n<div>г. Новомосковск, ул. Садовского д.34</div>\r\n&nbsp;\r\n<div>телефон: 8 (48762) 6-07-11, 8 (48762) 6-37-64</div>\r\n&nbsp;\r\n<div>часы работы: 10:00-19:00</div>\r\n&nbsp;\r\n<div>без выходных</div>\r\n&nbsp;\r\n</div>\r\n<div style="width:45%; float:left;">\r\n<div>г. Новомосковск, ул. Мира д.34б</div>\r\n&nbsp;\r\n<div>телефон: 8 (48762) 4-06-07</div>\r\n&nbsp;\r\n<div>часы работы: 09:00-16:00</div>\r\n&nbsp;\r\n<div>понедельник выходной</div>\r\n</div>\r\n<div style="clear:both"></div> \r\n<a href="http://elektrika/images/logo-inst.png"><img class="alignnone size-full wp-image-6" src="http://elektrika/images/logo-inst.png" alt="logo-inst" width="320" height="84" /></a>\r\n&nbsp;\r\n<div>г. Новомосковск, ул. Садовского д.38</div>\r\n&nbsp;\r\n<div>телефон: 8 (48762) 6-07-11, 8 (48762) 6-37-64</div>\r\n&nbsp;\r\n<div>часы работы: 10:00-19:00</div>\r\n&nbsp;\r\n<div>без выходных</div>\r\n\r\n', NULL, NULL, '0000-00-00 00:00:00', 'contact', 'GENERAL'),
(6, 'Подробно о нас', 'Подробная информация', 'Магазин электро - товаров в Новомосковске', 'Розетки, лампочки, кабель', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui, non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.<!--PreviewDelimiter--> Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui, non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.\r\n              ', NULL, NULL, '0000-00-00 00:00:00', 'about-full', 'about'),
(8, 'Кто мы', 'Краткая информация', 'Краткая информация о "Электрика"', 'Розетки, лампочки, кабель', '<h3>Наша профессия – электричество и все, что с ним связано.</h3>\r\n    <p>\r\n        В 1992 году мы пришли на рынок электротоваров, и за прошедшее время сумели стать на нем одним из ведущих игроков с безупречной деловой репутацией.\r\n        Сегодня главные направления деятельности нашей компании – это продажа электротехнического оборудования.\r\n    </p>\r\n     <p>\r\n        Тесные партнёрские связи с компаниями-разработчиками позволяют нам быть в курсе всех новых идей и тенденций в электротехнической области.\r\n        Мы предлагаем нашим клиентам только качественную продукцию отечественных и зарубежных производителей, хорошо зарекомендовавшую себя на отечественном рынке.\r\n        Мы ценим и уважаем наших клиентов, поэтому основными принципами нашей работы являются качество, надежность и профессионализм.<!--PreviewDelimiter-->\r\n    </p>\r\n    <p>\r\n        Сегодня мы предлагаем широкий ассортимент электротехнической продукции и оборудования различной сложности - от провода и крепежа до инверторов и стабилизаторов.\r\n        В нашем каталоге товаров продукция более ста производителей; мы следим за новинками на рынке электротоваров и постоянно пополняем свой ассортимент.\r\n        У нас вы можете приобрести как штучный или погонный товар (например, купить кабель, лампочки, провод с ответвительными коробами или автоматические выключатели для дома),\r\n        так и подобрать полный комплект установочного электротехнического оборудования для крупного промышленного предприятия\r\n        Для нас нет мелочей; мы с одинаковым вниманием относимся и к большим, и к маленьким заказам.\r\n        Если выбранного вами товара не окажется в магазине, мы в кратчайшие сроки доставим его.\r\n        Оптовым покупателям мы предлагаем специальные цены и доставку товара со склада в тот же день. Мы надеемся на долгосрочное\r\n        сотрудничество со всеми нашими партнерами и клиентами, поэтому разрабатываем гибкую ценовую политику, а также используем в своей работе систему бонусов и скидок.\r\n    </p>\r\n    <p>\r\n        Если вы еще не определились с выбором, наши консультанты помогут вам и подберут весь комплект необходимого оборудования с учетом ваших потребностей и финансовых возможностей.\r\n        Обращайтесь к нам! Все, что касается электричества – предмет компетенции наших сотрудников. Ответим на любой ваш вопрос и поможем принять правильное решение. Помните, что правильный выбор электрооборудования поможет вам избежать больших неприятностей.\r\n        Качество и безопасность – вот то, что мы гарантируем любому пользователю нашей продукции и услуг.\r\n    </p>\r\n        <b>С уважением, “Электрика”</b>\r\n\r\n', NULL, 'about_us.png', '0000-00-00 00:00:00', 'who_we', 'home'),
(9, 'Почему Мы', 'Преимущества компании', 'Преимущества "Электрика"', 'Розетки, лампочки, кабель', '<ul>\r\n<li>СВОБОДА ВЫБОРА<br>\r\nБольшой выбор оборудования представлен такими известными производителями, как: «Legrand», «ABB», «Osram», «Philips», «Schneider Electric», «Devi», «Lival» и другие. Это проверенные производители, известные высоким качеством своего оборудования в России и Европе.</li>\r\n<li>ШИРОКИЕ ВОЗМОЖНОСТИ ПРИМЕНЕНИЯ<br>\r\nВ нашем магазине Вы найдете электротехнические изделия для любой сферы их применения — от бытовых аквариумов до промышленных производств. Лампы, светильники и их комплектующие, автоматические выключатели, УЗО, щиты, боксы, электросчетчики, кабели, теплые полы и электромонтажные изделия, — всё это и многое другое только у нас!</li><!--PreviewDelimiter-->\r\n<li>ПРОФЕССИОНАЛЬНАЯ КОНСУЛЬТАЦИЯ И ПОМОЩЬ В ВЫБОРЕ<br>\r\nНаши менеджеры всегда помогут вам выбрать необходимую модель изделий, полностью подходящую под ваши требования к цене и качеству. Помимо основной информации, вы получаете профессиональную консультацию об эксплуатации товара, методах монтажа и возможностях установки. Наши эксперты ответят на все интересующие вас вопросы. Мы добросовестно относимся к нашей работе и ценим каждого клиента.</li>\r\n<li>ВЫГОДНАЯ СИСТЕМА СКИДОК<br>\r\nВ нашем интернет-магазине предусмотрены выгодные системы распродаж и скидок, позволяющие каждому клиенту приобрести любой товар по доступным ценам.\r\nДальше производители</li>\r\n</ul>', NULL, 'why_we1.png', '0000-00-00 00:00:00', 'why_us', 'home'),
(10, 'Что мы предлагаем', 'Наша деятельность', 'Описание деятельности "Электрика"', 'Розетки, лампочки, кабель', '<p>«Электрика» – это успешная развивающая на рынке электротехнических изделий сеть розничных магазинов. Мы предлагает вам широкий ассортимент высококачественных электротоваров, которые отвечают всем вашим предпочтениям и нормам качества, по самым выгодным ценам. Индивидуальный подход к каждому клиенту оставит у вас только положительные эмоции из раза в раз.</p> \r\n<ul>\r\nМы предлагаем:\r\n	<ul>\r\n		Светотехника: \r\n		<li>Светодиодные лампы</li>\r\n		<li>Энергосберегающие лампы</li>\r\n		<li>Люминесцентные лампы</li>\r\n		<li>Галогенные лампы</li>\r\n		<li>Люстры</li>\r\n		<li>Бра</li>\r\n		<li>Точечные светильники</li>\r\n		<li>Настольные лампы</li>\r\n	</ul><!--PreviewDelimiter-->\r\n	<ul>\r\n		Электротехническая продукция:\r\n		<li>Вилки</li>\r\n		<li>Розетки</li>\r\n		<li>Выключатели</li>\r\n		<li>Удлинители</li>\r\n		<li>Сетевые фильтры</li>\r\n		<li>Колодки</li>\r\n	</ul>\r\n	<ul>\r\n		Кабельно-проводниковая продукция:\r\n		<li>Кабель силовой</li>\r\n		<li>Кабель связи</li>\r\n		<li>Провода и шнуры различного назначения</li>\r\n		<li>Провода для воздушных линий</li>\r\n		<li>Провода монтажные</li>\r\n	</ul>\r\n	<ul>\r\n		Низковольтная аппаратура:\r\n		<li>Автоматы</li>\r\n		<li>УЗО</li>\r\n		<li>Дифференциальные автоматы</li>\r\n		<li>ОПС (ограничители импульсных перенапряжений)</li>\r\n		<li>Контакторы, пускатели</li>\r\n	</ul>\r\n	<ul>\r\n		Сварочное оборудование:\r\n		<li>Инверторы, сварочные аппараты</li>\r\n		<li>Сварочные маски</li>\r\n		<li>Электроды, проволока для полуавтоматов</li>\r\n	</ul>\r\n	<ul>\r\n		Теплотехника:\r\n		<li>Радиаторы</li>\r\n		<li>Конвекторы</li>\r\n		<li>Тепловые пушки, тепловентиляторы</li>\r\n		<li>Тепловые завесы</li>\r\n		<li>Инфракрасные обогреватели</li>\r\n		<li>Теплый пол</li>\r\n		<li>Электрокотлы</li>\r\n		<li>водонагреватели</li>\r\n	</ul>\r\nи дальше производители\r\n</ul>', NULL, 'we_offer.png', '0000-00-00 00:00:00', 'we_offer', 'home'),
(11, 'Отзывы', 'Отзывы покупателей', 'Отзывы о "Электрика"', 'Розетки, лампочки, кабель', '<p>Уважаемый Покупатель!  </p>\r\n   <p>Магазин "Электрика" благодарит Вас за покупку. Мы работаем не покладая рук и стараемся удовлетворить все потребности и желания наших клиентов. </p>\r\n<p>Остались ли Вы довольны покупкой? </p><!--PreviewDelimiter-->\r\n<p>Мы будем Вам благодарны, если Вы расскажете о своих впечатлениях от покупке товара в нашем магазине.</p>\r\n<p>С уважением,</p>\r\n<p>Александр Кондратьев,</p>\r\n<p>Директор магазина "Электрика"</p>', NULL, 'otzivi.png', '0000-00-00 00:00:00', 'testimonials', 'home'),
(12, 'Наши сотрудники', '', 'Сотрудники "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.', NULL, '', '0000-00-00 00:00:00', 'people_working', 'about'),
(13, 'Мы профессионалы', '', 'Профессиональные услуги "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.', NULL, '', '0000-00-00 00:00:00', 'we_prof', 'about'),
(14, 'Качество обслуживания', '', 'Качественное  обслуживание в магазине "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.', NULL, '', '0000-00-00 00:00:00', 'quality_work', 'about'),
(15, 'Web_design', 'subtitle акции', 'Акции магазина "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.<!--PreviewDelimiter--> Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.\r\n', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.', 'image-web-design.png', '0000-00-00 00:00:00', 'web_design', 'actions'),
(16, 'Marketing', 'subtitle акции', 'Акции магазина "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.<!--PreviewDelimiter--> Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.\r\n', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.', 'image-web-design.png', '0000-00-00 00:00:00', 'marketing', 'actions'),
(17, 'Brand design', 'subtitle акции', 'Акции магазина "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.\r\n<!--PreviewDelimiter-->Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.', 'Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,\r\n   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,\r\n   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,\r\n   arcu eu lobortis egestas, massa leo ullamcorper dolor,\r\n   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.', 'image-web-design.png', '0000-00-00 00:00:00', 'brand_design', 'actions'),
(18, 'Наши акции', 'subtitle главной акций', 'Акции магазина "Электрика"', 'Розетки, лампочки, кабель', 'Большой выбор оборудования представлен такими известными производителями, как: «Legrand», «ABB», «Osram», «Philips», «Schneider Electric», «Devi», «Lival» и другие. Это проверенные производители, известные высоким качеством своего оборудования в России и Европе.\r\n<!--TabDelimiter-->\r\nЛампы, светильники и их комплектующие, автоматические выключатели, УЗО, щиты, боксы, электросчетчики, кабели, теплые полы и электромонтажные изделия, — всё это и многое другое только у нас!\r\n<!--TabDelimiter--> Наши менеджеры всегда помогут вам выбрать необходимую модель изделий, полностью подходящую под ваши требования к цене и качеству. Наши эксперты ответят на все интересующие вас вопросы.\r\n<!--TabDelimiter-->В нашем интернет-магазине предусмотрены выгодные системы распродаж и скидок, позволяющие каждому клиенту приобрести любой товар по доступным ценам. ', NULL, NULL, '0000-00-00 00:00:00', 'actions', 'GENERAL'),
(19, 'Вакансии', 'subtitle главной вакансий', 'Вакансии магазина "Электрика"', 'Розетки, лампочки, кабель', 'Большой выбор оборудования представлен такими известными производителями, как: «Legrand», «ABB», «Osram», «Philips», «Schneider Electric», «Devi», «Lival» и другие. Это проверенные производители, известные высоким качеством своего оборудования в России и Европе.\r\n<!--TabDelimiter-->\r\nЛампы, светильники и их комплектующие, автоматические выключатели, УЗО, щиты, боксы, электросчетчики, кабели, теплые полы и электромонтажные изделия, — всё это и многое другое только у нас!\r\n<!--TabDelimiter--> Наши менеджеры всегда помогут вам выбрать необходимую модель изделий, полностью подходящую под ваши требования к цене и качеству. Наши эксперты ответят на все интересующие вас вопросы.\r\n<!--TabDelimiter-->В нашем интернет-магазине предусмотрены выгодные системы распродаж и скидок, позволяющие каждому клиенту приобрести любой товар по доступным ценам. ', NULL, NULL, '0000-00-00 00:00:00', 'job', 'GENERAL');

-- --------------------------------------------------------

--
-- Структура таблицы `el_reviews`
--

DROP TABLE IF EXISTS `el_reviews`;
CREATE TABLE IF NOT EXISTS `el_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviews_content` longtext NOT NULL,
  `reviews_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviews_author` varchar(128) NOT NULL,
  `reviews_status` char(7) DEFAULT 'DISABLE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Дамп данных таблицы `el_reviews`
--

INSERT INTO `el_reviews` (`id`, `reviews_content`, `reviews_create_time`, `reviews_author`, `reviews_status`) VALUES
(1, 'Отзыв 1', '2014-10-01 18:49:42', 'admin', 'ENABLE'),
(2, 'Отзыв 1', '2014-10-01 18:50:28', 'admin', 'ENABLE'),
(30, 'asd', '2014-10-03 16:52:22', 'asda', 'ENABLE'),
(31, 'asd', '2014-10-03 16:55:29', 'sad', 'DISABLE'),
(32, 'asdasd', '2014-10-03 16:55:36', 'asdsd', 'DISABLE'),
(33, 'asdasd', '2014-10-03 17:07:14', 'asdasd', 'DISABLE'),
(34, 'asdasd', '2014-10-03 17:07:33', 'asdasd', 'DISABLE'),
(35, 'фывфыв', '2014-10-03 17:08:05', 'фывфыв', 'DISABLE'),
(36, 'фывфыв', '2014-10-03 17:09:06', 'фывыфв', 'DISABLE'),
(37, 'zxc', '2014-10-05 13:44:01', 'zxc', 'DISABLE');

-- --------------------------------------------------------

--
-- Структура таблицы `el_subscribers`
--

DROP TABLE IF EXISTS `el_subscribers`;
CREATE TABLE IF NOT EXISTS `el_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `el_subscribers`
--

INSERT INTO `el_subscribers` (`id`, `email`) VALUES
(18, '''1123@mail.com'''),
(20, '''12321@mail'''),
(19, '''123411@mail'''),
(14, '''1234@mail.com'''),
(1, '''123@mail.com'''),
(21, '''asd@mail.com'''),
(22, '''asddds@mail.com'''),
(23, '''asddsds@mail.com'''),
(26, '''linansk@inbox.ru'''),
(25, '''ssadd@aas.ru'''),
(24, '''ssdd@aas.ru''');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `el_comments`
--
ALTER TABLE `el_comments`
  ADD CONSTRAINT `el_comments_ibfk_1` FOREIGN KEY (`comments_parent_id`) REFERENCES `el_comments` (`id`),
  ADD CONSTRAINT `el_comments_ibfk_2` FOREIGN KEY (`comments_news_id`) REFERENCES `el_news` (`id`);

--
-- Ограничения внешнего ключа таблицы `el_news2categories`
--
ALTER TABLE `el_news2categories`
  ADD CONSTRAINT `el_news2categories_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `el_news` (`id`),
  ADD CONSTRAINT `el_news2categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `el_categories` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
