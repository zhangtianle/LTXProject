/*
Navicat MySQL Data Transfer

Source Server         : datebase
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : ltx

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-12-02 18:54:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accessory`
-- ----------------------------

DROP TABLE IF EXISTS `accessory`;
CREATE TABLE `accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  
`accName` varchar(255) NOT NULL DEFAULT '' COMMENT '文件在服务器上的储存位置',
  
`articleId` int(11) DEFAULT NULL,
  
`fileName` varchar(255) NOT NULL DEFAULT '' COMMENT '上传文件原文件名称',
 
 `upLoadTime` date NOT NULL DEFAULT '0000-00-00' COMMENT '文件上传时间',
  
PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`),
  CONSTRAINT `accessory_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accessory
-- ----------------------------

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `articleTitle` varchar(255) NOT NULL,
  `articleType` varchar(255) NOT NULL,
  `articleContext` text NOT NULL,
  `articleAuthor` varchar(255) NOT NULL,
  `uploadTime` date DEFAULT NULL,
  `createTIme` date DEFAULT NULL,
  PRIMARY KEY (`articleId`),
  KEY `articleType` (`articleType`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`articleType`) REFERENCES `articletype` (`articleType`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'test1', '1', 'this is text', 'none', '2014-11-15', null);
INSERT INTO `article` VALUES ('2', 'test2', '15', 'this is text2', 'none', '2014-11-04', null);
INSERT INTO `article` VALUES ('3', 'text3', '16', 'this is text3', 'none', '2014-11-05', null);
INSERT INTO `article` VALUES ('4', 'text4', '17', 'this is text4', 'none', '2014-11-14', null);
INSERT INTO `article` VALUES ('5', 'text5', '18', 'this is text5', 'none', '2014-11-22', null);
INSERT INTO `article` VALUES ('6', 'text6', '19', 'this is text6', 'dhy', '2014-10-16', null);
INSERT INTO `article` VALUES ('7', 'article1', '20', 'test123kjsadfjkdafhjksdafhdahfkdsaf', 'aa', '2014-10-15', null);
INSERT INTO `article` VALUES ('8', 'atricle2', '20', 'articleType is 20', 'author20', '2014-11-12', null);
INSERT INTO `article` VALUES ('9', 'atricle3', '20', 'articleType is 20', 'author20', '2014-07-31', null);
INSERT INTO `article` VALUES ('10', 'atricle4', '20', 'articleType is 20', 'author20', '2014-09-11', null);
INSERT INTO `article` VALUES ('11', 'atricle5', '20', 'articleType is 20', 'author20', '2014-02-23', null);
INSERT INTO `article` VALUES ('12', 'atricle6', '20', 'articleType is 20', 'author20', '2014-05-16', null);
INSERT INTO `article` VALUES ('13', 'article7', '21', 'articleType is 21', 'author21', '2014-09-12', null);
INSERT INTO `article` VALUES ('14', 'article8', '21', 'articleType is 21', 'author21', '2014-08-31', null);
INSERT INTO `article` VALUES ('15', 'article9', '21', 'articleType is 21', 'author21', '2014-10-11', null);
INSERT INTO `article` VALUES ('16', 'article10', '21', 'articleType is 21', 'author21', '2014-03-23', null);
INSERT INTO `article` VALUES ('17', 'article11', '21', 'articleType is 21', 'author21', '2014-04-16', null);
INSERT INTO `article` VALUES ('18', 'article12', '22', 'articleType is 22', 'author22', '2014-02-12', null);
INSERT INTO `article` VALUES ('19', 'article13', '22', 'articleType is 22', 'author22', '2014-01-31', null);
INSERT INTO `article` VALUES ('20', 'article14', '22', 'articleType is 22', 'author22', '2014-11-11', null);
INSERT INTO `article` VALUES ('22', 'article15', '22', 'articleType is 22', 'author22', '2014-06-23', null);
INSERT INTO `article` VALUES ('23', 'article16', '22', 'articleType is 22', 'author22', '2014-03-16', null);
INSERT INTO `article` VALUES ('24', 'article17', '23', 'articleType is 23', 'author23', '2014-12-12', null);
INSERT INTO `article` VALUES ('25', 'article18', '23', 'articleType is 23', 'author23', '2014-05-31', null);
INSERT INTO `article` VALUES ('26', 'article19', '23', 'articleType is 23', 'author23', '2014-12-11', null);
INSERT INTO `article` VALUES ('27', 'article20', '23', 'articleType is 23', 'author23', '2014-09-23', null);
INSERT INTO `article` VALUES ('28', 'article21', '23', 'articleType is 23', 'author23', '2014-07-16', null);
INSERT INTO `article` VALUES ('29', 'article17', '24', 'articleType is 24', 'author24', '2014-12-12', null);
INSERT INTO `article` VALUES ('30', 'article18', '24', 'articleType is 24', 'author24', '2014-09-28', null);
INSERT INTO `article` VALUES ('31', 'article19', '24', 'articleType is 24', 'author24', '2014-12-11', null);
INSERT INTO `article` VALUES ('32', 'article20', '24', 'articleType is 24', 'author24', '2014-02-24', null);
INSERT INTO `article` VALUES ('33', 'article21', '24', 'articleType is 24', 'author24', '2014-10-16', null);
INSERT INTO `article` VALUES ('34', '红红火火', '25', 'articleType is 25', 'author25', '2014-10-12', null);
INSERT INTO `article` VALUES ('35', 'name1', '25', 'articleType is 25dafdsf', 'author25', '2014-06-28', null);
INSERT INTO `article` VALUES ('36', 'name2', '25', 'articleType is 25arwqrqwerq', 'author25', '2014-12-11', null);
INSERT INTO `article` VALUES ('37', '恍恍惚惚', '25', 'articleType is 25dfad', 'author25', '2014-02-25', null);
INSERT INTO `article` VALUES ('38', '呵呵呵呵', '25', 'articleType is 25fghdfhgfasd', 'author25', '2014-10-16', null);
INSERT INTO `article` VALUES ('39', '39', '20', '123123123', '123', '2014-11-25', null);
INSERT INTO `article` VALUES ('40', '40', '10', '123', '123', '2014-11-06', null);
INSERT INTO `article` VALUES ('41', '41', '10', '123', '123', '2014-11-07', null);
INSERT INTO `article` VALUES ('42', '42', '10', '123', '123', '2014-11-15', null);
INSERT INTO `article` VALUES ('43', '42', '10', '123', '123', '2014-11-27', null);
INSERT INTO `article` VALUES ('44', '44', '11', '123', '123', '2014-11-26', null);
INSERT INTO `article` VALUES ('45', '45', '11', '123', '123', '2014-11-26', null);
INSERT INTO `article` VALUES ('46', '46', '11', '123', '123', '2014-11-20', null);
INSERT INTO `article` VALUES ('47', '47', '11', '123', '123', '2014-11-28', null);
INSERT INTO `article` VALUES ('48', '48', '11', '123', '10', '2014-11-16', null);
INSERT INTO `article` VALUES ('49', '49', '11', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('50', '51', '12', '123', '10', '2014-11-30', null);
INSERT INTO `article` VALUES ('51', '52', '12', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('52', '53', '12', '123', '10', '2014-11-18', null);
INSERT INTO `article` VALUES ('53', '54', '12', '123', '10', '2014-11-17', null);
INSERT INTO `article` VALUES ('54', '55', '12', '123', '10', '2014-10-31', null);
INSERT INTO `article` VALUES ('55', '65', '12', '123', '10', '2014-11-19', null);
INSERT INTO `article` VALUES ('56', '76', '13', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('57', '77', '13', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('58', '88', '13', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('59', '333', '13', '123', '10', '2014-11-11', null);
INSERT INTO `article` VALUES ('60', '234', '13', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('61', '23432', '13', '123', '10', '2014-11-04', null);
INSERT INTO `article` VALUES ('62', '234234', '14', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('63', '1231232', '14', '123', '10', '2014-11-08', null);
INSERT INTO `article` VALUES ('64', '21141', '14', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('65', '1431', '14', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('66', '343', '14', '123', '10', '2014-11-22', null);
INSERT INTO `article` VALUES ('67', '12343', '14', '123', '10', '2014-11-18', null);
INSERT INTO `article` VALUES ('68', '1232', '14', '123', '10', '2014-11-15', null);
INSERT INTO `article` VALUES ('69', '4343', '12', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('70', '4323', '12', '123', '10', '2014-10-22', null);
INSERT INTO `article` VALUES ('71', '234532', '13', '123', '10', '2014-11-26', null);
INSERT INTO `article` VALUES ('72', '3242345', '14', '123', '10', '2014-11-16', null);

-- ----------------------------
-- Table structure for `articletype`
-- ----------------------------
DROP TABLE IF EXISTS `articletype`;
CREATE TABLE `articletype` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `articleType` varchar(255) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `parentType` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeId`),
  KEY `articleType` (`articleType`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articletype
-- ----------------------------
INSERT INTO `articletype` VALUES ('1', '1', '政策法规', null);
INSERT INTO `articletype` VALUES ('5', '2', '动态新闻', null);
INSERT INTO `articletype` VALUES ('6', '3', '党政工作', null);
INSERT INTO `articletype` VALUES ('7', '4', '关工委', null);
INSERT INTO `articletype` VALUES ('8', '5', '文体娱乐', null);
INSERT INTO `articletype` VALUES ('9', '6', '百家讲坛', null);
INSERT INTO `articletype` VALUES ('10', '7', '办事指南', null);
INSERT INTO `articletype` VALUES ('11', '8', '下载中心', null);
INSERT INTO `articletype` VALUES ('12', '9', '部门概况', null);
INSERT INTO `articletype` VALUES ('25', '10', '国家有关文件', '1');
INSERT INTO `articletype` VALUES ('26', '11', '重庆市有关文件', '1');
INSERT INTO `articletype` VALUES ('27', '12', '学校有关规定', '1');
INSERT INTO `articletype` VALUES ('28', '13', '工作计划', '2');
INSERT INTO `articletype` VALUES ('29', '14', '通知公告', '2');
INSERT INTO `articletype` VALUES ('30', '15', '专题报告', '2');
INSERT INTO `articletype` VALUES ('31', '16', '追忆堂', '2');
INSERT INTO `articletype` VALUES ('32', '17', '组织机构', '3');
INSERT INTO `articletype` VALUES ('33', '18', '党建动态', '3');
INSERT INTO `articletype` VALUES ('34', '19', '理论中心组', '3');
INSERT INTO `articletype` VALUES ('35', '20', '组织机构', '4');
INSERT INTO `articletype` VALUES ('36', '21', '文件汇编', '4');
INSERT INTO `articletype` VALUES ('37', '22', '工作动态', '4');
INSERT INTO `articletype` VALUES ('38', '23', '组织设置', '5');
INSERT INTO `articletype` VALUES ('39', '24', '工作动态', '5');
INSERT INTO `articletype` VALUES ('40', '25', '老年风采', '5');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`imgId`),
  KEY `articleId` (`articleId`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '111');
INSERT INTO `user` VALUES ('11', 'name', '123');
INSERT INTO `user` VALUES ('19', 'name2', '123');
INSERT INTO `user` VALUES ('28', 'qweå', 'qwe');
