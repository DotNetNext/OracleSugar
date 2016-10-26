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

Date: 2016-10-27 04:21:53
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
"TXT" VARCHAR2(1255 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of INSERTTEST
-- ----------------------------
INSERT INTO "SYSTEM"."INSERTTEST" VALUES ('1', '131', '13', '13', '312', TO_DATE('2016-10-12 02:33:26', 'YYYY-MM-DD HH24:MI:SS'), '21312');

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
