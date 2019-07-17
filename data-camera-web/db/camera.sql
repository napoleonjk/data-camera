/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.26-log : Database - datacamera
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`datacamera` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `datacamera`;

/*Table structure for table `dc_backend_sensor_register` */

DROP TABLE IF EXISTS `dc_backend_sensor_register`;

CREATE TABLE `dc_backend_sensor_register` (
  `sensor_code` varchar(255) NOT NULL,
  `is_registered` int(11) DEFAULT '0',
  `live_address` varchar(255) DEFAULT NULL,
  `sensor_config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sensor_code`),
  KEY `FKa3oy80c17nkyetyrcxpejbtdu` (`sensor_config_id`),
  CONSTRAINT `FKa3oy80c17nkyetyrcxpejbtdu` FOREIGN KEY (`sensor_config_id`) REFERENCES `dc_base_sensor_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_backend_sensor_register` */

insert  into `dc_backend_sensor_register`(`sensor_code`,`is_registered`,`live_address`,`sensor_config_id`) values ('001',1,NULL,1);

/*Table structure for table `dc_base_app_info` */

DROP TABLE IF EXISTS `dc_base_app_info`;

CREATE TABLE `dc_base_app_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `app_creator` varchar(255) NOT NULL,
  `app_description` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `app_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dc_base_app_info` */

insert  into `dc_base_app_info`(`id`,`create_time`,`app_creator`,`app_description`,`is_deleted`,`modify_time`,`app_name`) values (1,'2019-07-17 23:32:07','root','测试场景',0,'2019-07-17 23:32:07','JK测试');

/*Table structure for table `dc_base_experiment_info` */

DROP TABLE IF EXISTS `dc_base_experiment_info`;

CREATE TABLE `dc_base_experiment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `is_monitor` int(11) DEFAULT '0',
  `is_recorder` int(11) DEFAULT '0',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq21u4ljprmr0hfxwdh79i2l8f` (`app_id`),
  CONSTRAINT `FKq21u4ljprmr0hfxwdh79i2l8f` FOREIGN KEY (`app_id`) REFERENCES `dc_base_app_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dc_base_experiment_info` */

insert  into `dc_base_experiment_info`(`id`,`create_time`,`description`,`is_deleted`,`is_monitor`,`is_recorder`,`modify_time`,`name`,`app_id`) values (1,'2019-07-17 23:37:18','压力传感器',0,0,0,'2019-07-17 23:37:18','压力传感器',1);

/*Table structure for table `dc_base_sensor_config` */

DROP TABLE IF EXISTS `dc_base_sensor_config`;

CREATE TABLE `dc_base_sensor_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dimension` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dc_base_sensor_config` */

insert  into `dc_base_sensor_config`(`id`,`dimension`,`name`,`type`,`unit`) values (1,'sd','dsf',1,'sdfsd');

/*Table structure for table `dc_base_sensor_info` */

DROP TABLE IF EXISTS `dc_base_sensor_info`;

CREATE TABLE `dc_base_sensor_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT '0',
  `sensor_code` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `sensor_creator` varchar(255) NOT NULL,
  `sensor_description` varchar(255) DEFAULT NULL,
  `exp_id` bigint(20) DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `sensor_mark` varchar(255) DEFAULT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sensor_name` varchar(255) NOT NULL,
  `track_id` bigint(20) DEFAULT '0',
  `sensor_config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9kq5w2vg3bujs7b6r37lqe1hi` (`sensor_config_id`),
  CONSTRAINT `FK9kq5w2vg3bujs7b6r37lqe1hi` FOREIGN KEY (`sensor_config_id`) REFERENCES `dc_base_sensor_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dc_base_sensor_info` */

insert  into `dc_base_sensor_info`(`id`,`app_id`,`sensor_code`,`create_time`,`sensor_creator`,`sensor_description`,`exp_id`,`img`,`is_deleted`,`sensor_mark`,`modify_time`,`sensor_name`,`track_id`,`sensor_config_id`) values (2,1,'001','2019-07-17 23:30:48','root','设备1',1,'http://www.stemcloud.cn/uploads/dc/images/share-device-1563377493066.png',0,NULL,'2019-07-17 23:37:18','设备1',1,1);

/*Table structure for table `dc_base_track_info` */

DROP TABLE IF EXISTS `dc_base_track_info`;

