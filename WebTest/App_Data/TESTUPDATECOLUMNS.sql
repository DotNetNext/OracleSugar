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

Date: 2016-09-14 02:26:51
*/


-- ----------------------------
-- Table structure for TESTUPDATECOLUMNS
-- ----------------------------
DROP TABLE "SYSTEM"."TESTUPDATECOLUMNS";
CREATE TABLE "SYSTEM"."TESTUPDATECOLUMNS" (
"VGUID" VARCHAR2(255 BYTE) NOT NULL ,
"IDENTITYFIELD" NUMBER(9) NULL ,
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
INSERT INTO "SYSTEM"."TESTUPDATECOLUMNS" VALUES ('542b5a27-6984-47c7-a8ee-359e483c8470', '0', 'xx', 'xx2', TO_DATE('2016-09-23 22:22:27', 'YYYY-MM-DD HH24:MI:SS'));

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
