# Host: localhost  (Version: 5.5.5-10.1.9-MariaDB)
# Date: 2017-03-15 18:13:16
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "questions_tb"
#

DROP TABLE IF EXISTS `questions_tb`;
CREATE TABLE `questions_tb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` bit(1) NOT NULL DEFAULT b'0',
  `description` varchar(500) DEFAULT '',
  `options` text,
  `right_anwser` varchar(10) DEFAULT NULL,
  `explanation` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "sq_r_tb"
#

DROP TABLE IF EXISTS `sq_r_tb`;
CREATE TABLE `sq_r_tb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "subject_tb"
#

DROP TABLE IF EXISTS `subject_tb`;
CREATE TABLE `subject_tb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
