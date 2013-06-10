-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 06 月 10 日 03:36
-- 服务器版本: 5.5.30-log
-- PHP 版本: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `witower`
--
CREATE DATABASE `witower` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `witower`;

-- --------------------------------------------------------

--
-- 表的结构 `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `company`
--

INSERT INTO `company` (`id`, `description`) VALUES
(1, ''),
(2, '');

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `item`, `value`) VALUES
(1, 'recommended_project', '1');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`company`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `name`, `company`) VALUES
(1, '雪碧', 3),
(2, 'Air系列运动鞋', 1);

-- --------------------------------------------------------

--
-- 表的结构 `product_tag`
--

CREATE TABLE IF NOT EXISTS `product_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `product_tag`
--

INSERT INTO `product_tag` (`id`, `product`, `tag`) VALUES
(3, 2, 2),
(4, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `bonus` decimal(10,2) NOT NULL,
  `company` int(11) NOT NULL,
  `participants` int(11) NOT NULL DEFAULT '0',
  `favorites` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`),
  KEY `user` (`company`),
  KEY `product` (`product`),
  KEY `users` (`participants`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `product`, `name`, `summary`, `date_start`, `date_end`, `bonus`, `company`, `participants`, `favorites`) VALUES
(1, 2, 'NikeAir运动鞋春季校园推广', 'Nike公司计划在2014年春季推出Air Max 2014款运动鞋', '2013-01-01', '2013-12-31', '5000.00', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `project_tag`
--

CREATE TABLE IF NOT EXISTS `project_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project` (`project`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `project_tag`
--

INSERT INTO `project_tag` (`id`, `project`, `tag`) VALUES
(1, 1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, '运动'),
(2, '服饰'),
(4, '校园');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `password` (`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`) VALUES
(1, 'Nike', '123', 'market@nike.com'),
(2, 'Adidas', '123', 'market@adidas.com'),
(3, '可口可乐', '123', 'market@cococola.com'),
(5, 'uicestone', '123', 'uicestone@gmail.com');

-- --------------------------------------------------------

--
-- 表的结构 `user_bonus`
--

CREATE TABLE IF NOT EXISTS `user_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `bonus` decimal(10,2) NOT NULL,
  `project` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `project` (`project`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_config`
--

CREATE TABLE IF NOT EXISTS `user_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `item` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_favorite_project`
--

CREATE TABLE IF NOT EXISTS `user_favorite_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `project` (`project`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user_favorite_project`
--

INSERT INTO `user_favorite_project` (`id`, `user`, `project`) VALUES
(1, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user_follow`
--

CREATE TABLE IF NOT EXISTS `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idol` int(11) NOT NULL,
  `fan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idol` (`idol`),
  KEY `fan` (`fan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user_follow`
--

INSERT INTO `user_follow` (`id`, `idol`, `fan`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- 表的结构 `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_score`
--

CREATE TABLE IF NOT EXISTS `user_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `votes` int(11) NOT NULL,
  `score_wit` decimal(10,2) NOT NULL,
  `score_company` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `project` (`project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_status`
--

CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user_status_comment`
--

CREATE TABLE IF NOT EXISTS `user_status_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `user` (`user`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wit` int(11) NOT NULL,
  `content` text NOT NULL,
  `score_wit` int(11) NOT NULL,
  `score_company` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `time` (`time`),
  KEY `wit` (`wit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `version`
--

INSERT INTO `version` (`id`, `wit`, `content`, `score_wit`, `score_company`, `user`, `time`) VALUES
(1, 1, '这是一段文案', 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `version_comment`
--

CREATE TABLE IF NOT EXISTS `version_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version` (`version`),
  KEY `user` (`user`),
  KEY `time` (`time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `version_comment`
--

INSERT INTO `version_comment` (`id`, `version`, `content`, `user`, `time`) VALUES
(1, 1, '这个不错！', 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wit`
--

CREATE TABLE IF NOT EXISTS `wit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `project` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project` (`project`),
  KEY `user` (`user`),
  KEY `time` (`time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wit`
--

INSERT INTO `wit` (`id`, `name`, `content`, `project`, `user`, `time`, `selected`) VALUES
(1, '文案标题1', '这是一段文案', 1, 5, 0, 0);

--
-- 限制导出的表
--

--
-- 限制表 `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`company`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_tag_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_3` FOREIGN KEY (`company`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `project_tag`
--
ALTER TABLE `project_tag`
  ADD CONSTRAINT `project_tag_ibfk_1` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_tag_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_bonus`
--
ALTER TABLE `user_bonus`
  ADD CONSTRAINT `user_bonus_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_bonus_ibfk_2` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_config`
--
ALTER TABLE `user_config`
  ADD CONSTRAINT `user_config_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_favorite_project`
--
ALTER TABLE `user_favorite_project`
  ADD CONSTRAINT `user_favorite_project_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_favorite_project_ibfk_2` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `user_follow_ibfk_1` FOREIGN KEY (`idol`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_follow_ibfk_2` FOREIGN KEY (`fan`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_score`
--
ALTER TABLE `user_score`
  ADD CONSTRAINT `user_score_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_score_ibfk_2` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_status`
--
ALTER TABLE `user_status`
  ADD CONSTRAINT `user_status_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `user_status_comment`
--
ALTER TABLE `user_status_comment`
  ADD CONSTRAINT `user_status_comment_ibfk_1` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_status_comment_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`wit`) REFERENCES `wit` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `version_comment`
--
ALTER TABLE `version_comment`
  ADD CONSTRAINT `version_comment_ibfk_1` FOREIGN KEY (`version`) REFERENCES `version` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `version_comment_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `wit`
--
ALTER TABLE `wit`
  ADD CONSTRAINT `wit_ibfk_1` FOREIGN KEY (`project`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `wit_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;