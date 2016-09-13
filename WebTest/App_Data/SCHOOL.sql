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

Date: 2016-09-14 02:26:15
*/


-- ----------------------------
-- Table structure for SCHOOL
-- ----------------------------
DROP TABLE "SYSTEM"."SCHOOL";
CREATE TABLE "SYSTEM"."SCHOOL" (
"ID" NUMBER(9) NOT NULL ,
"NAME" VARCHAR2(200 BYTE) NULL ,
"AREAID" NUMBER(9) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SCHOOL
-- ----------------------------
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('1', '北大青鸟', '1');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('2', 'IT清华', '2');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('3', '全智', '3');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('4', '幼儿全', '1');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('5', '蓝shift', '2');
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('6', '11', null);
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('7', '1231', null);
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('8', '31', null);
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('9', '12312', null);
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('0', 'ch-402016-09-13', null);
INSERT INTO "SYSTEM"."SCHOOL" VALUES ('91', 'ch-62016-09-13', null);

-- ----------------------------
-- Indexes structure for table SCHOOL
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table SCHOOL
-- ----------------------------
ALTER TABLE "SYSTEM"."SCHOOL" ADD PRIMARY KEY ("ID");
