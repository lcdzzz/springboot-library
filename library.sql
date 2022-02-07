/*
Navicat MySQL Data Transfer

Source Server         : 8.142.93.194
Source Server Version : 50736
Source Host           : 8.142.93.194:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50736
File Encoding         : 65001

Date: 2022-02-07 12:35:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `BID_UNIQUE` (`book_id`),
  KEY `op2_idx` (`operator`),
  KEY `bo_idx` (`ISBN`),
  CONSTRAINT `bo` FOREIGN KEY (`ISBN`) REFERENCES `booklist` (`ISBN`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `op2` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3320 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('151', '0000000000001', '流通室', '2', '6');
INSERT INTO `book` VALUES ('152', '0000000000001', '流通室', '2', '6');
INSERT INTO `book` VALUES ('153', '0000000000001', '流通室', '0', '6');
INSERT INTO `book` VALUES ('154', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('155', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('156', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('157', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('158', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('159', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('160', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('161', '9787100000000', '流通室', '0', '6');
INSERT INTO `book` VALUES ('162', '9787111421900', '流通室', '0', '6');
INSERT INTO `book` VALUES ('163', '9787111421900', '流通室', '0', '6');
INSERT INTO `book` VALUES ('164', '9787115417305', '流通室', '0', '6');
INSERT INTO `book` VALUES ('165', '9787115417305', '流通室', '0', '6');
INSERT INTO `book` VALUES ('166', '9787115417305', '流通室', '0', '6');
INSERT INTO `book` VALUES ('167', '9787115417305', '流通室', '0', '6');
INSERT INTO `book` VALUES ('168', '9787115417305', '流通室', '0', '6');
INSERT INTO `book` VALUES ('169', '9787115417305', '流通室', '0', '6');
INSERT INTO `book` VALUES ('170', '9787121254437', '流通室', '0', '6');
INSERT INTO `book` VALUES ('171', '9787121254437', '流通室', '0', '6');
INSERT INTO `book` VALUES ('172', '9787121254437', '流通室', '0', '6');
INSERT INTO `book` VALUES ('173', '9787121254437', '流通室', '0', '6');
INSERT INTO `book` VALUES ('174', '9787121254437', '流通室', '0', '6');
INSERT INTO `book` VALUES ('175', '9787121254437', '流通室', '0', '6');
INSERT INTO `book` VALUES ('176', '1234567891011', '图书流通室', '0', '6');
INSERT INTO `book` VALUES ('177', '1234567891011', '图书流通室', '0', '6');
INSERT INTO `book` VALUES ('178', '1234567891011', '图书流通室', '0', '6');
INSERT INTO `book` VALUES ('3303', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3304', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3305', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3306', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3307', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3308', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3309', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3310', '7777777777777', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3314', '6666666666666', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3315', '6666666666666', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3316', '6666666666666', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3317', '6666666666666', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3318', '6666666666666', '图书流通室', '0', '5');
INSERT INTO `book` VALUES ('3319', '6666666666666', '图书流通室', '0', '5');

-- ----------------------------
-- Table structure for `booklist`
-- ----------------------------
DROP TABLE IF EXISTS `booklist`;
CREATE TABLE `booklist` (
  `ISBN` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `writer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptime` date DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL,
  `is_popular` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `op_idx` (`operator`),
  CONSTRAINT `op` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of booklist
-- ----------------------------
INSERT INTO `booklist` VALUES ('0000000000001', 'SQL必知必会', '芳文社', '陈之豪', '2018-05-20', '3', '6', '0');
INSERT INTO `booklist` VALUES ('1234567891011', '1234567891011', '1234567891', '1234567891', '2019-06-01', '3', '6', '0');
INSERT INTO `booklist` VALUES ('6666666666666', '6666666666666', '6666666666', '6666666666', '2016-06-06', '6', '5', '0');
INSERT INTO `booklist` VALUES ('7777777777777', '7777777777777', '7777777777', '7777777777', '2021-12-20', '8', '5', '0');
INSERT INTO `booklist` VALUES ('9787100000000', 'Qian\'s C Compiler——The speed of the art', '路边社', '钱晨', '2018-05-14', '8', '6', '0');
INSERT INTO `booklist` VALUES ('9787111421900', '深入理解Java虚拟机', '机械工业出版社', '周志明', '2013-06-01', '2', '6', '1');
INSERT INTO `booklist` VALUES ('9787115417305', 'spring实战', '人民邮电出版社', 'Adrian Mouat', '2017-04-01', '6', '6', '1');
INSERT INTO `booklist` VALUES ('9787121254437', '集体智慧编程', '人民邮电出版社', 'Toby Segaran', '2015-03-01', '6', '6', '0');

-- ----------------------------
-- Table structure for `borrow`
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `btime` datetime NOT NULL COMMENT '借阅时间',
  `deadline` datetime NOT NULL COMMENT '截止时间',
  `rtime` datetime DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  UNIQUE KEY `BWID_UNIQUE` (`borrow_id`),
  KEY `boo_idx` (`book_id`),
  KEY `re_idx` (`user_id`),
  KEY `op3_idx` (`operator`),
  CONSTRAINT `boo` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `op3` FOREIGN KEY (`operator`) REFERENCES `manager` (`manager_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re` FOREIGN KEY (`user_id`) REFERENCES `reader` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('80', '163', '26', '2021-12-19 16:42:29', '2022-01-05 16:42:34', '2021-12-21 02:43:55', '6');
INSERT INTO `borrow` VALUES ('89', '162', '26', '2018-05-31 10:32:13', '2018-07-30 10:32:13', '2018-05-31 10:32:19', '6');
INSERT INTO `borrow` VALUES ('90', '164', '26', '2021-12-20 02:47:18', '2021-12-26 02:47:25', '2021-12-20 03:00:00', '6');
INSERT INTO `borrow` VALUES ('91', '165', '26', '2021-12-20 03:00:57', '2021-12-26 03:01:00', '2021-12-20 03:01:11', '6');
INSERT INTO `borrow` VALUES ('92', '151', '26', '2021-12-20 16:04:31', '2022-02-18 16:04:31', '2021-12-20 16:21:46', '5');
INSERT INTO `borrow` VALUES ('93', '151', '26', '2021-12-20 16:07:27', '2022-02-18 16:07:27', '2021-12-20 16:21:46', '5');
INSERT INTO `borrow` VALUES ('101', '152', '26', '2021-12-20 16:10:41', '2022-02-18 16:10:41', '2021-12-20 16:19:42', '5');
INSERT INTO `borrow` VALUES ('102', '152', '26', '2021-12-20 16:14:34', '2022-02-18 16:14:34', '2021-12-20 16:19:42', '5');
INSERT INTO `borrow` VALUES ('103', '151', '26', '2021-12-20 16:21:29', '2022-02-18 16:21:29', '2021-12-20 16:21:46', '5');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `pass_wd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `mname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `MID_UNIQUE` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('5', '123456', 'admin_zhangsan');
INSERT INTO `manager` VALUES ('6', '123456', 'admin_lisi');
INSERT INTO `manager` VALUES ('7', '123456', 'admin_wangwu');

-- ----------------------------
-- Table structure for `reader`
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pass_wd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `rname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `RID_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('26', 'zdcl_reader', '123', '周典成隆', '19857446629', '1473220685@qq.com');
INSERT INTO `reader` VALUES ('27', 'cwd_reader', '123456', '曹伟栋', '19857446628', '184446086@qq.com');

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  UNIQUE KEY `REID_UNIQUE` (`reservation_id`),
  UNIQUE KEY `BID_UNIQUE` (`book_id`),
  KEY `re2_idx` (`user_id`),
  KEY `book_idx` (`book_id`),
  CONSTRAINT `book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `re2` FOREIGN KEY (`user_id`) REFERENCES `reader` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('1001', '26', '153', '2022-01-01 23:56:58');

-- ----------------------------
-- Table structure for `reservation_arrived`
-- ----------------------------
DROP TABLE IF EXISTS `reservation_arrived`;
CREATE TABLE `reservation_arrived` (
  `reservation_arrived_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`reservation_arrived_id`),
  KEY `res_id_fk_idx` (`reservation_id`),
  CONSTRAINT `res_id_fk` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reservation_arrived
-- ----------------------------

-- ----------------------------
-- View structure for `arrive_reminder`
-- ----------------------------
DROP VIEW IF EXISTS `arrive_reminder`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `arrive_reminder` AS select `reader`.`user_name` AS `user_name`,`booklist`.`bname` AS `bname`,`reader`.`email` AS `email` from ((((`reservation_arrived` join `reservation`) join `reader`) join `book`) join `booklist`) where ((`reservation_arrived`.`reservation_id` = `reservation`.`reservation_id`) and (`reservation`.`user_id` = `reader`.`user_id`) and (`reservation`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`)) ;

-- ----------------------------
-- View structure for `borrow_detail`
-- ----------------------------
DROP VIEW IF EXISTS `borrow_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrow_detail` AS select `borrow`.`book_id` AS `borrow_id`,`borrow`.`btime` AS `btime`,`borrow`.`rtime` AS `rtime`,`borrow`.`deadline` AS `deadline`,`borrow`.`book_id` AS `book_id`,`booklist`.`bname` AS `bname`,`reader`.`user_id` AS `user_id`,`reader`.`user_name` AS `user_name` from (((`borrow` join `reader`) join `book`) join `booklist`) where ((`reader`.`user_id` = `borrow`.`user_id`) and (`borrow`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`)) ;

-- ----------------------------
-- View structure for `reservation_detail`
-- ----------------------------
DROP VIEW IF EXISTS `reservation_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `reservation_detail` AS select `reader`.`user_id` AS `user_id`,`reader`.`user_name` AS `user_name`,`reservation`.`reservation_id` AS `reservation_id`,`book`.`book_id` AS `book_id`,`booklist`.`bname` AS `bname`,`reservation`.`deadline` AS `deadline` from (((`booklist` join `book`) join `reader`) join `reservation`) where ((`reservation`.`user_id` = `reader`.`user_id`) and (`reservation`.`book_id` = `book`.`book_id`) and (`book`.`ISBN` = `booklist`.`ISBN`)) ;

-- ----------------------------
-- Procedure structure for `new_book`
-- ----------------------------
DROP PROCEDURE IF EXISTS `new_book`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `new_book`(IN ISBN varchar(30),IN bname varchar(45), IN publisher varchar(45), IN writer varchar(45), IN ptime date, IN num int, IN operator int,IN location varchar(45),IN state int)
BEGIN
	DECLARE i int;
	declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
	insert into booklist(ISBN,bname, publisher, writer, ptime, number, operator)values (ISBN, bname, publisher, writer, ptime, num, operator);
	SET i=0;
	while i<num DO
		insert into book(ISBN,location,state,operator) values(ISBN,location,state,operator);
		SET i=i+1;
	end while;
    
    if t_error=1 then
		rollback;
	else
		commit;
	end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `return_book`
-- ----------------------------
DROP PROCEDURE IF EXISTS `return_book`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `return_book`(in bor_id int)
BEGIN
	declare num int;
    declare bid int;
	declare n int;
    declare resid int;
    declare t_error integer default 0;
    declare continue handler for sqlexception set t_error=1;
    start transaction;
    
    select count(*) into n from borrow where borrow_id=bor_id and rtime is null;
    if n > 0 then
		select book_id into bid from borrow where borrow_id=bor_id;
		select count(*) into num from reservation where book_id=bid;
		if num > 0 then
			update borrow set rtime=NOW() where borrow_id=bor_id;
			update book set state=1 where book_id=bid;
            update reservation set deadline=NOW() where book_id=bid;
            select reservation_id into resid from reservation where book_id=bid;
            insert into reservation_arrived (reservation_id) values (resid);
		else
			update borrow set rtime=NOW() where borrow_id=bor_id;
			update book set state=0 where book_id=bid;
		end if;
	end if;
    
    if t_error=1 then
		rollback;
	else
		commit;
	end if;
END
;;
DELIMITER ;
