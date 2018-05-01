/*
Navicat MySQL Data Transfer

Source Server         : touch
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : manage

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-01 21:31:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for businesstrips
-- ----------------------------
DROP TABLE IF EXISTS `businesstrips`;
CREATE TABLE `businesstrips` (
  `businesstripid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `destinations` varchar(255) NOT NULL DEFAULT '',
  `starteds` varchar(255) NOT NULL DEFAULT '',
  `endeds` varchar(255) NOT NULL DEFAULT '',
  `days` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `result` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `approverids` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`businesstripid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of businesstrips
-- ----------------------------
INSERT INTO `businesstrips` VALUES ('205333511521964032', '204266203126960128', '青海湖', '2018-04-16', '2018-04-18', '2', '去青海湖', '', '1', '2', '123456', '1523758212', '1523758212');

-- ----------------------------
-- Table structure for businesstrips_approver
-- ----------------------------
DROP TABLE IF EXISTS `businesstrips_approver`;
CREATE TABLE `businesstrips_approver` (
  `approverid` bigint(20) NOT NULL,
  `businesstripid` bigint(20) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `summary` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`approverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of businesstrips_approver
-- ----------------------------
INSERT INTO `businesstrips_approver` VALUES ('205333511752650752', '205333511521964032', '123456', '去吧去吧', '1', '1523758212', '1523758489');

-- ----------------------------
-- Table structure for checkworks
-- ----------------------------
DROP TABLE IF EXISTS `checkworks`;
CREATE TABLE `checkworks` (
  `checkid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `clock` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of checkworks
-- ----------------------------
INSERT INTO `checkworks` VALUES ('210164876260151294', '123456', '18:08:22', '1', '127.0.0.1', '1524823702');
INSERT INTO `checkworks` VALUES ('210164876260151295', '123456', '18:08:19', '2', '127.0.0.1', '1524823699');
INSERT INTO `checkworks` VALUES ('210164876260151296', '123456', '18:08:19', '2', '127.0.0.1', '1524910099');
INSERT INTO `checkworks` VALUES ('210164891804241920', '123456', '18:08:22', '1', '127.0.0.1', '1524910102');
INSERT INTO `checkworks` VALUES ('210165100533780480', '204266203126960128', '18:09:13', '2', '127.0.0.1', '1524910152');
INSERT INTO `checkworks` VALUES ('210165114819579904', '204266203126960128', '18:09:16', '1', '127.0.0.1', '1524910156');
INSERT INTO `checkworks` VALUES ('210491807509778432', '123456', '15:47:26', '2', '127.0.0.1', '1524988045');
INSERT INTO `checkworks` VALUES ('210491819836837888', '123456', '15:47:29', '3', '127.0.0.1', '1524988048');
INSERT INTO `checkworks` VALUES ('210491950699122688', '204266203126960128', '15:48:00', '2', '127.0.0.1', '1524988079');
INSERT INTO `checkworks` VALUES ('210491966457122816', '204266203126960128', '15:48:03', '3', '127.0.0.1', '1524988083');
INSERT INTO `checkworks` VALUES ('210492622471434240', '208250402968178688', '15:50:40', '2', '127.0.0.1', '1524988239');
INSERT INTO `checkworks` VALUES ('210492634618138624', '208250402968178688', '15:50:43', '3', '127.0.0.1', '1524988242');
INSERT INTO `checkworks` VALUES ('210558897189031936', '208250808926474240', '20:14:01', '2', '127.0.0.1', '1525004041');
INSERT INTO `checkworks` VALUES ('210558909499314176', '208250808926474240', '20:14:04', '4', '127.0.0.1', '1525004044');
INSERT INTO `checkworks` VALUES ('210559497372962816', '208251089747709952', '20:16:25', '2', '127.0.0.1', '1525004184');
INSERT INTO `checkworks` VALUES ('210559510727626752', '208251089747709952', '20:16:28', '4', '127.0.0.1', '1525004187');
INSERT INTO `checkworks` VALUES ('210730629174661120', '123456', '07:36:25', '1', '127.0.0.1', '1525044985');
INSERT INTO `checkworks` VALUES ('210730646878818304', '123456', '07:36:29', '3', '127.0.0.1', '1525044989');
INSERT INTO `checkworks` VALUES ('211223192398729216', '123456', '16:13:42', '2', '127.0.0.1', '1525162421');
INSERT INTO `checkworks` VALUES ('211223206864883712', '123456', '16:13:45', '3', '127.0.0.1', '1525162424');

-- ----------------------------
-- Table structure for departs
-- ----------------------------
DROP TABLE IF EXISTS `departs`;
CREATE TABLE `departs` (
  `departid` bigint(20) NOT NULL COMMENT '部门ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`departid`) USING BTREE,
  KEY `INDEX_NS` (`name`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of departs
-- ----------------------------
INSERT INTO `departs` VALUES ('1462290164626094232', '运营部', '微信运营组，PC运营组', '1');
INSERT INTO `departs` VALUES ('1462290199274575028', '市场部', '前端销售，后端销售，商务组', '1');
INSERT INTO `departs` VALUES ('1462290127694985332', '研发部', '研发部，GO组，PHP组，UI组', '1');
INSERT INTO `departs` VALUES ('1462290228639093428', '行政部', '日常后勤，人事', '1');
INSERT INTO `departs` VALUES ('1462290248393045132', '财务部', '掌管经济大权', '1');
INSERT INTO `departs` VALUES ('205348618821963776', 'test', 'test', '1');

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `expenseid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `amounts` varchar(255) NOT NULL DEFAULT '',
  `types` varchar(255) NOT NULL DEFAULT '',
  `contents` varchar(255) NOT NULL DEFAULT '',
  `total` double NOT NULL DEFAULT '0',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `result` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `approverids` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of expenses
-- ----------------------------
INSERT INTO `expenses` VALUES ('205333342810279936', '204266203126960128', '1000', '路费', '去青海湖的路费', '1000', '', '1', '2', '123456', '1523758171', '1523758171');
INSERT INTO `expenses` VALUES ('210831451866796032', '204266203126960128', '1000', '采购费用', '买了一些东西', '1000', '', '0', '2', '123456', '1525069023', '1525069023');

-- ----------------------------
-- Table structure for expenses_approver
-- ----------------------------
DROP TABLE IF EXISTS `expenses_approver`;
CREATE TABLE `expenses_approver` (
  `approverid` bigint(20) NOT NULL,
  `expenseid` bigint(20) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `summary` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`approverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of expenses_approver
-- ----------------------------
INSERT INTO `expenses_approver` VALUES ('205333343049355264', '205333342810279936', '123456', '好吧好吧', '1', '1523758171', '1523758511');
INSERT INTO `expenses_approver` VALUES ('210831452286226432', '210831451866796032', '123456', '', '0', '1525069023', '1525069023');

-- ----------------------------
-- Table structure for leaves
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `leaveid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `started` bigint(20) NOT NULL DEFAULT '0',
  `ended` bigint(20) NOT NULL DEFAULT '0',
  `days` double NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `result` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `approverids` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of leaves
-- ----------------------------
INSERT INTO `leaves` VALUES ('204357779954077696', '123456', '1', '1523548800', '1523721600', '2', '事事儿的', '/static/uploadfile/2018-4/12/1f178a82b9014a90e7149a12a3773912b31bee73.jpg', '1', '2', '204266203126960128', '1523525579', '1523525579');
INSERT INTO `leaves` VALUES ('205332892878901248', '204266203126960128', '8', '1523808000', '1523980800', '2', '去青海湖', '', '1', '2', '123456', '1523758064', '1523758064');
INSERT INTO `leaves` VALUES ('210099129437655040', '204266203126960128', '4', '1522512000', '1522771200', '4', '我想休息休息', '/static/uploadfile/2018-4/28/动物 - 4.jpg', '1', '2', '123456', '1524894423', '1524894423');

-- ----------------------------
-- Table structure for leaves_approver
-- ----------------------------
DROP TABLE IF EXISTS `leaves_approver`;
CREATE TABLE `leaves_approver` (
  `approverid` bigint(20) NOT NULL,
  `leaveid` bigint(20) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `summary` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`approverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of leaves_approver
-- ----------------------------
INSERT INTO `leaves_approver` VALUES ('204357780256067584', '204357779954077696', '204266203126960128', '事事儿的', '1', '1523525579', '1523525805');
INSERT INTO `leaves_approver` VALUES ('205332893319303168', '205332892878901248', '123456', '去吧去吧', '1', '1523758064', '1523758548');
INSERT INTO `leaves_approver` VALUES ('210099129852891136', '210099129437655040', '123456', 'that\'s right.', '1', '1524894424', '1524901228');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `msgid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `touserid` bigint(20) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `subtype` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `view` int(11) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('208763421984821248', '123456', '208250402968178688', '3', '32', '拒绝', '/overtime/approval/208763183962263552', '2', '1524575966');
INSERT INTO `messages` VALUES ('210099158449655808', '204266203126960128', '123456', '4', '31', '去审批处理', '/leave/approval/210099129437655040', '2', '1524894430');
INSERT INTO `messages` VALUES ('210127670325809152', '123456', '204266203126960128', '3', '31', '同意', '/leave/approval/210099129437655040', '2', '1524901228');
INSERT INTO `messages` VALUES ('210831479507259392', '204266203126960128', '123456', '4', '33', '去审批处理', '/expense/approval/210831451866796032', '2', '1525069029');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `noticeid` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`noticeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('204239427050934272', '这是第一条公告', '嘻嘻嘻。。。', '1523497361', '1');
INSERT INTO `notices` VALUES ('204359003889733632', '快五一了', '快放假喽', '1523525871', '1');
INSERT INTO `notices` VALUES ('205334226063593472', '快六一了', '快放假了', '1523758382', '1');
INSERT INTO `notices` VALUES ('208761118976380928', '明天有雨', '大家记得带伞', '1524575417', '1');
INSERT INTO `notices` VALUES ('208761263168163840', 'test', '这是一个测试的例子', '1524575451', '1');
INSERT INTO `notices` VALUES ('208761351705726976', '快毕业了', '小忧伤。。。', '1524575472', '1');
INSERT INTO `notices` VALUES ('210731310891667456', '今天是个好日子', '哈哈哈哈', '1525045147', '1');

-- ----------------------------
-- Table structure for overtimes
-- ----------------------------
DROP TABLE IF EXISTS `overtimes`;
CREATE TABLE `overtimes` (
  `overtimeid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `started` bigint(20) NOT NULL DEFAULT '0',
  `ended` bigint(20) NOT NULL DEFAULT '0',
  `longtime` double NOT NULL DEFAULT '0',
  `holiday` int(11) NOT NULL DEFAULT '0',
  `way` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `result` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `approverids` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`overtimeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of overtimes
-- ----------------------------
INSERT INTO `overtimes` VALUES ('205333187633614848', '204266203126960128', '1523700000', '1523714400', '4', '2', '2', '项目着急上线', '1', '2', '123456', '1523758134', '1523758134');
INSERT INTO `overtimes` VALUES ('208763183962263552', '208250402968178688', '1524654000', '1524664800', '4', '2', '2', '项目着急上线', '2', '2', '123456', '1524575909', '1524575909');

-- ----------------------------
-- Table structure for overtimes_approver
-- ----------------------------
DROP TABLE IF EXISTS `overtimes_approver`;
CREATE TABLE `overtimes_approver` (
  `approverid` bigint(20) NOT NULL,
  `overtimeid` bigint(20) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL DEFAULT '0',
  `summary` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `changed` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`approverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of overtimes_approver
-- ----------------------------
INSERT INTO `overtimes_approver` VALUES ('205333188464087040', '205333187633614848', '123456', '加吧加吧', '1', '1523758135', '1523758528');
INSERT INTO `overtimes_approver` VALUES ('208763184536883200', '208763183962263552', '123456', '好好休息吧', '2', '1524575909', '1524575966');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `positionid` bigint(20) NOT NULL COMMENT '部门ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常2屏蔽',
  PRIMARY KEY (`positionid`) USING BTREE,
  KEY `INDEX_NS` (`name`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('1462292006260420932', '总经理', '管理公司日常事务', '1');
INSERT INTO `positions` VALUES ('1462292041515367932', '部门经理', '负责部门事务', '1');
INSERT INTO `positions` VALUES ('1462292053049130632', '主管', '小组主管', '1');
INSERT INTO `positions` VALUES ('1462292065226423828', '组长', '小组领队', '1');
INSERT INTO `positions` VALUES ('1462292078258175728', '员工', '公司员工', '1');
INSERT INTO `positions` VALUES ('205348690804609024', 'test', 'test', '2');

-- ----------------------------
-- Table structure for resumes
-- ----------------------------
DROP TABLE IF EXISTS `resumes`;
CREATE TABLE `resumes` (
  `resumeid` bigint(20) NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `sex` int(11) NOT NULL DEFAULT '0',
  `birth` bigint(20) NOT NULL DEFAULT '0',
  `edu` int(11) NOT NULL DEFAULT '0',
  `work` int(11) NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL DEFAULT '',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`resumeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of resumes
-- ----------------------------
INSERT INTO `resumes` VALUES ('204359997004451840', 'June', '1', '799286400', '7', '1', '/static/uploadfile/2018-4/12/beego开发文档.pdf', '1523526108', '1', '<span style=\"color:#00D5FF;\"></span>\r\n<h1>\r\n	勤劳能吃苦好学爱学<br />\r\n</h1>', '15738394558');
INSERT INTO `resumes` VALUES ('205333940049809408', 'monbious', '1', '799286400', '7', '1', '', '1523758314', '4', '吃苦耐劳爱学习<br />', '15738394558');
INSERT INTO `resumes` VALUES ('208761650809933824', 'resume', '1', '1522972800', '7', '1', '', '1524575544', '1', '肤白貌美大长腿<br />', '15738394558');
INSERT INTO `resumes` VALUES ('208761881530208256', 'resume2', '2', '1459468800', '4', '3', '', '1524575599', '5', '肤白貌美大长腿<br />', '17521523590');
INSERT INTO `resumes` VALUES ('208762005681606656', 'resume3', '2', '1523404800', '10', '4', '', '1524575628', '4', '肤白貌美大长腿', '15738394558');
INSERT INTO `resumes` VALUES ('208762261865500672', 'resume4', '1', '1522540800', '1', '1', '', '1524575689', '1', '此处省略一些字', '15738394558');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('123456', '123456', 'admin', '21232f297a57a5a743894a0e4a801fc3', '/static/uploadfile/2018-4/15/079b8ef5702a02239c6269737d1562f7-cropper.jpg', '1');
INSERT INTO `users` VALUES ('204266203126960128', '204266203126960128', 'test', '098f6bcd4621d373cade4e832627b4f6', '/static/uploadfile/2018-4/12/2646f007d154d5cfc8965e3a33489cd4-cropper.jpg', '1');
INSERT INTO `users` VALUES ('208250402968178688', '208250402968178688', 'test2', 'ad0234829205b9033196ba818f7a872b', '/static/uploadfile/2018-4/24/79269cef21459f53027f2b27fbc14162-cropper.jpg', '1');
INSERT INTO `users` VALUES ('208250808926474240', '208250808926474240', 'test3', '8ad8757baa8564dc136c1e07507f4a98', '/static/uploadfile/2018-4/24/be228ed7c2dd445d0309a0d04c0a0a83-cropper.jpg', '1');
INSERT INTO `users` VALUES ('208251089747709952', '208251089747709952', 'test4', '86985e105f79b95d6bc918fb45ec7727', '/static/img/avatar/1.jpg', '2');
INSERT INTO `users` VALUES ('208251321675943936', '208251321675943936', 'test5', 'e3d704f3542b44a621ebed70dc0efe13', '/static/img/avatar/1.jpg', '1');

-- ----------------------------
-- Table structure for users_profile
-- ----------------------------
DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE `users_profile` (
  `userid` bigint(20) NOT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `sex` int(11) NOT NULL DEFAULT '0',
  `birth` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `webchat` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `emercontact` varchar(255) NOT NULL DEFAULT '',
  `emerphone` varchar(255) NOT NULL DEFAULT '',
  `departid` bigint(20) NOT NULL DEFAULT '0',
  `positionid` bigint(20) NOT NULL DEFAULT '0',
  `lognum` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `lasted` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users_profile
-- ----------------------------
INSERT INTO `users_profile` VALUES ('123456', 'admin', '2', '1995-05-01', 'test@test.com', 'admin', '1364143139', '15738394558', '15738394558', '象牙山', 'admin', '15738394558', '1462290127694985332', '1462292065226423828', '0', '', '0');
INSERT INTO `users_profile` VALUES ('204266203126960128', 'test', '2', '1995-05-01', 'test@company.com', 'test', '1364143139', '15738394558', '', '河科大', 'admin', '15738394558', '1462290248393045132', '1462292078258175728', '1', '127.0.0.1', '1523503745');
INSERT INTO `users_profile` VALUES ('208250402968178688', 'test2', '1', '2018-04-09', 'test2@test.com', '', '', '15738394558', '', '', 'admin', '15738394558', '1462290228639093428', '1462292053049130632', '1', '127.0.0.1', '1524453653');
INSERT INTO `users_profile` VALUES ('208250808926474240', 'test3', '1', '2018-04-01', 'test3@test.com', '', '', '15738394558', '', '', 'admin', '17521523590', '1462290164626094232', '1462292041515367932', '1', '127.0.0.1', '1524453749');
INSERT INTO `users_profile` VALUES ('208251089747709952', 'test4', '2', '2018-04-04', 'test4@test.com', '', '', '15738394558', '', '', 'admin', '15738394558', '1462290248393045132', '1462292065226423828', '1', '127.0.0.1', '1524453816');
INSERT INTO `users_profile` VALUES ('208251321675943936', 'test5', '2', '2018-04-10', 'test5@test.com', '', '', '15738394558', '', '', 'admin', '15738394558', '1462290127694985332', '1462292053049130632', '1', '127.0.0.1', '1524453872');
