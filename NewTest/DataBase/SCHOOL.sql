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

Date: 2016-10-27 04:23:07
*/


-- ----------------------------
-- Table structure for SCHOOL
-- ----------------------------
DROP TABLE "SYSTEM"."SCHOOL";
CREATE TABLE "SYSTEM"."SCHOOL" (
"ID" NUMBER(9) NOT NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"AREAID" NUMBER(9) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SCHOOL
-- ----------------------------
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('1', '蓝翔2', '1');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('2', '蓝翔2', '2');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('3', '蓝翔2', '3');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('4', '黑马', '2');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('5', '幼儿园', '3');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('6', '蓝翔', '1');

-- ----------------------------
-- Indexes structure for table SCHOOL
-- ----------------------------

-- ----------------------------
-- Checks structure for table SCHOOL
-- ----------------------------
ALTER TABLE "SYSTEM"."SCHOOL" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SCHOOL
-- ----------------------------
ALTER TABLE "SYSTEM"."SCHOOL" ADD PRIMARY KEY ("ID");
