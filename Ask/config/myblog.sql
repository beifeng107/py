# Host: localhost  (Version: 5.5.5-10.1.9-MariaDB)
# Date: 2017-04-14 18:29:43
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "blog_tb"
#

DROP TABLE IF EXISTS `blog_tb`;
CREATE TABLE `blog_tb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "blog_tb"
#

INSERT INTO `blog_tb` VALUES (1,'python下的MySQLdb使用','下载安装MySQLdb\r\nlinux版本\r\nhttp://sourceforge.net/projects/mysql-python/ 下载，在安装是要先安装setuptools，然后在下载文件目录下，修改mysite.cfg,指定本地mysql的mysql-config文件的路径\r\nwindows版本\r\n网上搜索到一个http://www.technicalbard.com/files/MySQL-python-1.2.2.win32-py2.6.exe\r\n安装后import MySQLdb会出现 DeprecationWarning: the sets module is deprecated 这样一个警告，google之\r\n原因是2.6不知sets这个模块，不过已经添加了set内置函数。找到MySQLdb文件夹的中__init__.py,注释掉from sets import ImmutableSet   class DBAPISet(ImmutableSet):添加class DBAPISet(frozenset):；找到converters.py注释掉from sets import BaseSet, Set。然后修改第45行和129行中的Set为set。\r\n搞定。');

#
# Structure for table "questions_tb"
#

DROP TABLE IF EXISTS `questions_tb`;
CREATE TABLE `questions_tb` (
  `Id` char(14) NOT NULL DEFAULT '00000000000000',
  `type` char(1) NOT NULL DEFAULT '0',
  `description` varchar(500) DEFAULT '',
  `options` text,
  `right_anwser` varchar(10) DEFAULT NULL,
  `explanation` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "questions_tb"
#

INSERT INTO `questions_tb` VALUES ('20170405172319','0','尿急尿频怎么办？','A.上厕所|B.憋着|C.尿尿','B','憋死你'),('20170405172430','1','狗日的什么鬼','No option','yes','就是贵啊'),('20170406144130','1',' 怎么回事呢','No option','no','到底怎么回事呢'),('20170406144501','1','太阳从洗不出来','No option','no','西边出来'),('20170406144918','0','当你走在路上的时候，突然看到一个女孩低头走过，你觉得她遇上了什么事？','A.失恋了|B.卖东西忘带钱包|C.众目下摔了一跤|D.被风吹起了裙子','C','额米有原因'),('20170406150724','1','按时到岗·','No option','no','阿迪嘎嘎·'),('20170406150910','0','下列人物中绰号叫做九纹龙的是','A.柴进|B.史进|C.解珍|D.燕青','B','俺也不知道'),('20170406151130','0','有两个人掉到陷阱里了,死的人叫死人,活人叫什么?','A.活人|B.救命|C.你妈蛋','B','救命啊。。。。哈哈'),('20170406151309','0','上课的时候，谁最先被叫起来背书？','A.小猫B.|小狗|C.小鸡','B','旺旺仙贝（汪汪先背）'),('20170406151451','1','玫瑰花最没力？','No option','yes','好一朵美丽(没力)的茉莉花。'),('20170406151545','0','猩猩最讨厌什么线？','A.平行线|B.相交线|C.直线|D.横线 ','A','平行线没有相交(香蕉)。 '),('20170406154217','1','在同一个圆里 半径的数量是直径的一半。','No option','no','半径和直径都有无数条,无法比 ');

#
# Structure for table "sq_r_tb"
#

DROP TABLE IF EXISTS `sq_r_tb`;
CREATE TABLE `sq_r_tb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `question_id` char(14) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "sq_r_tb"
#

INSERT INTO `sq_r_tb` VALUES (2,0,'20170405172430'),(3,0,'20170406144130'),(4,0,'20170406144501'),(5,0,'20170406144918'),(6,1,'20170406150724'),(7,2,'20170406150910'),(8,1,'20170406151130'),(9,1,'20170406151309'),(10,1,'20170406151451'),(11,1,'20170406151545'),(12,1,'20170406154217');

#
# Structure for table "subject_tb"
#

DROP TABLE IF EXISTS `subject_tb`;
CREATE TABLE `subject_tb` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "subject_tb"
#

INSERT INTO `subject_tb` VALUES (1,'my test'),(2,'test aggine');
