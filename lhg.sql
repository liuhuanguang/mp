/*
Navicat MySQL Data Transfer

Source Server         : homestead
Source Server Version : 50722
Source Host           : 127.0.0.1:33060
Source Database       : lhg

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-29 02:22:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_config
-- ----------------------------
DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_config
-- ----------------------------

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Index', 'fa-bar-chart', '/', null, null);
INSERT INTO `admin_menu` VALUES ('2', '0', '2', 'Admin', 'fa-tasks', '', null, null);
INSERT INTO `admin_menu` VALUES ('3', '2', '3', 'Users', 'fa-users', 'auth/users', null, null);
INSERT INTO `admin_menu` VALUES ('4', '2', '4', 'Roles', 'fa-user', 'auth/roles', null, null);
INSERT INTO `admin_menu` VALUES ('5', '2', '5', 'Permission', 'fa-ban', 'auth/permissions', null, null);
INSERT INTO `admin_menu` VALUES ('6', '2', '6', 'Menu', 'fa-bars', 'auth/menu', null, null);
INSERT INTO `admin_menu` VALUES ('7', '2', '7', 'Operation log', 'fa-history', 'auth/logs', null, null);
INSERT INTO `admin_menu` VALUES ('8', '0', '7', 'Helpers', 'fa-gears', '', '2018-08-28 17:03:17', '2018-08-28 17:03:17');
INSERT INTO `admin_menu` VALUES ('9', '8', '8', 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', '2018-08-28 17:03:17', '2018-08-28 17:03:17');
INSERT INTO `admin_menu` VALUES ('10', '8', '9', 'Database terminal', 'fa-database', 'helpers/terminal/database', '2018-08-28 17:03:17', '2018-08-28 17:03:17');
INSERT INTO `admin_menu` VALUES ('11', '8', '10', 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', '2018-08-28 17:03:17', '2018-08-28 17:03:17');
INSERT INTO `admin_menu` VALUES ('12', '8', '11', 'Routes', 'fa-list-alt', 'helpers/routes', '2018-08-28 17:03:17', '2018-08-28 17:03:17');
INSERT INTO `admin_menu` VALUES ('13', '0', '12', 'Config', 'fa-toggle-on', 'config', '2018-08-28 17:07:32', '2018-08-28 17:07:32');
INSERT INTO `admin_menu` VALUES ('14', '0', '13', 'Config', 'fa-toggle-on', 'config', '2018-08-28 17:15:23', '2018-08-28 17:15:23');
INSERT INTO `admin_menu` VALUES ('15', '0', '13', 'Helpers', 'fa-gears', '', '2018-08-28 17:15:33', '2018-08-28 17:15:33');
INSERT INTO `admin_menu` VALUES ('16', '15', '14', 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', '2018-08-28 17:15:33', '2018-08-28 17:15:33');
INSERT INTO `admin_menu` VALUES ('17', '15', '15', 'Database terminal', 'fa-database', 'helpers/terminal/database', '2018-08-28 17:15:33', '2018-08-28 17:15:33');
INSERT INTO `admin_menu` VALUES ('18', '15', '16', 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', '2018-08-28 17:15:33', '2018-08-28 17:15:33');
INSERT INTO `admin_menu` VALUES ('19', '15', '17', 'Routes', 'fa-list-alt', 'helpers/routes', '2018-08-28 17:15:33', '2018-08-28 17:15:33');
INSERT INTO `admin_menu` VALUES ('20', '0', '17', 'Helpers', 'fa-gears', '', '2018-08-28 17:15:41', '2018-08-28 17:15:41');
INSERT INTO `admin_menu` VALUES ('21', '20', '18', 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', '2018-08-28 17:15:41', '2018-08-28 17:15:41');
INSERT INTO `admin_menu` VALUES ('22', '20', '19', 'Database terminal', 'fa-database', 'helpers/terminal/database', '2018-08-28 17:15:41', '2018-08-28 17:15:41');
INSERT INTO `admin_menu` VALUES ('23', '20', '20', 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', '2018-08-28 17:15:41', '2018-08-28 17:15:41');
INSERT INTO `admin_menu` VALUES ('24', '20', '21', 'Routes', 'fa-list-alt', 'helpers/routes', '2018-08-28 17:15:41', '2018-08-28 17:15:41');
INSERT INTO `admin_menu` VALUES ('25', '0', '22', 'Exception Reporter', 'fa-bug', 'exceptions', '2018-08-28 17:23:37', '2018-08-28 17:23:37');
INSERT INTO `admin_menu` VALUES ('26', '0', '23', 'Media manager', 'fa-file', 'media', '2018-08-28 17:31:19', '2018-08-28 17:31:19');
INSERT INTO `admin_menu` VALUES ('27', '0', '24', 'Backup', 'fa-copy', 'backup', '2018-08-28 17:37:42', '2018-08-28 17:37:42');
INSERT INTO `admin_menu` VALUES ('28', '0', '25', 'Redis manager', 'fa-database', 'redis', '2018-08-28 17:40:12', '2018-08-28 17:40:12');
INSERT INTO `admin_menu` VALUES ('29', '0', '26', 'Log viewer', 'fa-database', 'logs', '2018-08-28 17:43:05', '2018-08-28 17:43:05');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.10.1', '[]', '2018-08-28 16:57:05', '2018-08-28 16:57:05');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '192.168.10.1', '[]', '2018-08-28 16:58:25', '2018-08-28 16:58:25');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/helpers/scaffold', 'GET', '192.168.10.1', '[]', '2018-08-28 17:03:34', '2018-08-28 17:03:34');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/helpers/scaffold', 'GET', '192.168.10.1', '[]', '2018-08-28 17:06:40', '2018-08-28 17:06:40');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:06:47', '2018-08-28 17:06:47');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:06:50', '2018-08-28 17:06:50');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:06:52', '2018-08-28 17:06:52');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:06:54', '2018-08-28 17:06:54');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/config', 'GET', '192.168.10.1', '[]', '2018-08-28 17:07:10', '2018-08-28 17:07:10');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:08:21', '2018-08-28 17:08:21');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:08:26', '2018-08-28 17:08:26');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/helpers/terminal/database', 'POST', '192.168.10.1', '{\"c\":\"db:mysql\",\"q\":\"sadas\",\"_token\":\"X8V1woLJ0mFDVVcOxBoEpl63bVRyWKiopWApGf5U\"}', '2018-08-28 17:08:38', '2018-08-28 17:08:38');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:08:45', '2018-08-28 17:08:45');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:08:57', '2018-08-28 17:08:57');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:08:59', '2018-08-28 17:08:59');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/helpers/routes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:09:10', '2018-08-28 17:09:10');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:10:14', '2018-08-28 17:10:14');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin', 'GET', '192.168.10.1', '[]', '2018-08-28 17:16:41', '2018-08-28 17:16:41');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/exceptions', 'GET', '192.168.10.1', '[]', '2018-08-28 17:25:11', '2018-08-28 17:25:11');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/exceptions', 'GET', '192.168.10.1', '[]', '2018-08-28 17:26:11', '2018-08-28 17:26:11');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:26:15', '2018-08-28 17:26:15');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:26:17', '2018-08-28 17:26:17');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:26:20', '2018-08-28 17:26:20');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:26:21', '2018-08-28 17:26:21');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/config', 'GET', '192.168.10.1', '[]', '2018-08-28 17:26:24', '2018-08-28 17:26:24');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/exceptions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:26:28', '2018-08-28 17:26:28');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/exceptions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:26:30', '2018-08-28 17:26:30');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/exceptions', 'GET', '192.168.10.1', '[]', '2018-08-28 17:27:32', '2018-08-28 17:27:32');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:40', '2018-08-28 17:27:40');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:43', '2018-08-28 17:27:43');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:45', '2018-08-28 17:27:45');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/helpers/terminal/artisan', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:46', '2018-08-28 17:27:46');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/config', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:47', '2018-08-28 17:27:47');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/helpers/scaffold', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:49', '2018-08-28 17:27:49');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/helpers/terminal/database', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:27:51', '2018-08-28 17:27:51');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:29:04', '2018-08-28 17:29:04');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/media', 'GET', '192.168.10.1', '[]', '2018-08-28 17:31:56', '2018-08-28 17:31:56');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/media', 'GET', '192.168.10.1', '{\"path\":\"\\/\",\"view\":\"table\",\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:32:02', '2018-08-28 17:32:02');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/media', 'GET', '192.168.10.1', '{\"path\":\"\\/\",\"view\":\"list\",\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:32:03', '2018-08-28 17:32:03');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/media', 'GET', '192.168.10.1', '{\"path\":\"\\/\",\"view\":\"list\"}', '2018-08-28 17:32:07', '2018-08-28 17:32:07');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/media', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:32:11', '2018-08-28 17:32:11');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-28 17:34:40', '2018-08-28 17:34:40');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/backup', 'GET', '192.168.10.1', '[]', '2018-08-28 17:37:50', '2018-08-28 17:37:50');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/backup/run', 'POST', '192.168.10.1', '{\"_token\":\"X8V1woLJ0mFDVVcOxBoEpl63bVRyWKiopWApGf5U\"}', '2018-08-28 17:37:57', '2018-08-28 17:37:57');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/redis', 'GET', '192.168.10.1', '[]', '2018-08-28 17:40:24', '2018-08-28 17:40:24');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/logs', 'GET', '192.168.10.1', '[]', '2018-08-28 17:43:13', '2018-08-28 17:43:13');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/logs', 'GET', '192.168.10.1', '[]', '2018-08-28 17:52:06', '2018-08-28 17:52:06');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', 'Admin helpers', 'ext.helpers', null, '/helpers/*', '2018-08-28 17:03:17', '2018-08-28 17:03:17');
INSERT INTO `admin_permissions` VALUES ('7', 'Admin Config', 'ext.config', null, '/config*', '2018-08-28 17:07:32', '2018-08-28 17:07:32');
INSERT INTO `admin_permissions` VALUES ('11', 'Exceptions reporter', 'ext.reporter', null, '/exceptions*', '2018-08-28 17:23:37', '2018-08-28 17:23:37');
INSERT INTO `admin_permissions` VALUES ('12', 'Media manager', 'ext.media-manager', null, '/media*', '2018-08-28 17:31:19', '2018-08-28 17:31:19');
INSERT INTO `admin_permissions` VALUES ('13', 'Backup', 'ext.backup', null, '/backup*', '2018-08-28 17:37:42', '2018-08-28 17:37:42');
INSERT INTO `admin_permissions` VALUES ('14', 'Redis Manager', 'ext.redis-manager', null, '/redis*', '2018-08-28 17:40:12', '2018-08-28 17:40:12');
INSERT INTO `admin_permissions` VALUES ('15', 'Logs', 'ext.log-viewer', null, '/logs*', '2018-08-28 17:43:05', '2018-08-28 17:43:05');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2018-08-28 16:56:14', '2018-08-28 16:56:14');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$bAtx8wI3l6M.WpKq4lsqgO/tEyy82tNpFs6fVB0fdmROVGSCPJ62a', 'Administrator', null, null, '2018-08-28 16:56:14', '2018-08-28 16:56:14');

-- ----------------------------
-- Table structure for laravel_exceptions
-- ----------------------------
DROP TABLE IF EXISTS `laravel_exceptions`;
CREATE TABLE `laravel_exceptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` int(11) NOT NULL,
  `trace` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookies` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of laravel_exceptions
-- ----------------------------
INSERT INTO `laravel_exceptions` VALUES ('1', 'Symfony\\Component\\Console\\Exception\\CommandNotFoundException', '0', 'Command \"optimize\" is not defined.', '/home/vagrant/www/new/vendor/symfony/console/Application.php', '632', '#0 /home/vagrant/www/new/vendor/symfony/console/Application.php(226): Symfony\\Component\\Console\\Application->find(\'optimize\')\n#1 /home/vagrant/www/new/vendor/symfony/console/Application.php(145): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#2 /home/vagrant/www/new/vendor/laravel/framework/src/Illuminate/Console/Application.php(89): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#3 /home/vagrant/www/new/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#4 /home/vagrant/www/new/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#5 {main}', 'GET', '/', '[]', '', '[]', '{\"host\":[\"localhost\"],\"user-agent\":[\"Symfony\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\"],\"accept-language\":[\"en-us,en;q=0.5\"],\"accept-charset\":[\"ISO-8859-1,utf-8;q=0.7,*;q=0.7\"]}', '[\"127.0.0.1\"]', '2018-08-28 18:02:42', '2018-08-28 18:02:42');
INSERT INTO `laravel_exceptions` VALUES ('2', 'Symfony\\Component\\Console\\Exception\\CommandNotFoundException', '0', 'Command \"optimize\" is not defined.', '/home/vagrant/www/new/vendor/symfony/console/Application.php', '632', '#0 /home/vagrant/www/new/vendor/symfony/console/Application.php(226): Symfony\\Component\\Console\\Application->find(\'optimize\')\n#1 /home/vagrant/www/new/vendor/symfony/console/Application.php(145): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#2 /home/vagrant/www/new/vendor/laravel/framework/src/Illuminate/Console/Application.php(89): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#3 /home/vagrant/www/new/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#4 /home/vagrant/www/new/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#5 {main}', 'GET', '/', '[]', '', '[]', '{\"host\":[\"localhost\"],\"user-agent\":[\"Symfony\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\"],\"accept-language\":[\"en-us,en;q=0.5\"],\"accept-charset\":[\"ISO-8859-1,utf-8;q=0.7,*;q=0.7\"]}', '[\"127.0.0.1\"]', '2018-08-28 18:02:48', '2018-08-28 18:02:48');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2017_07_17_040159_create_config_table', '2');
INSERT INTO `migrations` VALUES ('5', '2017_07_17_040159_create_exceptions_table', '3');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
