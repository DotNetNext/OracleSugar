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

Date: 2016-09-14 02:25:04
*/


-- ----------------------------
-- Table structure for AREA
-- ----------------------------
DROP TABLE "SYSTEM"."AREA";
CREATE TABLE "SYSTEM"."AREA" (
"ID" NUMBER(9) NOT NULL ,
"NAME" VARCHAR2(255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of AREA
-- ----------------------------
INSERT INTO "SYSTEM"."AREA" VALUES ('1', '北京');
INSERT INTO "SYSTEM"."AREA" VALUES ('2', '上海');
INSERT INTO "SYSTEM"."AREA" VALUES ('3', '南通');

-- ----------------------------
-- Indexes structure for table AREA
-- ----------------------------

-- ----------------------------
-- Checks structure for table AREA
-- ----------------------------
ALTER TABLE "SYSTEM"."AREA" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table AREA
-- ----------------------------
ALTER TABLE "SYSTEM"."AREA" ADD PRIMARY KEY ("ID");
