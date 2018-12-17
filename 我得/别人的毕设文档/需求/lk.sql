/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : lk

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2017-12-02 16:38:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attendence
-- ----------------------------
DROP TABLE IF EXISTS `attendence`;
CREATE TABLE `attendence` (
  `StudentId` varchar(20) NOT NULL default '',
  `WorkerId` varchar(20) NOT NULL default '',
  `CourseId` varchar(20) NOT NULL default '',
  `OutAttendence` varchar(20) NOT NULL,
  PRIMARY KEY  (`StudentId`,`WorkerId`,`CourseId`),
  KEY `WorkerId` (`WorkerId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `attendence_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  CONSTRAINT `attendence_ibfk_2` FOREIGN KEY (`WorkerId`) REFERENCES `worker` (`WorkerId`),
  CONSTRAINT `attendence_ibfk_3` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendence
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `ClassId` varchar(20) NOT NULL,
  `presonNumber` int(10) default NULL,
  PRIMARY KEY  (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseId` varchar(20) NOT NULL,
  `CourseName` varchar(20) default NULL,
  `Time` varchar(20) default NULL,
  `Place` varchar(20) default NULL,
  PRIMARY KEY  (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for selectclass
-- ----------------------------
DROP TABLE IF EXISTS `selectclass`;
CREATE TABLE `selectclass` (
  `StudentId` varchar(20) NOT NULL default '',
  `CourseId` varchar(20) NOT NULL default '',
  `Score` int(10) default NULL,
  `taskComplete` char(100) NOT NULL,
  PRIMARY KEY  (`StudentId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `selectclass_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  CONSTRAINT `selectclass_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of selectclass
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StudentId` varchar(20) NOT NULL,
  `StudentName` varchar(20) default NULL,
  `StudentSex` varchar(20) default NULL,
  `age` int(10) default NULL,
  `ClassId` varchar(20) default NULL,
  PRIMARY KEY  (`StudentId`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `class` (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teaching
-- ----------------------------
DROP TABLE IF EXISTS `teaching`;
CREATE TABLE `teaching` (
  `WorkerId` varchar(20) NOT NULL default '',
  `CourseId` varchar(20) NOT NULL default '',
  `task` char(100) default NULL,
  PRIMARY KEY  (`WorkerId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`WorkerId`) REFERENCES `worker` (`WorkerId`),
  CONSTRAINT `teaching_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teaching
-- ----------------------------

-- ----------------------------
-- Table structure for teachingsuggest
-- ----------------------------
DROP TABLE IF EXISTS `teachingsuggest`;
CREATE TABLE `teachingsuggest` (
  `StudentId` varchar(20) NOT NULL default '',
  `WorKerId` varchar(20) NOT NULL default '',
  `Suggest` char(100) default NULL,
  `reply` char(100) default NULL,
  PRIMARY KEY  (`StudentId`,`WorKerId`),
  KEY `WorKerId` (`WorKerId`),
  CONSTRAINT `teachingsuggest_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  CONSTRAINT `teachingsuggest_ibfk_2` FOREIGN KEY (`WorKerId`) REFERENCES `worker` (`WorkerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teachingsuggest
-- ----------------------------

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `WorkerId` varchar(20) NOT NULL,
  `workerName` varchar(20) default NULL,
  `sex` varchar(20) default NULL,
  `age` int(10) default NULL,
  `ClassId` varchar(20) default NULL,
  `position` varchar(20) default NULL,
  PRIMARY KEY  (`WorkerId`),
  KEY `ClassId` (`ClassId`),
  CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `class` (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of worker
-- ----------------------------
