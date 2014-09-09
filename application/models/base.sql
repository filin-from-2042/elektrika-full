-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 09 2014 г., 20:46
-- Версия сервера: 5.5.37-log
-- Версия PHP: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `elektrika-db`
--
CREATE DATABASE IF NOT EXISTS `elektrika-db`
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;
USE `elektrika-db`;

-- --------------------------------------------------------

--
-- Структура таблицы `el_categories`
--

DROP TABLE IF EXISTS `el_categories`;
CREATE TABLE IF NOT EXISTS `el_categories` (
  `id` INT(255) NOT NULL AUTO_INCREMENT,
  `categories_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =12;

--
-- Дамп данных таблицы `el_categories`
--

INSERT INTO `el_categories` (`id`, `categories_name`) VALUES
  (1, ''App Media''),
  (2, ''Brand Media''),
  (3, ''CASE Study''),
  (4, ''Digital''),
  (5, ''E - Mail''),
  (6, ''Featured Articles''),
  (7, ''Graphic Design''),
  (8, ''Jobs''),
  (9, ''Multimedia''),
  (10, ''Networks'');

-- --------------------------------------------------------

--
-- Структура таблицы `el_comments`
--

DROP TABLE IF EXISTS `el_comments`;
CREATE TABLE IF NOT EXISTS `el_comments` (
  `id`                   INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `comments_content`     TEXT
                         COLLATE utf8_unicode_ci NOT NULL,
  `comments_create_time` TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments_author`      VARCHAR(128)
                         COLLATE utf8_unicode_ci NOT NULL,
  `comments_email`       VARCHAR(128)
                         COLLATE utf8_unicode_ci NOT NULL,
  `comments_status`      ENUM(''ENABLE'', ''DISABLE'')
                         COLLATE utf8_unicode_ci DEFAULT ''ENABLE'',
  `comments_article_id`  INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`comments_article_id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci
  AUTO_INCREMENT =1;

-- --------------------------------------------------------

--
-- Структура таблицы `el_news`
--

DROP TABLE IF EXISTS `el_news`;
CREATE TABLE IF NOT EXISTS `el_news` (
  `id`                 INT(11)   NOT NULL AUTO_INCREMENT,
  `news_title`         VARCHAR(128)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_description`   VARCHAR(128)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_keywords`      VARCHAR(128)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_content`       LONGTEXT
                       COLLATE utf8_unicode_ci,
  `news_create_date`   DATETIME DEFAULT NULL,
  `news_update_date`   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `news_preview_image` VARCHAR(255)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_author`        VARCHAR(128)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_status`        CHAR(7)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_type`          VARCHAR(100)
                       COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci
  AUTO_INCREMENT =5;

--
-- Дамп данных таблицы `el_news`
--

INSERT INTO `el_news` (`id`, `news_title`, `news_description`, `news_keywords`, `news_content`, `news_create_date`, `news_update_date`, `news_preview_image`, `news_author`, `news_status`, `news_type`)
VALUES
  (1, ''Тестирование сайта'', ''Тестируем сайт магазина "Электрика"'', ''тестирование'', ''Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,
   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,
   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,
   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,
   quis ultrices lacus suscipit vitae.<!--PreviewDelimiter- - > Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,
   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,
   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,
   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,
   quis ultrices lacus suscipit vitae.'', ''2014 - 09 - 09 00:00:00'', ''2014 - 09 - 09 11:51:21'',
   '' / images / image - post - preview.png'', ''admin'', ''1'', ''news''),
  (2, ''Тестирование сайта часть 2'', ''Тестируем сайт магазина "Электрика"'', ''тесирование'',
   ''Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,
   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,
   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,
   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.<!--PreviewDelimiter-->Maecenas sed ligula eget risus dictum ornare a et diam.Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,
   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,
   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,
   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.'',
   ''2014 - 09 - 09 00:00:00'', ''2014 - 09 - 09 10:58:26'', '' / images / image - post - preview.png'', ''admin'', ''1
   '', ''news''),
  (3, ''Тестирование сайта - '', ''Тестируем сайт магазина "Электрика"'', ''тестирование'',
   ''Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,
   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,
   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,
   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,
   quis ultrices lacus suscipit vitae.<!--PreviewDelimiter- - > Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec luctus purus ut congue malesuada.Curabitur interdum posuere erat quis vulputate.Nunc nec lectus et mi pellentesque consectetur.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Nulla fermentum ipsum ut purus gravida condimentum.Donec facilisis pellentesque blandit.Nulla ac ornare elit,
   a rhoncus libero.Nullam facilisis scelerisque euismod.Sed dolor tortor, pretium sit amet efficitur et,
   fermentum eu neque.Cras posuere mollis odio AT iaculis.Maecenas ac arcu bibendum, ultrices nisl ac,
   vestibulum nulla.Nullam egestas eros ac iaculis pulvinar.Aenean fermentum felis sem,
   quis ultrices lacus suscipit vitae.'', ''2014 - 09 - 09 00:00:00'', ''2014 - 09 - 09 10:58:39'',
   '' / images / image - post - preview.png'', ''admin'', ''1'', ''news''),
  (4, ''Тестирование сайта часть 2 - '', ''Тестируем сайт магазина "Электрика"'', ''тесирование'',
   ''Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,
   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,
   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,
   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.<!--PreviewDelimiter-->Maecenas sed ligula eget risus dictum ornare a et diam.Nam vitae erat eget turpis porttitor molestie eget non velit.Nam cursus massa vitae placerat maximus.Mauris vitae varius dui,
   et scelerisque augue.Donec blandit ornare augue, at accumsan odio gravida non.Ut commodo lorem non augue cursus,
   sed vestibulum nisi sollicitudin.Cras a pulvinar libero,
   at consequat sem.Nunc eget tellus nec odio posuere dapibus non vitae diam.IN sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc.Mauris nec risus turpis. Duis vel ex enim.'',
   ''2014 - 09 - 09 00:00:00'', ''2014 - 09 - 09 10:58:50'', '' / images / image - post - preview.png'', ''admin'', ''1
   '', ''news'');

-- --------------------------------------------------------

--
-- Структура таблицы `el_news2categories`
--

DROP TABLE IF EXISTS `el_news2categories`;
CREATE TABLE IF NOT EXISTS `el_news2categories` (
  `id`      INT(11) NOT NULL AUTO_INCREMENT,
  `news_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_news2categories_category_id` (`category_id`),
  KEY `FK_news2categories_news_id` (`news_id`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  AUTO_INCREMENT =7;

--
-- Дамп данных таблицы `el_news2categories`
--

INSERT INTO `el_news2categories` (`id`, `news_id`, `category_id`) VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (6, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `el_pages`
--

DROP TABLE IF EXISTS `el_pages`;
CREATE TABLE IF NOT EXISTS `el_pages` (
  `id`                INT(11)                 NOT NULL AUTO_INCREMENT,
  `pages_title`       VARCHAR(255)
                      COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_description` VARCHAR(255)
                      COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_keywords`    VARCHAR(255)
                      COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_text`        LONGTEXT
                      COLLATE utf8_unicode_ci NOT NULL,
  `pages_create_date` TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `page_name`         VARCHAR(255)
                      COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_type`         CHAR(15)
                      COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_page_name` (`page_name`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8
  COLLATE =utf8_unicode_ci
  AUTO_INCREMENT =19;

--
-- Дамп данных таблицы `el_pages`
--

INSERT INTO `el_pages` (`id`, `pages_title`, `pages_description`, `pages_keywords`, `pages_text`, `pages_create_date`, `page_name`, `page_type`)
VALUES
  (2, ''Магазин Электрика'', ''Магазин электро - товаров в Новомосковске'', ''Розетки, лампочки, кабель'',
   ''Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra,
   per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui,
   non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.<!--TabDelimiter-->Ut a elit eget mi ornare mattis.Etiam dignissim,
   diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis.Donec id ante dapibus,
   aliquet tellus non,
   semper erat.Nulla non dapibus lorem.Proin vitae lacinia nisi.Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit.Morbi dapibus cursus erat,
   et pharetra risus luctus sit amet.Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet.Fusce nec sapien dolor.Vestibulum mollis eleifend lorem,
   a rhoncus dui euismod ut.Nam pulvinar nibh et leo sodales,
   quis sagittis libero pellentesque.IN egestas rhoncus augue non molestie. IN suscipit felis erat, IN
   cursus arcu euismod et.<!--TabDelimiter-->Proin AT erat quis elit euismod pulvinar.Nulla luctus,
   mauris eget condimentum faucibus, est velit ultrices mi,
   quis euismod tortor diam non nunc.Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet.Nam aliquet est congue neque ornare ullamcorper.Class aptent taciti sociosqu ad litora torquent per conubia nostra,
   per inceptos himenaeos.Donec est ante, eleifend sit amet adipiscing pellentesque,
   facilisis quis arcu.Suspendisse sapien velit, interdum non ligula id,
   tincidunt commodo massa.Nullam suscipit blandit nunc,
   convallis elementum nibh semper vehicula.Pellentesque dictum nisi IN neque hendrerit,
   quis volutpat justo vulputate.Nunc sit amet risus viverra, posuere libero accumsan,
   mattis nulla.Proin vitae fringilla sem.Curabitur non eros dui.<!--TabDelimiter-->Suspendisse fringilla varius sagittis.Pellentesque nisi ligula,
   tincidunt quis sollicitudin a, ultrices vitae lorem.Vivamus auctor, orci sed aliquam suscipit,
   neque neque molestie lectus,
   sit amet porta mi odio vitae elit.Phasellus auctor volutpat sapien eu ornare.Nam auctor lacus felis,
   quis vehicula quam ultrices IN.Aliquam erat volutpat.Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula,
   sed tincidunt dui nisi et est.'', ''2014 - 08 - 04 18:45:16'', ''home'', ''GENERAL''),
(3, ''О Нас'', ''Магазин электро - товаров в Новомосковске'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.<!--TabDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.<!--TabDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.'', ''2014 - 08 - 09 10:56:41'', ''about'', ''GENERAL''),
(4, ''Контакты'', ''Контакты "Электрики"'', ''Лампочки, розетки, батарейки'', ''Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et, cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum, \r\narcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.'', ''2014 - 09 - 01 17:10:37'', ''contact'', ''GENERAL''),
(6, ''Подробно о нас'', ''Магазин электро - товаров в Новомосковске'', ''Розетки, лампочки, кабель'', '' Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui, non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.<!--PreviewDelimiter - - > Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui, non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.\r\n              '', ''2014 - 09 - 01 17:48:37'', ''about - FULL '', ''about''),
(8, ''Кто мы'', ''Краткая информация о "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui, non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.<!--PreviewDelimiter - - > Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi ac metus nulla.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Quisque eget est venenatis quam ultrices lobortis eget AT lacus.Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula.Pellentesque et posuere neque. Vivamus a velit sem.Nullam sed urna AT augue fringilla ultrices.Nunc vitae diam a lectus congue cursus IN eget nulla.Ut tincidunt auctor dui, non convallis neque consectetur vel.Fusce laoreet felis a nisl laoreet posuere.Nulla facilisi.'', ''2014 - 09 - 02 14:41:09'', ''who_we'', ''home''),
(9, ''Почему стоит обратиться к нам'', ''Преимущества "Электрика"'', ''Розетки, лампочки, кабель'', ''Ut a elit eget mi ornare mattis.Etiam dignissim, diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis.Donec id ante dapibus, aliquet tellus non, semper erat.Nulla non dapibus lorem.Proin vitae lacinia nisi.Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit.Morbi dapibus cursus erat, et pharetra risus luctus sit amet.Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet.Fusce nec sapien dolor.Vestibulum mollis eleifend lorem, a rhoncus dui euismod ut.Nam pulvinar nibh et leo sodales, quis sagittis libero pellentesque.IN egestas rhoncus augue non molestie. IN suscipit felis erat, IN cursus arcu euismod et.<!--PreviewDelimiter-->Ut a elit eget mi ornare mattis.Etiam dignissim, diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis.Donec id ante dapibus, aliquet tellus non, semper erat.Nulla non dapibus lorem.Proin vitae lacinia nisi.Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit.Morbi dapibus cursus erat, et pharetra risus luctus sit amet.Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet.Fusce nec sapien dolor.Vestibulum mollis eleifend lorem, a rhoncus dui euismod ut.Nam pulvinar nibh et leo sodales, quis sagittis libero pellentesque.IN egestas rhoncus augue non molestie. IN suscipit felis erat, IN cursus arcu euismod et.'', ''2014 - 09 - 02 14:45:00'', ''why_us'', ''home''),
(10, ''Что мы предлагаем'', ''Описание деятельности "Электрика"'', ''Розетки, лампочки, кабель'', ''Proin AT erat quis elit euismod pulvinar.Nulla luctus, mauris eget condimentum faucibus, est velit ultrices mi, quis euismod tortor diam non nunc.Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet.Nam aliquet est congue neque ornare ullamcorper.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Donec est ante, eleifend sit amet adipiscing pellentesque, facilisis quis arcu.Suspendisse sapien velit, interdum non ligula id, tincidunt commodo massa.Nullam suscipit blandit nunc, convallis elementum nibh semper vehicula.Pellentesque dictum nisi IN neque hendrerit, quis volutpat justo vulputate.Nunc sit amet risus viverra, posuere libero accumsan, mattis nulla.Proin vitae fringilla sem.Curabitur non eros dui.<!--PreviewDelimiter-->Proin AT erat quis elit euismod pulvinar.Nulla luctus, mauris eget condimentum faucibus, est velit ultrices mi, quis euismod tortor diam non nunc.Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet.Nam aliquet est congue neque ornare ullamcorper.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Donec est ante, eleifend sit amet adipiscing pellentesque, facilisis quis arcu.Suspendisse sapien velit, interdum non ligula id, tincidunt commodo massa.Nullam suscipit blandit nunc, convallis elementum nibh semper vehicula.Pellentesque dictum nisi IN neque hendrerit, quis volutpat justo vulputate.Nunc sit amet risus viverra, posuere libero accumsan, mattis nulla.Proin vitae fringilla sem.Curabitur non eros dui.'', ''2014 - 09 - 02 14:45:00'', ''we_offer'', ''home''),
(11, ''Отзывы'', ''Отзывы о "Электрика"'', ''Розетки, лампочки, кабель'', ''Suspendisse fringilla varius sagittis.Pellentesque nisi ligula, tincidunt quis sollicitudin a, ultrices vitae lorem.Vivamus auctor, orci sed aliquam suscipit, neque neque molestie lectus, sit amet porta mi odio vitae elit.Phasellus auctor volutpat sapien eu ornare.Nam auctor lacus felis, quis vehicula quam ultrices IN.Aliquam erat volutpat.Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula, sed tincidunt dui nisi et est.<!--PreviewDelimiter-->Suspendisse fringilla varius sagittis.Pellentesque nisi ligula, tincidunt quis sollicitudin a, ultrices vitae lorem.Vivamus auctor, orci sed aliquam suscipit, neque neque molestie lectus, sit amet porta mi odio vitae elit.Phasellus auctor volutpat sapien eu ornare.Nam auctor lacus felis, quis vehicula quam ultrices IN.Aliquam erat volutpat.Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula, sed tincidunt dui nisi et est.'', ''2014 - 09 - 02 14:47:16'', ''testimonials'', ''home''),
(12, ''Наши сотрудники'', ''Сотрудники "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.'', ''2014 - 09 - 03 18:19:20'', ''people_working'', ''about''),
(13, ''Мы профессионалы'', ''Профессиональные услуги "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.'', ''2014 - 09 - 03 18:19:20'', ''we_prof'', ''about''),
(14, ''Качество обслуживания'', ''Качественное  обслуживание в магазине "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet, consectetur adipiscing elit.IN rhoncus lobortis orci, sed vestibulum leo dapibus et.Fusce IN dolor velit, sit amet vehicula est.INTEGER elit sapien, varius IN tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.'', ''2014 - 09 - 03 18:21:50'', ''quality_work'', ''about''),
  (15, ''Web_design'', ''Услуги магазина "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,
   arcu eu lobortis egestas, massa leo ullamcorper dolor,
   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.<!--PreviewDelimiter-- > Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,
   arcu eu lobortis egestas, massa leo ullamcorper dolor,
   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.\r\n'',
   ''2014 - 09 - 03 18:39:55'', ''web_design'', ''services''),
  (16, ''Marketing'', ''Услуги магазина "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,
   arcu eu lobortis egestas, massa leo ullamcorper dolor,
   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.<!--PreviewDelimiter-- > Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,
   arcu eu lobortis egestas, massa leo ullamcorper dolor,
   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.\r\n'',
   ''2014 - 09 - 03 18:39:55'', ''marketing'', ''services''),
  (17, ''Brand design'', ''Услуги магазина "Электрика"'', ''Розетки, лампочки, кабель'', ''Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,
   arcu eu lobortis egestas, massa leo ullamcorper dolor,
   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.\r\n<!--PreviewDelimiter-->Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet,
   consectetur adipiscing elit.Donec nisl felis, lobortis ac vulputate et,
   cursus eget tellus.Donec IN ipsum nec tellus malesuada sodales non ac sem.Aliquam erat volutpat.Proin IN velit nec tellus egestas auctor et eget nulla.Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat.Proin bibendum,
   arcu eu lobortis egestas, massa leo ullamcorper dolor,
   non ullamcorper neque magna quis diam.Praesent interdum neque id nulla accumsan euismod.Curabitur sit amet ornare purus.Aliquam erat volutpat.'',
   ''2014 - 09 - 03 18:41:23'', ''brand_design'', ''services''),
  (18, ''Наши услуги'', ''Услуги магазина "Электрика"'', ''Розетки, лампочки, кабель'',
   ''Sed ut perspiciatis unde omnis iste natus ERROR sit voluptatem accusantium doloremque laudantium,
   totam rem aperiam,
   eaque ipsa quae.<!--TabDelimiter-->Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,
   sed quia consequuntur magni dolores eos qui ratione.<!- - TabDelimiter - - > Neque porro quisquam est,
   qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,
   sed quia non numquam eius modi tempora incidunt ut labore.<!--TabDelimiter-->Ut enim ad minima veniam,
   quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? '', ''2014
   - 09 - 03 18:43:34'', ''services'', ''GENERAL'');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `el_comments`
--
ALTER TABLE `el_comments`
ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`comments_article_id`) REFERENCES `el_news` (`id`);

--
-- Ограничения внешнего ключа таблицы `el_news2categories`
--
ALTER TABLE `el_news2categories`
ADD CONSTRAINT `el_news2categories_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `el_news` (`id`),
ADD CONSTRAINT `el_news2categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `el_categories` (`id`);
-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 09 2014 г., 20:46
-- Версия сервера: 5.5.37-log
-- Версия PHP: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `elektrika-db`
--
CREATE DATABASE IF NOT EXISTS `elektrika-db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `elektrika-db`;

-- --------------------------------------------------------

--
-- Структура таблицы `el_categories`
--

DROP TABLE IF EXISTS `el_categories`;
CREATE TABLE IF NOT EXISTS `el_categories` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `el_categories`
--

INSERT INTO `el_categories` (`id`, `categories_name`) VALUES
  (1, 'App Media'),
  (2, 'Brand Media'),
  (3, 'Case Study'),
  (4, 'Digital'),
  (5, 'E-Mail'),
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
  `comments_status` enum('enable','disable') COLLATE utf8_unicode_ci DEFAULT 'enable',
  `comments_article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`comments_article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `el_news`
--

INSERT INTO `el_news` (`id`, `news_title`, `news_description`, `news_keywords`, `news_content`, `news_create_date`, `news_update_date`, `news_preview_image`, `news_author`, `news_status`, `news_type`) VALUES
  (1, 'Тестирование сайта', 'Тестируем сайт магазина "Электрика"', 'тестирование', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus purus ut congue malesuada. Curabitur interdum posuere erat quis vulputate. Nunc nec lectus et mi pellentesque consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla fermentum ipsum ut purus gravida condimentum. Donec facilisis pellentesque blandit. Nulla ac ornare elit, a rhoncus libero. Nullam facilisis scelerisque euismod. Sed dolor tortor, pretium sit amet efficitur et, fermentum eu neque. Cras posuere mollis odio at iaculis. Maecenas ac arcu bibendum, ultrices nisl ac, vestibulum nulla. Nullam egestas eros ac iaculis pulvinar. Aenean fermentum felis sem, quis ultrices lacus suscipit vitae.<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus purus ut congue malesuada. Curabitur interdum posuere erat quis vulputate. Nunc nec lectus et mi pellentesque consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla fermentum ipsum ut purus gravida condimentum. Donec facilisis pellentesque blandit. Nulla ac ornare elit, a rhoncus libero. Nullam facilisis scelerisque euismod. Sed dolor tortor, pretium sit amet efficitur et, fermentum eu neque. Cras posuere mollis odio at iaculis. Maecenas ac arcu bibendum, ultrices nisl ac, vestibulum nulla. Nullam egestas eros ac iaculis pulvinar. Aenean fermentum felis sem, quis ultrices lacus suscipit vitae.', '2014-09-09 00:00:00', '2014-09-09 11:51:21', '/images/image-post-preview.png', 'admin', '1', 'news'),
  (2, 'Тестирование сайта часть 2', 'Тестируем сайт магазина "Электрика"', 'тесирование', 'Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit. Nam cursus massa vitae placerat maximus. Mauris vitae varius dui, et scelerisque augue. Donec blandit ornare augue, at accumsan odio gravida non. Ut commodo lorem non augue cursus, sed vestibulum nisi sollicitudin. Cras a pulvinar libero, at consequat sem. Nunc eget tellus nec odio posuere dapibus non vitae diam. In sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc. Mauris nec risus turpis. Duis vel ex enim.<!--PreviewDelimiter-->Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit. Nam cursus massa vitae placerat maximus. Mauris vitae varius dui, et scelerisque augue. Donec blandit ornare augue, at accumsan odio gravida non. Ut commodo lorem non augue cursus, sed vestibulum nisi sollicitudin. Cras a pulvinar libero, at consequat sem. Nunc eget tellus nec odio posuere dapibus non vitae diam. In sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc. Mauris nec risus turpis. Duis vel ex enim.', '2014-09-09 00:00:00', '2014-09-09 10:58:26', '/images/image-post-preview.png', 'admin', '1', 'news'),
  (3, 'Тестирование сайта-', 'Тестируем сайт магазина "Электрика"', 'тестирование', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus purus ut congue malesuada. Curabitur interdum posuere erat quis vulputate. Nunc nec lectus et mi pellentesque consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla fermentum ipsum ut purus gravida condimentum. Donec facilisis pellentesque blandit. Nulla ac ornare elit, a rhoncus libero. Nullam facilisis scelerisque euismod. Sed dolor tortor, pretium sit amet efficitur et, fermentum eu neque. Cras posuere mollis odio at iaculis. Maecenas ac arcu bibendum, ultrices nisl ac, vestibulum nulla. Nullam egestas eros ac iaculis pulvinar. Aenean fermentum felis sem, quis ultrices lacus suscipit vitae.<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus purus ut congue malesuada. Curabitur interdum posuere erat quis vulputate. Nunc nec lectus et mi pellentesque consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla fermentum ipsum ut purus gravida condimentum. Donec facilisis pellentesque blandit. Nulla ac ornare elit, a rhoncus libero. Nullam facilisis scelerisque euismod. Sed dolor tortor, pretium sit amet efficitur et, fermentum eu neque. Cras posuere mollis odio at iaculis. Maecenas ac arcu bibendum, ultrices nisl ac, vestibulum nulla. Nullam egestas eros ac iaculis pulvinar. Aenean fermentum felis sem, quis ultrices lacus suscipit vitae.', '2014-09-09 00:00:00', '2014-09-09 10:58:39', '/images/image-post-preview.png', 'admin', '1', 'news'),
  (4, 'Тестирование сайта часть 2-', 'Тестируем сайт магазина "Электрика"', 'тесирование', 'Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit. Nam cursus massa vitae placerat maximus. Mauris vitae varius dui, et scelerisque augue. Donec blandit ornare augue, at accumsan odio gravida non. Ut commodo lorem non augue cursus, sed vestibulum nisi sollicitudin. Cras a pulvinar libero, at consequat sem. Nunc eget tellus nec odio posuere dapibus non vitae diam. In sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc. Mauris nec risus turpis. Duis vel ex enim.<!--PreviewDelimiter-->Maecenas sed ligula eget risus dictum ornare a et diam. Nam vitae erat eget turpis porttitor molestie eget non velit. Nam cursus massa vitae placerat maximus. Mauris vitae varius dui, et scelerisque augue. Donec blandit ornare augue, at accumsan odio gravida non. Ut commodo lorem non augue cursus, sed vestibulum nisi sollicitudin. Cras a pulvinar libero, at consequat sem. Nunc eget tellus nec odio posuere dapibus non vitae diam. In sollicitudin pellentesque risus ut ultrices. Praesent a egestas nunc. Mauris nec risus turpis. Duis vel ex enim.', '2014-09-09 00:00:00', '2014-09-09 10:58:50', '/images/image-post-preview.png', 'admin', '1', 'news');

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
  UNIQUE KEY `id` (`id`),
  KEY `FK_news2categories_category_id` (`category_id`),
  KEY `FK_news2categories_news_id` (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `el_news2categories`
--

INSERT INTO `el_news2categories` (`id`, `news_id`, `category_id`) VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (6, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `el_pages`
--

DROP TABLE IF EXISTS `el_pages`;
CREATE TABLE IF NOT EXISTS `el_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pages_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `page_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_type` char(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_page_name` (`page_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `el_pages`
--

INSERT INTO `el_pages` (`id`, `pages_title`, `pages_description`, `pages_keywords`, `pages_text`, `pages_create_date`, `page_name`, `page_type`) VALUES
  (2, 'Магазин Электрика', 'Магазин электро-товаров в Новомосковске', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac metus nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque eget est venenatis quam ultrices lobortis eget at lacus. Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula. Pellentesque et posuere neque. Vivamus a velit sem. Nullam sed urna at augue fringilla ultrices. Nunc vitae diam a lectus congue cursus in eget nulla. Ut tincidunt auctor dui, non convallis neque consectetur vel. Fusce laoreet felis a nisl laoreet posuere. Nulla facilisi.<!--TabDelimiter-->Ut a elit eget mi ornare mattis. Etiam dignissim, diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis. Donec id ante dapibus, aliquet tellus non, semper erat. Nulla non dapibus lorem. Proin vitae lacinia nisi. Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit. Morbi dapibus cursus erat, et pharetra risus luctus sit amet. Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet. Fusce nec sapien dolor. Vestibulum mollis eleifend lorem, a rhoncus dui euismod ut. Nam pulvinar nibh et leo sodales, quis sagittis libero pellentesque. In egestas rhoncus augue non molestie. In suscipit felis erat, in cursus arcu euismod et.<!--TabDelimiter-->Proin at erat quis elit euismod pulvinar. Nulla luctus, mauris eget condimentum faucibus, est velit ultrices mi, quis euismod tortor diam non nunc. Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet. Nam aliquet est congue neque ornare ullamcorper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec est ante, eleifend sit amet adipiscing pellentesque, facilisis quis arcu. Suspendisse sapien velit, interdum non ligula id, tincidunt commodo massa. Nullam suscipit blandit nunc, convallis elementum nibh semper vehicula. Pellentesque dictum nisi in neque hendrerit, quis volutpat justo vulputate. Nunc sit amet risus viverra, posuere libero accumsan, mattis nulla. Proin vitae fringilla sem. Curabitur non eros dui.<!--TabDelimiter-->Suspendisse fringilla varius sagittis. Pellentesque nisi ligula, tincidunt quis sollicitudin a, ultrices vitae lorem. Vivamus auctor, orci sed aliquam suscipit, neque neque molestie lectus, sit amet porta mi odio vitae elit. Phasellus auctor volutpat sapien eu ornare. Nam auctor lacus felis, quis vehicula quam ultrices in. Aliquam erat volutpat. Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula, sed tincidunt dui nisi et est.', '2014-08-04 18:45:16', 'home', 'general'),
  (3, 'О Нас', 'Магазин электро-товаров в Новомосковске', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus lobortis orci,sed vestibulum leo dapibus et. Fusce in dolor velit, sit amet vehicula est. Integer elit sapien, varius in tristique et, bibendum quis enim. Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa. <!--TabDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus lobortis orci,sed vestibulum leo dapibus et. Fusce in dolor velit, sit amet vehicula est. Integer elit sapien,varius in tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus. Nullam semper sagittis magna, nec elementum neque facilisis et. Nulla ullamcorper tincidunt massa.<!--TabDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus lobortis orci, sed vestibulum leo dapibus et. Fusce in dolor velit, sit amet vehicula est. Integer elit sapien,varius in tristique et, bibendum quis enim. Donec scelerisque ante neque, at pulvinar risus. Nullam semper sagittis magna,nec elementum neque facilisis et. Nulla ullamcorper tincidunt massa.', '2014-08-09 10:56:41', 'about', 'general'),
  (4, 'Контакты', 'Контакты "Электрики"', 'Лампочки, розетки, батарейки', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et,cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat.Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum.Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum,\r\narcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.', '2014-09-01 17:10:37', 'contact', 'general'),
  (6, 'Подробно о нас', 'Магазин электро-товаров в Новомосковске', 'Розетки, лампочки, кабель', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac metus nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque eget est venenatis quam ultrices lobortis eget at lacus. Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula. Pellentesque et posuere neque. Vivamus a velit sem. Nullam sed urna at augue fringilla ultrices. Nunc vitae diam a lectus congue cursus in eget nulla. Ut tincidunt auctor dui, non convallis neque consectetur vel. Fusce laoreet felis a nisl laoreet posuere. Nulla facilisi.<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac metus nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque eget est venenatis quam ultrices lobortis eget at lacus. Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula. Pellentesque et posuere neque. Vivamus a velit sem. Nullam sed urna at augue fringilla ultrices. Nunc vitae diam a lectus congue cursus in eget nulla. Ut tincidunt auctor dui, non convallis neque consectetur vel. Fusce laoreet felis a nisl laoreet posuere. Nulla facilisi.\r\n              ', '2014-09-01 17:48:37', 'about-full', 'about'),
  (8, 'Кто мы', 'Краткая информация о "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac metus nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque eget est venenatis quam ultrices lobortis eget at lacus. Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula. Pellentesque et posuere neque. Vivamus a velit sem. Nullam sed urna at augue fringilla ultrices. Nunc vitae diam a lectus congue cursus in eget nulla. Ut tincidunt auctor dui, non convallis neque consectetur vel. Fusce laoreet felis a nisl laoreet posuere. Nulla facilisi.<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac metus nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque eget est venenatis quam ultrices lobortis eget at lacus. Mauris tempor justo vel egestas fermentum. Vivamus eu ipsum ligula. Pellentesque et posuere neque. Vivamus a velit sem. Nullam sed urna at augue fringilla ultrices. Nunc vitae diam a lectus congue cursus in eget nulla. Ut tincidunt auctor dui, non convallis neque consectetur vel. Fusce laoreet felis a nisl laoreet posuere. Nulla facilisi.', '2014-09-02 14:41:09', 'who_we', 'home'),
  (9, 'Почему стоит обратиться к нам', 'Преимущества "Электрика"', 'Розетки, лампочки, кабель', 'Ut a elit eget mi ornare mattis. Etiam dignissim, diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis. Donec id ante dapibus, aliquet tellus non, semper erat. Nulla non dapibus lorem. Proin vitae lacinia nisi. Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit. Morbi dapibus cursus erat, et pharetra risus luctus sit amet. Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet. Fusce nec sapien dolor. Vestibulum mollis eleifend lorem, a rhoncus dui euismod ut. Nam pulvinar nibh et leo sodales, quis sagittis libero pellentesque. In egestas rhoncus augue non molestie. In suscipit felis erat, in cursus arcu euismod et.<!--PreviewDelimiter-->Ut a elit eget mi ornare mattis. Etiam dignissim, diam sit amet faucibus ultricies, enim velit hendrerit ipsum, sed facilisis dui purus a turpis. Donec id ante dapibus, aliquet tellus non, semper erat. Nulla non dapibus lorem. Proin vitae lacinia nisi. Sed sed nisl dapibus orci volutpat dignissim dapibus vitae elit. Morbi dapibus cursus erat, et pharetra risus luctus sit amet. Vestibulum dapibus lacinia scelerisque. Praesent porta eget risus id imperdiet. Fusce nec sapien dolor. Vestibulum mollis eleifend lorem, a rhoncus dui euismod ut. Nam pulvinar nibh et leo sodales, quis sagittis libero pellentesque. In egestas rhoncus augue non molestie. In suscipit felis erat, in cursus arcu euismod et.', '2014-09-02 14:45:00', 'why_us', 'home'),
  (10, 'Что мы предлагаем', 'Описание деятельности "Электрика"', 'Розетки, лампочки, кабель', 'Proin at erat quis elit euismod pulvinar. Nulla luctus, mauris eget condimentum faucibus, est velit ultrices mi, quis euismod tortor diam non nunc. Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet. Nam aliquet est congue neque ornare ullamcorper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec est ante, eleifend sit amet adipiscing pellentesque, facilisis quis arcu. Suspendisse sapien velit, interdum non ligula id, tincidunt commodo massa. Nullam suscipit blandit nunc, convallis elementum nibh semper vehicula. Pellentesque dictum nisi in neque hendrerit, quis volutpat justo vulputate. Nunc sit amet risus viverra, posuere libero accumsan, mattis nulla. Proin vitae fringilla sem. Curabitur non eros dui.<!--PreviewDelimiter-->Proin at erat quis elit euismod pulvinar. Nulla luctus, mauris eget condimentum faucibus, est velit ultrices mi, quis euismod tortor diam non nunc. Aenean ac ultricies dui. Donec tincidunt felis vitae varius laoreet. Nam aliquet est congue neque ornare ullamcorper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec est ante, eleifend sit amet adipiscing pellentesque, facilisis quis arcu. Suspendisse sapien velit, interdum non ligula id, tincidunt commodo massa. Nullam suscipit blandit nunc, convallis elementum nibh semper vehicula. Pellentesque dictum nisi in neque hendrerit, quis volutpat justo vulputate. Nunc sit amet risus viverra, posuere libero accumsan, mattis nulla. Proin vitae fringilla sem. Curabitur non eros dui.', '2014-09-02 14:45:00', 'we_offer', 'home'),
  (11, 'Отзывы', 'Отзывы о "Электрика"', 'Розетки, лампочки, кабель', 'Suspendisse fringilla varius sagittis. Pellentesque nisi ligula, tincidunt quis sollicitudin a, ultrices vitae lorem. Vivamus auctor, orci sed aliquam suscipit, neque neque molestie lectus, sit amet porta mi odio vitae elit. Phasellus auctor volutpat sapien eu ornare. Nam auctor lacus felis, quis vehicula quam ultrices in. Aliquam erat volutpat. Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula, sed tincidunt dui nisi et est.<!--PreviewDelimiter-->Suspendisse fringilla varius sagittis. Pellentesque nisi ligula, tincidunt quis sollicitudin a, ultrices vitae lorem. Vivamus auctor, orci sed aliquam suscipit, neque neque molestie lectus, sit amet porta mi odio vitae elit. Phasellus auctor volutpat sapien eu ornare. Nam auctor lacus felis, quis vehicula quam ultrices in. Aliquam erat volutpat. Proin ultricies, sem ac aliquet gravida, nulla mi ornare ligula, sed tincidunt dui nisi et est.', '2014-09-02 14:47:16', 'testimonials', 'home'),
  (12, 'Наши сотрудники', 'Сотрудники "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus lobortis orci,sed vestibulum leo dapibus et. Fusce in dolor velit, sit amet vehicula est. Integer elit sapien, varius in tristique et, bibendum quis enim. Donec scelerisque ante neque, at pulvinar risus.Nullam semper sagittis magna, nec elementum neque facilisis et.Nulla ullamcorper tincidunt massa.', '2014-09-03 18:19:20', 'people_working', 'about'),
  (13, 'Мы профессионалы', 'Профессиональные услуги "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus lobortis orci,sed vestibulum leo dapibus et. Fusce in dolor velit, sit amet vehicula est. Integer elit sapien,varius in tristique et, bibendum quis enim.Donec scelerisque ante neque, at pulvinar risus. Nullam semper sagittis magna, nec elementum neque facilisis et. Nulla ullamcorper tincidunt massa.', '2014-09-03 18:19:20', 'we_prof', 'about'),
  (14, 'Качество обслуживания', 'Качественное  обслуживание в магазине "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In rhoncus lobortis orci, sed vestibulum leo dapibus et. Fusce in dolor velit, sit amet vehicula est. Integer elit sapien,varius in tristique et, bibendum quis enim. Donec scelerisque ante neque, at pulvinar risus. Nullam semper sagittis magna,nec elementum neque facilisis et. Nulla ullamcorper tincidunt massa.', '2014-09-03 18:21:50', 'quality_work', 'about'),
  (15, 'Web_design', 'Услуги магазина "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum. Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum, arcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum. Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum, arcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.\r\n', '2014-09-03 18:39:55', 'web_design', 'services'),
  (16, 'Marketing', 'Услуги магазина "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum. Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum, arcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum. Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum, arcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.\r\n', '2014-09-03 18:39:55', 'marketing', 'services'),
  (17, 'Brand design', 'Услуги магазина "Электрика"', 'Розетки, лампочки, кабель', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum. Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum, arcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.\r\n<!--PreviewDelimiter-->Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl felis, lobortis ac vulputate et, cursus eget tellus. Donec in ipsum nec tellus malesuada sodales non ac sem. Aliquam erat volutpat. Proin in velit nec tellus egestas auctor et eget nulla. Maecenas gravida lacus non leo congue elementum. Praesent tincidunt lectus nec felis hendrerit id blandit ante consequat. Proin bibendum, arcu eu lobortis egestas, massa leo ullamcorper dolor, non ullamcorper neque magna quis diam. Praesent interdum neque id nulla accumsan euismod. Curabitur sit amet ornare purus. Aliquam erat volutpat.', '2014-09-03 18:41:23', 'brand_design', 'services'),
  (18, 'Наши услуги', 'Услуги магазина "Электрика"', 'Розетки, лампочки, кабель', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae.<!--TabDelimiter-->Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione.<!--TabDelimiter-->Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore.<!--TabDelimiter-->Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? ', '2014-09-03 18:43:34', 'services', 'general');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `el_comments`
--
ALTER TABLE `el_comments`
ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`comments_article_id`) REFERENCES `el_news` (`id`);

--
-- Ограничения внешнего ключа таблицы `el_news2categories`
--
ALTER TABLE `el_news2categories`
ADD CONSTRAINT `el_news2categories_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `el_news` (`id`),
ADD CONSTRAINT `el_news2categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `el_categories` (`id`);
