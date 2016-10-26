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

Date: 2016-10-27 04:21:38
*/


-- ----------------------------
-- Table structure for SUBJECT
-- ----------------------------
DROP TABLE "SYSTEM"."SUBJECT";
CREATE TABLE "SYSTEM"."SUBJECT" (
"ID" NUMBER(9) NOT NULL ,
"NAME" VARCHAR2(255 BYTE) NULL ,
"STUDENTID" NUMBER(9) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of SUBJECT
-- ----------------------------
INSERT INTO "SYSTEM"."SUBJECT" VALUES ('1', '语文', '1');
INSERT INTO "SYSTEM"."SUBJECT" VALUES ('2', '数学', '2');
INSERT INTO "SYSTEM"."SUBJECT" VALUES ('3', '.NET', '4');
INSERT INTO "SYSTEM"."SUBJECT" VALUES ('4', 'JAVA', '5');
INSERT INTO "SYSTEM"."SUBJECT" VALUES ('5', 'IOS', '6');
INSERT INTO "SYSTEM"."SUBJECT" VALUES ('6', 'PHP', '7');

-- ----------------------------
-- Indexes structure for table SUBJECT
-- ----------------------------

-- ----------------------------
-- Checks structure for table SUBJECT
-- ----------------------------
ALTER TABLE "SYSTEM"."SUBJECT" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SUBJECT
-- ----------------------------
ALTER TABLE "SYSTEM"."SUBJECT" ADD PRIMARY KEY ("ID");