CREATE TABLE `dc_base_track_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` int(11) DEFAULT '0',
  `experiment_id` bigint(20) DEFAULT NULL,
  `sensor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdp8px737xp68ewpdgqgoqypig` (`experiment_id`),
  KEY `FK4wp1ekndk9yybbwdratmjjoqd` (`sensor_id`),
  CONSTRAINT `FK4wp1ekndk9yybbwdratmjjoqd` FOREIGN KEY (`sensor_id`) REFERENCES `dc_base_sensor_info` (`id`),
  CONSTRAINT `FKdp8px737xp68ewpdgqgoqypig` FOREIGN KEY (`experiment_id`) REFERENCES `dc_base_experiment_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dc_base_track_info` */

insert  into `dc_base_track_info`(`id`,`create_time`,`is_deleted`,`modify_time`,`type`,`experiment_id`,`sensor_id`) values (1,'2019-07-17 23:37:18',0,'2019-07-17 23:37:18',1,1,2);

/*Table structure for table `dc_data_content_info` */

DROP TABLE IF EXISTS `dc_data_content_info`;

CREATE TABLE `dc_data_content_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `comment_count` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `is_shared` int(11) DEFAULT '0',
  `like_count` int(11) DEFAULT '0',
  `owner` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `view_count` int(11) DEFAULT '0',
  `recorder_info_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1kf7bx67jjlqu54wtm56c8h3n` (`recorder_info_id`),
  CONSTRAINT `FK1kf7bx67jjlqu54wtm56c8h3n` FOREIGN KEY (`recorder_info_id`) REFERENCES `dc_data_recorder_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_data_content_info` */

/*Table structure for table `dc_data_recorder_info` */

DROP TABLE IF EXISTS `dc_data_recorder_info`;

CREATE TABLE `dc_data_recorder_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `devices` varchar(255) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `exp_id` bigint(20) NOT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `is_recorder` int(11) DEFAULT '1',
  `is_user_generate` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '-1',
  `start_seconds` int(11) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_data_recorder_info` */

/*Table structure for table `dc_data_value_data` */

DROP TABLE IF EXISTS `dc_data_value_data`;

CREATE TABLE `dc_data_value_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `data_key` varchar(255) DEFAULT NULL,
  `data_mark` varchar(255) DEFAULT NULL,
  `sensor_id` bigint(20) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `data_value` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_data_value_data` */

/*Table structure for table `dc_data_video_data` */

DROP TABLE IF EXISTS `dc_data_video_data`;

CREATE TABLE `dc_data_video_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sensor_id` bigint(20) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `video_poster` varchar(255) DEFAULT NULL,
  `recorder_info_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5v4i1uynfvusims7hsuvu009r` (`recorder_info_id`),
  CONSTRAINT `FK5v4i1uynfvusims7hsuvu009r` FOREIGN KEY (`recorder_info_id`) REFERENCES `dc_data_recorder_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_data_video_data` */

/*Table structure for table `dc_sys_resource` */

DROP TABLE IF EXISTS `dc_sys_resource`;

CREATE TABLE `dc_sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL,
  `resource_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_sys_resource` */

/*Table structure for table `dc_sys_role` */

DROP TABLE IF EXISTS `dc_sys_role`;

CREATE TABLE `dc_sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_sys_role` */

/*Table structure for table `dc_sys_role_sys_resources` */

DROP TABLE IF EXISTS `dc_sys_role_sys_resources`;

CREATE TABLE `dc_sys_role_sys_resources` (
  `sys_role_id` bigint(20) NOT NULL,
  `sys_resources_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sys_role_id`,`sys_resources_id`),
  KEY `FKsls87twobbtv3tv8ep6kpuafr` (`sys_resources_id`),
  CONSTRAINT `FKg4dm7mpxwplhrcv1wqx0t6pw4` FOREIGN KEY (`sys_role_id`) REFERENCES `dc_sys_role` (`id`),
  CONSTRAINT `FKsls87twobbtv3tv8ep6kpuafr` FOREIGN KEY (`sys_resources_id`) REFERENCES `dc_sys_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_sys_role_sys_resources` */

/*Table structure for table `dc_sys_user` */

DROP TABLE IF EXISTS `dc_sys_user`;

CREATE TABLE `dc_sys_user` (
  `user_name` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  KEY `FKq4q16an83wdnw5dl9ih73edss` (`role_id`),
  CONSTRAINT `FKq4q16an83wdnw5dl9ih73edss` FOREIGN KEY (`role_id`) REFERENCES `dc_sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_sys_user` */

/*Table structure for table `dc_user_define_chart` */

DROP TABLE IF EXISTS `dc_user_define_chart`;

CREATE TABLE `dc_user_define_chart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recorder_id` bigint(20) DEFAULT NULL,
  `sensor_id` bigint(20) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dc_user_define_chart` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
