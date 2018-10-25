/*
Navicat MySQL Data Transfer

Source Server         : 192.168.105.3
Source Server Version : 50524
Source Host           : 192.168.105.3:3306
Source Database       : mediacluster

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2018-10-19 10:52:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bpmtask`
-- ----------------------------
DROP TABLE IF EXISTS `bpmtask`;
CREATE TABLE `bpmtask` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`uuid`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`state`  bit(1) NOT NULL ,
`pluginName`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`result`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`updateTime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`),
INDEX `Index_state` (`state`, `pluginName`) USING BTREE ,
INDEX `Index_uuid` (`uuid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`uuid`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`worker`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`params`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`status`  smallint(4) NOT NULL DEFAULT 0 COMMENT '\"1\"为等待，“2”为处理中，“4”为完成，“3”为失败' ,
`progress`  float(4,2) NOT NULL DEFAULT 0.00 ,
`priority`  int(11) NOT NULL DEFAULT 99 ,
`createTime`  datetime NULL DEFAULT NULL ,
`scheduleTime`  datetime NULL DEFAULT NULL ,
`info`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'worker信息' ,
`startTime`  datetime NULL DEFAULT NULL ,
`endTime`  datetime NULL DEFAULT NULL ,
`callback`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调地址' ,
`workshopId`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' ,
`result`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`updateTime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`taskName`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`templates`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `Index_handout` (`status`, `scheduleTime`, `priority`) USING BTREE ,
INDEX `uuid` (`uuid`) USING BTREE ,
INDEX `Index_endTime` (`endTime`) USING BTREE ,
INDEX `Index_status` (`status`, `workshopId`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3579663

;

-- ----------------------------
-- Table structure for `template`
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL ,
`desc`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`brief`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`ext`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`disable`  bit(1) NOT NULL ,
PRIMARY KEY (`name`, `type`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
`type`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`alias`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`type`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `warning`
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`workshopId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`updateTime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`createTime`  datetime NULL DEFAULT NULL ,
`level`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`),
INDEX `createTime` (`createTime`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=91518591

;

-- ----------------------------
-- Table structure for `workshopinfo`
-- ----------------------------
DROP TABLE IF EXISTS `workshopinfo`;
CREATE TABLE `workshopinfo` (
`id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`workshopName`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ip`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`acceptWorkers`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  int(11) NOT NULL DEFAULT 0 ,
`updateTime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Auto increment value for `bpmtask`
-- ----------------------------
ALTER TABLE `bpmtask` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `task`
-- ----------------------------
ALTER TABLE `task` AUTO_INCREMENT=3579663;

-- ----------------------------
-- Auto increment value for `warning`
-- ----------------------------
ALTER TABLE `warning` AUTO_INCREMENT=91518591;
