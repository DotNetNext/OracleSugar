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

Date: 2016-09-14 02:26:34
*/


-- ----------------------------
-- Table structure for STUDENT
-- ----------------------------
DROP TABLE "SYSTEM"."STUDENT";
CREATE TABLE "SYSTEM"."STUDENT" (
"ID" NUMBER(9) NOT NULL ,
"NAME" VARCHAR2(255 BYTE) NOT NULL ,
"SCH_ID" NUMBER(9) NULL ,
"SEX" VARCHAR2(255 BYTE) NULL ,
"ISOK" NUMBER(1) NULL ,
"C_VARCHAR2" VARCHAR2(255 BYTE) NULL ,
"C_CLOB" CLOB NULL ,
"C_DATE" DATE NULL ,
"C_INT" NUMBER(9) NULL ,
"C_INT16" NUMBER(4) NULL ,
"C_BYTE" NUMBER(3) NULL ,
"C_BOOL" NUMBER(1) NULL ,
"C_INT64" NUMBER(18) NULL ,
"C_BFILE" BFILE NULL ,
"C_DOUBLE" NUMBER(9,2) NULL ,
"C_BIN_DOU" BINARY_DOUBLE NULL ,
"C_CNLOB" NCLOB NULL ,
"C_TIMESTAMP" TIMESTAMP(6)  NULL ,
"C_BOB" BLOB NULL ,
"C_LOB" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of STUDENT
-- ----------------------------
INSERT INTO "SYSTEM"."STUDENT" VALUES ('1', 'name', '1', '2', '3', '4', '11', TO_DATE('2016-09-14 14:15:03', 'YYYY-MM-DD HH24:MI:SS'), '7', '8', '9', '1', '10', null, '11.11', '11.22', '21312', TO_TIMESTAMP(' 2015-01-01 00:00:00:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), null, '1');
INSERT INTO "SYSTEM"."STUDENT" VALUES ('2', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('3', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('4', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('38', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('39', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('40', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('41', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('42', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('43', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('44', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('45', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('46', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('47', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('48', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('49', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('50', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('51', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('52', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('53', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('54', 'XXX', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('55', 'safa', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('56', 'safa', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('57', 'safa', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('58', 'safa', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('59', 'xx', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('60', '张1556212501', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('61', '张1609189694', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('62', '张1609189694', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('63', '张700041422', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('64', '张583579848', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('65', '张583579848', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('66', '张1921233691', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('67', '张851492098', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('68', '张851492098', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('69', '张306212284', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('70', '张1587356351', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('71', '张1587356351', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('72', '张1692830206', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('73', '张315874487', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('74', '张315874487', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('75', '张2054337313', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('76', '张21821611', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('77', '张21821611', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('81', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('82', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('83', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('84', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('85', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('86', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('87', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('88', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('89', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('90', 'stud-2016-09-13', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('92', '张1036076145', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('93', '张684872367', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('94', '张684872367', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('95', '张1825395661', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('96', '张1909932943', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('97', '张1909932943', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('98', '张1645501491', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('99', '张268545772', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('100', '张268545772', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('101', '张2027304045', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('102', '张2027304045', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('103', '张2027304045', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('104', '张104613748', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('105', '张875141676', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('106', '张875141676', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('107', '张1758066279', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('108', '张1406694388', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('109', '张1406694388', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('110', '张1099935026', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('111', '张1870462954', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('112', '张1870462954', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('113', '张1563703592', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('114', '张1212331701', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('115', '张1212331701', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('116', '张1184472308', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('117', '张938574272', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('118', '张938574272', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('119', '张1779535168', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('120', '张1121403915', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('121', '张1121403915', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('122', '张1189356174', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('123', '张1189356174', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('124', '张1189356174', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('125', '张796279250', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('126', '张796279250', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('127', '张796279250', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('128', '张902207869', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('129', '张1621032335', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('130', '张1621032335', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('131', '张656309833', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('132', '张656309833', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('133', '张656309833', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('134', '张1668048021', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('135', '张291092302', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('136', '张291092302', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('137', '张1916349214', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('138', '张539393495', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('139', '张539393495', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('140', '张1366263086', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('141', '张1366263086', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('142', '张1366263086', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('143', '张36154940', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('144', '张36154940', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('145', '张36154940', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('146', '张493000686', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('147', '张141628795', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('148', '张141628795', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('149', '张1486205458', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('150', '张109249739', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('151', '张109249739', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('152', '张919534307', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('153', '张919534307', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('154', '张919534307', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('155', '张1514687728', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('156', '张1514687728', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('157', '张1514687728', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('158', '张386033202', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('159', '张386033202', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('160', '张386033202', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('161', '张1768586225', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('162', '张1461826863', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('163', '张1461826863', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('164', '张2110750677', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('165', '张733794958', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('166', '张733794958', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('167', '张1677580887', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('168', '张300625168', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('169', '张300625168', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('170', '张1595614875', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('171', '张218659156', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('172', '张218659156', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('173', '张998513061', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('174', '张1769040989', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('175', '张1769040989', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('0', '张三', '1', '男', '1', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('176', '张三', '1', '男', '1', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('177', 'sun', '1', '女', '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('178', 'mama', '1', 'gril', '1', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('180', '哈哈', '1', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('181', '哈哈', '1', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('182', '哈哈', '1', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('183', '哈哈', '1', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('184', '哈哈', '1', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('185', '张984723577', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('186', '张1052507723', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('187', '张1052507723', null, null, '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('188', '哈哈', '1', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('189', '张三', '1', '男', '1', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('190', 'sun', '1', '女', '0', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);
INSERT INTO "SYSTEM"."STUDENT" VALUES ('191', 'mama', '1', 'gril', '1', null, null, null, null, '0', null, '0', '0', null, null, null, null, null, null, null);

-- ----------------------------
-- Indexes structure for table STUDENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table STUDENT
-- ----------------------------
ALTER TABLE "SYSTEM"."STUDENT" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SYSTEM"."STUDENT" ADD CHECK ("NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table STUDENT
-- ----------------------------
ALTER TABLE "SYSTEM"."STUDENT" ADD PRIMARY KEY ("ID");
