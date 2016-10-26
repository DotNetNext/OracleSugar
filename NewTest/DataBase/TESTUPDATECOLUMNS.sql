/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.4.0

Source Server         : oracle
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : SYSTEM

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2016-10-27 04:21:23
*/


-- ----------------------------
-- Table structure for TESTUPDATECOLUMNS
-- ----------------------------
DROP TABLE "SYSTEM"."TESTUPDATECOLUMNS";
CREATE TABLE "SYSTEM"."TESTUPDATECOLUMNS" (
"VGUID" VARCHAR2(50 BYTE) NOT NULL ,
"IDENTITYFIELD" VARCHAR2(255 BYTE) NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"NAME2" VARCHAR2(255 BYTE) NULL ,
"CREATETIME" DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of TESTUPDATECOLUMNS
-- ----------------------------

-- ----------------------------
-- Indexes structure for table TESTUPDATECOLUMNS
-- ----------------------------

-- ----------------------------
-- Checks structure for table TESTUPDATECOLUMNS
-- ----------------------------
ALTER TABLE "SYSTEM"."TESTUPDATECOLUMNS" ADD CHECK ("VGUID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table TESTUPDATECOLUMNS
-- ----------------------------
ALTER TABLE "SYSTEM"."TESTUPDATECOLUMNS" ADD PRIMARY KEY ("VGUID");
