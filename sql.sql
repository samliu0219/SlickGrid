-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 gingkolake 的数据库结构
DROP DATABASE IF EXISTS `gingkolake`;
CREATE DATABASE IF NOT EXISTS `gingkolake` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `gingkolake`;

-- 导出  表 gingkolake.business_accumulate 结构
DROP TABLE IF EXISTS `business_accumulate`;
CREATE TABLE IF NOT EXISTS `business_accumulate` (
  `report_type` varchar(10) NOT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `year` int(4) unsigned NOT NULL,
  `month` int(2) unsigned NOT NULL,
  `week` int(2) unsigned NOT NULL,
  `day` int(2) unsigned NOT NULL,
  PRIMARY KEY (`year`,`month`,`day`,`report_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.business_accumulate 的数据：~9 rows (大约)
DELETE FROM `business_accumulate`;
/*!40000 ALTER TABLE `business_accumulate` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_accumulate` ENABLE KEYS */;

-- 导出  表 gingkolake.business_today 结构
DROP TABLE IF EXISTS `business_today`;
CREATE TABLE IF NOT EXISTS `business_today` (
  `report_type` varchar(10) NOT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`report_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.business_today 的数据：~4 rows (大约)
DELETE FROM `business_today`;
/*!40000 ALTER TABLE `business_today` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_today` ENABLE KEYS */;

-- 导出  表 gingkolake.business_update_record 结构
DROP TABLE IF EXISTS `business_update_record`;
CREATE TABLE IF NOT EXISTS `business_update_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_type` varchar(10) NOT NULL,
  `income` decimal(10,2) NOT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_income` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.business_update_record 的数据：~51 rows (大约)
DELETE FROM `business_update_record`;
/*!40000 ALTER TABLE `business_update_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_update_record` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_dict 结构
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_sid` varchar(100) DEFAULT NULL COMMENT 'dict_id',
  `dict_sort` varchar(100) DEFAULT NULL COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT NULL COMMENT '字典标签',
  `dict_type` varchar(100) DEFAULT NULL COMMENT '字典键值',
  `dict_number` varchar(100) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(100) DEFAULT NULL COMMENT '字典类型',
  `dict_value_type` varchar(100) DEFAULT NULL COMMENT '字典值',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` varchar(100) DEFAULT NULL COMMENT '是否默认',
  `status` varchar(50) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_dict 的数据：~3 rows (大约)
DELETE FROM `sys_dict`;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_login_record 结构
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE IF NOT EXISTS `sys_login_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_sys_login_record_sys_user` (`user_id`),
  CONSTRAINT `FK_sys_login_record_sys_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_login_record 的数据：~2 rows (大约)
DELETE FROM `sys_login_record`;
/*!40000 ALTER TABLE `sys_login_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_login_record` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int(4) unsigned NOT NULL DEFAULT 0 COMMENT '父菜单ID',
  `title` varchar(100) NOT NULL COMMENT '菜单名称',
  `path` varchar(200) NOT NULL COMMENT '路由路径',
  `name` varchar(200) NOT NULL COMMENT '路由名称',
  `component` varchar(200) NOT NULL COMMENT '路由组件',
  `redirect` varchar(200) DEFAULT NULL COMMENT '路由重定向',
  `order_num` int(4) unsigned DEFAULT NULL COMMENT '显示顺序',
  `icon` varchar(200) DEFAULT NULL COMMENT '菜单图标',
  `is_link` varchar(200) DEFAULT NULL COMMENT '外链地址',
  `menu_type` int(1) unsigned NOT NULL DEFAULT 1 COMMENT '菜单类型,1,目录 2,菜单 3,按钮',
  `is_hide` int(1) unsigned DEFAULT 0 COMMENT '菜单状态,1显示 2隐藏',
  `keep_alive` int(1) DEFAULT 1 COMMENT '是否缓存',
  `is_fix` int(1) DEFAULT 0 COMMENT '菜单是否固定',
  `is_frame` int(1) DEFAULT 0 COMMENT '是否内嵌',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_menu 的数据：~19 rows (大约)
DELETE FROM `sys_menu`;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `parent_id`, `title`, `path`, `name`, `component`, `redirect`, `order_num`, `icon`, `is_link`, `menu_type`, `is_hide`, `keep_alive`, `is_fix`, `is_frame`, `create_by`, `created_at`, `update_by`, `updated_at`, `remark`) VALUES
	(1, 0, 'message.router.home', '/home', 'home', 'home/index', '', 0, 'iconfont icon-shouye', NULL, 1, 0, 1, 1, 0, NULL, '2022-01-20 16:16:19', NULL, '2022-01-20 16:16:19', NULL),
	(2, 0, 'message.router.system', '/system', 'system', 'layout/routerView/parent', '/system/menu', 1, 'iconfont icon-xitongshezhi', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-20 16:19:00', NULL, '2022-01-20 16:19:00', NULL),
	(3, 2, 'message.router.systemMenu', '/system/menu', 'systemMenu', 'system/menu/index', NULL, 2, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-20 16:55:23', NULL, '2022-01-20 16:55:23', NULL),
	(4, 2, 'message.router.systemUser', '/system/user', 'systemUser', 'system/user/index', NULL, 3, 'iconfont icon-icon-', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-20 16:57:54', NULL, '2022-01-20 16:57:54', NULL),
	(5, 0, 'message.router.limits', '/limits', 'limits', 'layout/routerView/parent', '/limits/frontEnd', 4, 'iconfont icon-quanxian', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 13:06:28', NULL, '2022-01-24 13:06:28', NULL),
	(6, 5, 'message.router.limitsBackEnd', '/limits/backEnd', 'limitsBackEnd', 'layout/routerView/parent', NULL, 5, NULL, NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 13:08:07', NULL, '2022-01-24 13:08:07', NULL),
	(7, 6, 'message.router.limitsBackEndEndPage', '/limits/backEnd/page', 'limitsBackEndEndPage', 'limits/backEnd/page/index', NULL, 6, NULL, NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 13:08:58', NULL, '2022-01-24 13:08:58', NULL),
	(8, 0, 'message.router.menu', '/menu', 'menu', 'layout/routerView/parent', '/menu/menu1', 7, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:25:26', NULL, '2022-01-24 14:25:26', NULL),
	(9, 8, 'message.router.menu1', '/menu/menu1', 'menu1', 'layout/routerView/parent', '/menu/menu1/menu11', 8, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:26:40', NULL, '2022-01-24 14:26:40', NULL),
	(10, 9, 'message.router.menu11', '/menu/menu1/menu11', 'menu11', 'menu/menu1/menu11/index', NULL, 9, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:27:29', NULL, '2022-01-24 14:27:29', NULL),
	(11, 9, 'message.router.menu12', '/menu/menu1/menu12', 'menu12', 'layout/routerView/parent', '/menu/menu1/menu12/menu121', 10, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:28:24', NULL, '2022-01-24 14:28:24', NULL),
	(12, 11, 'message.router.menu121', '/menu/menu1/menu12/menu121', 'menu121', 'menu/menu1/menu12/menu121/index', NULL, 11, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:29:17', NULL, '2022-01-24 14:29:17', NULL),
	(13, 11, 'message.router.menu122', '/menu/menu1/menu12/menu122', 'menu122', 'menu/menu1/menu12/menu122/index', NULL, 12, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:30:39', NULL, '2022-01-24 14:30:39', NULL),
	(14, 9, 'message.router.menu13', '/menu/menu1/menu13', 'menu13', 'menu/menu1/menu13/index', NULL, 13, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 14:41:42', NULL, '2022-01-24 14:41:42', NULL),
	(15, 8, 'message.router.menu2', '/menu/menu2', 'menu2', 'menu/menu2/index', NULL, 14, 'iconfont icon-caidan', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 16:07:36', NULL, '2022-01-24 16:07:36', NULL),
	(16, 0, 'message.router.funIndex', '/fun', 'funIndex', 'layout/routerView/parent', '/fun/tagsView', 15, 'iconfont icon-crew_feature', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 16:08:37', NULL, '2022-01-24 16:08:37', NULL),
	(17, 16, 'message.router.funTagsView', '/fun/tagsView', 'funTagsView', 'fun/tagsView/index', NULL, 16, 'elementPointer', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 16:09:29', NULL, '2022-01-24 16:09:29', NULL),
	(18, 0, 'message.router.chartIndex', '/chart', 'chartIndex', 'chart/index', NULL, 17, 'iconfont icon-ico_shuju', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 16:10:11', NULL, '2022-01-24 16:10:11', NULL),
	(19, 0, 'message.router.personal', '/personal', 'personal', 'personal/index', NULL, 18, 'iconfont icon-gerenzhongxin', NULL, 1, 0, 1, 0, 0, NULL, '2022-01-24 16:11:17', NULL, '2022-01-24 16:11:17', NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_key` varchar(50) DEFAULT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) DEFAULT NULL COMMENT '显示顺序',
  `data_scope` varchar(50) DEFAULT NULL COMMENT '数据范围',
  `status` int(4) DEFAULT NULL COMMENT '角色状态',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_role 的数据：~7 rows (大约)
DELETE FROM `sys_role`;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `create_by`, `created_at`, `update_by`, `updated_at`, `remark`) VALUES
	(1, '管理员', 'admin', 0, '0', 1, NULL, '2022-01-20 18:35:49', NULL, '2022-01-20 18:35:49', NULL),
	(2, '用户', 'user', 1, '0', 1, NULL, '2022-01-21 15:01:54', NULL, '2022-01-21 15:01:54', NULL),
	(3, '营收上报', 'businessexpress', 2, 'manage', 1, NULL, '2022-02-02 10:37:59', NULL, '2022-02-02 10:37:59', NULL),
	(4, '营收上报', 'businessexpress', 3, 'ticket', 1, NULL, '2022-02-02 10:38:45', NULL, '2022-02-02 10:38:45', NULL),
	(5, '营收上报', 'businessexpress', 4, 'golf', 1, NULL, '2022-02-02 10:38:45', NULL, '2022-02-02 10:38:45', NULL),
	(6, '营收上报', 'businessexpress', 5, 'sale', 1, NULL, '2022-02-02 10:38:45', NULL, '2022-02-02 10:38:45', NULL),
	(7, '营收上报', 'businessexpress', 6, 'hotel', 1, NULL, '2022-02-02 10:38:45', NULL, '2022-02-02 10:38:45', NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_role_menu 结构
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(4) unsigned DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(4) unsigned DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_role_menu 的数据：~17 rows (大约)
DELETE FROM `sys_role_menu`;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 2, 1),
	(6, 1, 5),
	(7, 1, 6),
	(8, 1, 7),
	(9, 1, 8),
	(10, 1, 9),
	(11, 1, 10),
	(12, 1, 11),
	(13, 1, 12),
	(14, 1, 13),
	(15, 1, 14),
	(16, 1, 15),
	(17, 1, 16),
	(18, 1, 17),
	(19, 1, 18),
	(20, 1, 19);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(50) NOT NULL DEFAULT '0000' COMMENT '登录账号',
  `user_name` varchar(200) DEFAULT NULL COMMENT '用户昵称',
  `user_type` varchar(50) DEFAULT '0' COMMENT '用户类型，1系统用户',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `sex` int(1) unsigned DEFAULT 3 COMMENT '用户性别1男 2女 3未知',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像路径',
  `password` varchar(512) NOT NULL COMMENT '密码',
  `status` int(1) unsigned NOT NULL DEFAULT 1 COMMENT '帐号状态1正常 2禁用',
  `login_ip` varchar(50) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` timestamp NULL DEFAULT current_timestamp() COMMENT '最后登陆时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT current_timestamp() COMMENT '删除时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `pwd_updated_at` timestamp NULL DEFAULT current_timestamp() COMMENT '密码更新日',
  `work_id` varchar(200) DEFAULT NULL COMMENT '企业微信ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_user 的数据：~15 rows (大约)
DELETE FROM `sys_user`;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `account`, `user_name`, `user_type`, `email`, `phone`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `create_by`, `created_at`, `update_by`, `updated_at`, `deleted_at`, `remark`, `pwd_updated_at`, `work_id`) VALUES
	(1, 'admin', '系统管理员', '1', 'samliu@mail.com', '17705159163', 1, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6InNhbUdpbmdrbzk5ODgiLCJ1c2VyX25hbWUiOiJhZG1pbiJ9.Tok_judCRKnQA2yDjjX9WKEiIHO-E6pGPyZ5t9tRd_A', 1, '127.0.0.1', '2022-01-31 13:42:33', NULL, '2022-01-22 09:53:42', NULL, '2022-01-22 09:53:42', '2022-01-22 09:53:42', NULL, '2022-01-22 17:00:40', ''),
	(2, 'LvZeHua', '吕泽华', NULL, '', '13914495083', 1, 'http://wework.qpic.cn/bizmail/oZhEknLdUGz34t1bibQQy0BHCwmDdsm8TCopg4kiaHviciaZPnRmlIcIpA/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6Ikx2WmVIdWEiLCJ1c2VyX25hbWUiOiJMdlplSHVhIn0.K9THdm9kycxRmpcqNS4BjJ9KDzg0ZNvgZScxR1By48Q', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, 'LvZeHua'),
	(3, 'LiuDaCheng', '刘又诚', NULL, '', '17705159163', 1, 'https://wework.qpic.cn/bizmail/icqd88RZ3nofVfw7ZOxAMKQ5SFicOQXZSTKLbeEBdJjZFBwtaBKl0DCA/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IkxpdURhQ2hlbmciLCJ1c2VyX25hbWUiOiJMaXVEYUNoZW5nIn0.A3F9RD1PWyO9-MaFqxlUQwQ_r2d3qkI2YmhxXYbGLXU', 1, '127.0.0.1', '2022-01-31 13:43:39', '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, 'LiuDaCheng'),
	(4, 'ZhangChengYou', '張澄宥', NULL, '', '+886975780926', 1, 'http://wework.qpic.cn/bizmail/A8RpqHkKeGAkh9SqSMbV8ic8XzjvCN31EAibYOlicLGporLW13SQVxg7w/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IlpoYW5nQ2hlbmdZb3UiLCJ1c2VyX25hbWUiOiJaaGFuZ0NoZW5nWW91In0.tnviH_PZ_HqH0I9ZBsVp4-8Gm6nusKWHQx2R8aYtV7M', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, 'ZhangChengYou'),
	(9, '150816-002', '李文幸', NULL, '', '13813841271', 1, 'https://wework.qpic.cn/bizmail/XK52d2UPgwFugoCWn2k7eARv3VMGzcpd1E53jma54dlaymsAn8WCJg/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IjE1MDgxNi0wMDIiLCJ1c2VyX25hbWUiOiIxNTA4MTYtMDAyIn0.jdWocsQCUHZ2zYQawnDqHTsYZeGy5rOgOzqnCJ7KwLE', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, '150816-002'),
	(10, '170101-001', '林郁苹', NULL, '', '15062207969', 2, 'http://wework.qpic.cn/bizmail/kOgtLtkWP5F0pVH08MlGlhzuh0WsicSupCUGQXdf9HF7Umtrz9tP2GA/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IjE3MDEwMS0wMDEiLCJ1c2VyX25hbWUiOiIxNzAxMDEtMDAxIn0.ZJipH_InvGuzaUKY29Y4NKotYu-kL_yzIWtoDLSaGdU', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, '170101-001'),
	(11, '210515-001', '叶浩东', NULL, '', '18075092758', 1, 'http://wework.qpic.cn/bizmail/Jbictp5wdW0maNBva4XWBnlIwImEmYy65GnLJRKBDOL4KbZgGtu9kBQ/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IjIxMDUxNS0wMDEiLCJ1c2VyX25hbWUiOiIyMTA1MTUtMDAxIn0.rCA05hdznanOv9Dtdd1tsLyC_5U1hNb77dOCaiUJfyA', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, '210515-001'),
	(12, '191106-001', '姜建志', NULL, '', '13661681917', 1, 'http://wework.qpic.cn/bizmail/NTTT7Ulros4V8yKgzZn4vFpJRgjrGmicdVyniaBwPQXs2DGqKdBRGpfg/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IjE5MTEwNi0wMDEiLCJ1c2VyX25hbWUiOiIxOTExMDYtMDAxIn0.1w-NBFzaajcDTpTBvN458gNAzK9SQVnQfGuTD1cpkmI', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, '191106-001'),
	(13, 'LiXiJiuMeng', '李志轩', NULL, '', '17601257900', 1, 'http://wework.qpic.cn/bizmail/BOFpQscZQYSDTRm8ic0v2BzYzRZ5ZLFUkmzNIGK6SVmdv9ybNy5vHSw/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IkxpWGlKaXVNZW5nIiwidXNlcl9uYW1lIjoiTGlYaUppdU1lbmcifQ.W2J3u3MfM87-hTLvcX8vihrF-i78K66f1pJUtrlNRVk', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, 'LiXiJiuMeng'),
	(14, 'BaiMei', '李家文', NULL, '', '15952089057', 1, 'http://wework.qpic.cn/bizmail/DOyQP1P7cy7WrD6NfogRHJjACibGtuAicGaE1IqBU2xGuxaQybTs8WaA/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IkJhaU1laSIsInVzZXJfbmFtZSI6IkJhaU1laSJ9.U3VRx1dQjQI9NOAOin7PYxbAVgzVh-Fpz5njXkSUzmg', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, 'BaiMei'),
	(15, '2v8dMaMiHong', '许仁贵', NULL, '', '13301587800', 1, 'http://wework.qpic.cn/bizmail/ftzttnHEOIX9VRSgvyFyaiapFZG8pnwuibx5WCZPKsAia0mDEzBj7CRLg/100', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjc5ODI4NDgxMjcyNjAuMCwiZmxhZyI6MSwiaWF0IjoxNTc5NjYwNzIyNzYwLjAsImlzcyI6IjJ2OGRNYU1pSG9uZyIsInVzZXJfbmFtZSI6IjJ2OGRNYU1pSG9uZyJ9.fEYVxot4XM2gHVTJqxT7CW4NvsII75fkMTmQ0rVmjmk', 1, NULL, NULL, '批次作業', '2022-01-31 11:19:01', NULL, NULL, NULL, NULL, NULL, '2v8dMaMiHong');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_user_dict 结构
DROP TABLE IF EXISTS `sys_user_dict`;
CREATE TABLE IF NOT EXISTS `sys_user_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `dict_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_user_dict_sys_user` (`user_id`),
  KEY `FK_sys_user_dict_sys_dict` (`dict_id`),
  CONSTRAINT `FK_sys_user_dict_sys_dict` FOREIGN KEY (`dict_id`) REFERENCES `sys_dict` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sys_user_dict_sys_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_user_dict 的数据：~3 rows (大约)
DELETE FROM `sys_user_dict`;
/*!40000 ALTER TABLE `sys_user_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_dict` ENABLE KEYS */;

-- 导出  表 gingkolake.sys_user_role 结构
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_user_role_sys_user` (`user_id`),
  KEY `FK_sys_user_role_sys_role` (`role_id`),
  CONSTRAINT `FK_sys_user_role_sys_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sys_user_role_sys_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  gingkolake.sys_user_role 的数据：~21 rows (大约)
DELETE FROM `sys_user_role`;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(4, 2, 2),
	(5, 3, 2),
	(6, 4, 2),
	(11, 9, 2),
	(12, 10, 2),
	(13, 11, 2),
	(14, 12, 2),
	(15, 13, 2),
	(16, 14, 2),
	(17, 15, 2),
	(18, 3, 3),
	(19, 3, 4),
	(20, 3, 5),
	(21, 3, 6),
	(22, 3, 7),
	(24, 2, 2),
	(25, 2, 3),
	(26, 2, 4),
	(27, 2, 5),
	(28, 2, 6),
	(29, 4, 2),
	(30, 4, 3),
	(31, 4, 4),
	(32, 4, 5),
	(33, 4, 6),
	(34, 9, 2),
	(35, 9, 3),
	(36, 9, 4),
	(37, 9, 5),
	(38, 9, 6),
	(39, 10, 2),
	(40, 10, 3),
	(41, 10, 4),
	(42, 10, 5),
	(43, 10, 6),
	(44, 11, 2),
	(45, 11, 3),
	(46, 11, 4),
	(47, 11, 5),
	(48, 11, 6),
	(49, 12, 2),
	(50, 12, 3),
	(51, 12, 4),
	(52, 12, 5),
	(53, 12, 6),
	(54, 13, 2),
	(55, 13, 3),
	(56, 13, 4),
	(57, 13, 5),
	(58, 13, 6),
	(59, 14, 2),
	(60, 14, 3),
	(61, 14, 4),
	(62, 14, 5),
	(63, 14, 6),
	(64, 15, 2),
	(65, 15, 3),
	(66, 15, 4),
	(67, 15, 5),
	(68, 15, 6);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
