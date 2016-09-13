/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.4.0

Source Server         : ora
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : SYSTEM

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2016-09-14 02:25:47
*/


-- ----------------------------
-- Table structure for INSERTTEST
-- ----------------------------
DROP TABLE "SYSTEM"."INSERTTEST";
CREATE TABLE "SYSTEM"."INSERTTEST" (
"ID" NUMBER(9) NOT NULL ,
"V1" VARCHAR2(255 BYTE) NULL ,
"V2" VARCHAR2(255 BYTE) NULL ,
"V3" VARCHAR2(255 BYTE) NULL ,
"INT1" NUMBER(9) NULL ,
"D1" DATE NULL ,
"TXT" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of INSERTTEST
-- ----------------------------

-- ----------------------------
-- Indexes structure for table INSERTTEST
-- ----------------------------

-- ----------------------------
-- Checks structure for table INSERTTEST
-- ----------------------------
ALTER TABLE "SYSTEM"."INSERTTEST" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table INSERTTEST
-- ----------------------------
ALTER TABLE "SYSTEM"."INSERTTEST" ADD PRIMARY KEY ("ID");
