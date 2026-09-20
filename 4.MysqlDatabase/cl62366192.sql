-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl62366192
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl62366192`
--

/*!40000 DROP DATABASE IF EXISTS `cl62366192`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl62366192` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl62366192`;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问内容',
  `reply` longtext COMMENT '回复内容',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710985772542 DEFAULT CHARSET=utf8 COMMENT='在线咨询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (41,'2024-03-15 12:03:25',1,'提问内容1','回复内容1',0,1),(42,'2024-03-15 12:03:25',2,'提问内容2','回复内容2',2,2),(43,'2024-03-15 12:03:25',3,'提问内容3','回复内容3',3,3),(44,'2024-03-15 12:03:25',4,'提问内容4','回复内容4',4,4),(45,'2024-03-15 12:03:25',5,'提问内容5','回复内容5',5,5),(46,'2024-03-15 12:03:25',6,'提问内容6','回复内容6',6,6),(1710985772541,'2024-03-21 01:49:31',1,NULL,'哈哈哈',NULL,1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chongwufenlei`
--

DROP TABLE IF EXISTS `chongwufenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chongwufenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chongwuleixing` varchar(200) DEFAULT NULL COMMENT '宠物类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chongwuleixing` (`chongwuleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=1710985724788 DEFAULT CHARSET=utf8 COMMENT='宠物分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chongwufenlei`
--

LOCK TABLES `chongwufenlei` WRITE;
/*!40000 ALTER TABLE `chongwufenlei` DISABLE KEYS */;
INSERT INTO `chongwufenlei` VALUES (61,'2024-03-15 12:03:25','宠物类型1'),(62,'2024-03-15 12:03:25','宠物类型2'),(63,'2024-03-15 12:03:25','宠物类型3'),(64,'2024-03-15 12:03:25','宠物类型4'),(65,'2024-03-15 12:03:25','宠物类型5'),(66,'2024-03-15 12:03:25','宠物类型6'),(1710985724787,'2024-03-21 01:48:44','222');
/*!40000 ALTER TABLE `chongwufenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chongwulingyang`
--

DROP TABLE IF EXISTS `chongwulingyang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chongwulingyang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chongwumingcheng` varchar(200) NOT NULL COMMENT '宠物名称',
  `chongwutupian` longtext COMMENT '宠物图片',
  `chongwupinzhong` varchar(200) DEFAULT NULL COMMENT '宠物品种',
  `chongwuxingbie` varchar(200) DEFAULT NULL COMMENT '宠物性别',
  `chongwunianling` varchar(200) DEFAULT NULL COMMENT '宠物年龄',
  `shenqingshijian` datetime DEFAULT NULL COMMENT '申请时间',
  `shenqingshuoming` longtext COMMENT '申请说明',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='宠物领养';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chongwulingyang`
--

LOCK TABLES `chongwulingyang` WRITE;
/*!40000 ALTER TABLE `chongwulingyang` DISABLE KEYS */;
INSERT INTO `chongwulingyang` VALUES (91,'2024-03-15 12:03:25','宠物名称1','file/chongwulingyangChongwutupian1.jpg,file/chongwulingyangChongwutupian2.jpg,file/chongwulingyangChongwutupian3.jpg','宠物品种1','宠物性别1','宠物年龄1','2024-03-15 20:03:25','申请说明1','账号1','姓名1','19819881111','是',''),(92,'2024-03-15 12:03:25','宠物名称2','file/chongwulingyangChongwutupian2.jpg,file/chongwulingyangChongwutupian3.jpg,file/chongwulingyangChongwutupian4.jpg','宠物品种2','宠物性别2','宠物年龄2','2024-03-15 20:03:25','申请说明2','账号2','姓名2','19819881112','是',''),(93,'2024-03-15 12:03:25','宠物名称3','file/chongwulingyangChongwutupian3.jpg,file/chongwulingyangChongwutupian4.jpg,file/chongwulingyangChongwutupian5.jpg','宠物品种3','宠物性别3','宠物年龄3','2024-03-15 20:03:25','申请说明3','账号3','姓名3','19819881113','是',''),(94,'2024-03-15 12:03:25','宠物名称4','file/chongwulingyangChongwutupian4.jpg,file/chongwulingyangChongwutupian5.jpg,file/chongwulingyangChongwutupian6.jpg','宠物品种4','宠物性别4','宠物年龄4','2024-03-15 20:03:25','申请说明4','账号4','姓名4','19819881114','是',''),(95,'2024-03-15 12:03:25','宠物名称5','file/chongwulingyangChongwutupian5.jpg,file/chongwulingyangChongwutupian6.jpg,file/chongwulingyangChongwutupian7.jpg','宠物品种5','宠物性别5','宠物年龄5','2024-03-15 20:03:25','申请说明5','账号5','姓名5','19819881115','是',''),(96,'2024-03-15 12:03:25','宠物名称6','file/chongwulingyangChongwutupian6.jpg,file/chongwulingyangChongwutupian7.jpg,file/chongwulingyangChongwutupian8.jpg','宠物品种6','宠物性别6','宠物年龄6','2024-03-15 20:03:25','申请说明6','账号6','姓名6','19819881116','是','vv');
/*!40000 ALTER TABLE `chongwulingyang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chongwusongyang`
--

DROP TABLE IF EXISTS `chongwusongyang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chongwusongyang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chongwumingcheng` varchar(200) NOT NULL COMMENT '宠物名称',
  `chongwutupian` longtext COMMENT '宠物图片',
  `chongwuleixing` varchar(200) DEFAULT NULL COMMENT '宠物类型',
  `chongwuxingbie` varchar(200) DEFAULT NULL COMMENT '宠物性别',
  `chongwunianling` varchar(200) DEFAULT NULL COMMENT '宠物年龄',
  `shifouyizhusheyimiao` varchar(200) DEFAULT NULL COMMENT '是否已注射疫苗',
  `shifouyijueyu` varchar(200) DEFAULT NULL COMMENT '是否已绝育',
  `shifouyiquchong` varchar(200) DEFAULT NULL COMMENT '是否已驱虫',
  `shifoumianfei` varchar(200) DEFAULT NULL COMMENT '是否免费',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710985537889 DEFAULT CHARSET=utf8 COMMENT='宠物送养';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chongwusongyang`
--

LOCK TABLES `chongwusongyang` WRITE;
/*!40000 ALTER TABLE `chongwusongyang` DISABLE KEYS */;
INSERT INTO `chongwusongyang` VALUES (121,'2024-03-15 12:03:25','宠物名称1','file/chongwusongyangChongwutupian1.jpg,file/chongwusongyangChongwutupian2.jpg,file/chongwusongyangChongwutupian3.jpg','宠物类型1','宠物性别1','宠物年龄1','是','是','是','免费','2024-03-15 20:03:25','账号1','姓名1','19819881111','是',''),(122,'2024-03-15 12:03:25','宠物名称2','file/chongwusongyangChongwutupian2.jpg,file/chongwusongyangChongwutupian3.jpg,file/chongwusongyangChongwutupian4.jpg','宠物类型2','宠物性别2','宠物年龄2','是','是','是','免费','2024-03-15 20:03:25','账号2','姓名2','19819881112','是',''),(123,'2024-03-15 12:03:25','宠物名称3','file/chongwusongyangChongwutupian3.jpg,file/chongwusongyangChongwutupian4.jpg,file/chongwusongyangChongwutupian5.jpg','宠物类型3','宠物性别3','宠物年龄3','是','是','是','免费','2024-03-15 20:03:25','账号3','姓名3','19819881113','是',''),(124,'2024-03-15 12:03:25','宠物名称4','file/chongwusongyangChongwutupian4.jpg,file/chongwusongyangChongwutupian5.jpg,file/chongwusongyangChongwutupian6.jpg','宠物类型4','宠物性别4','宠物年龄4','是','是','是','免费','2024-03-15 20:03:25','账号4','姓名4','19819881114','是',''),(125,'2024-03-15 12:03:25','宠物名称5','file/chongwusongyangChongwutupian5.jpg,file/chongwusongyangChongwutupian6.jpg,file/chongwusongyangChongwutupian7.jpg','宠物类型5','宠物性别5','宠物年龄5','是','是','是','免费','2024-03-15 20:03:25','账号5','姓名5','19819881115','是',''),(126,'2024-03-15 12:03:25','宠物名称6','file/chongwusongyangChongwutupian6.jpg,file/chongwusongyangChongwutupian7.jpg,file/chongwusongyangChongwutupian8.jpg','宠物类型6','宠物性别6','宠物年龄6','是','是','是','免费','2024-03-15 20:03:25','账号6','姓名6','19819881116','是',''),(1710985537888,'2024-03-21 01:45:37','111','','宠物类型1','母','2','是','','是','免费','2024-03-21 09:42:53','11','依依','','是','222');
/*!40000 ALTER TABLE `chongwusongyang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chongwuxinxi`
--

DROP TABLE IF EXISTS `chongwuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chongwuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chongwumingcheng` varchar(200) NOT NULL COMMENT '宠物名称',
  `chongwutupian` longtext COMMENT '宠物图片',
  `chongwuleixing` varchar(200) DEFAULT NULL COMMENT '宠物类型',
  `chongwupinzhong` varchar(200) DEFAULT NULL COMMENT '宠物品种',
  `chongwuxingbie` varchar(200) NOT NULL COMMENT '宠物性别',
  `chongwunianling` varchar(200) DEFAULT NULL COMMENT '宠物年龄',
  `jiankangzhuangkuang` longtext COMMENT '健康状况',
  `lingyangtiaojian` longtext COMMENT '领养条件',
  `chongwuzhuangtai` varchar(200) DEFAULT NULL COMMENT '宠物状态',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='宠物信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chongwuxinxi`
--

LOCK TABLES `chongwuxinxi` WRITE;
/*!40000 ALTER TABLE `chongwuxinxi` DISABLE KEYS */;
INSERT INTO `chongwuxinxi` VALUES (71,'2024-03-15 12:03:25','宠物名称1','file/chongwuxinxiChongwutupian1.jpg,file/chongwuxinxiChongwutupian2.jpg,file/chongwuxinxiChongwutupian3.jpg','宠物类型1','宠物品种1','公','宠物年龄1','健康状况1','领养条件1','已领养',2),(72,'2024-03-15 12:03:25','宠物名称2','file/chongwuxinxiChongwutupian2.jpg,file/chongwuxinxiChongwutupian3.jpg,file/chongwuxinxiChongwutupian4.jpg','宠物类型2','宠物品种2','公','宠物年龄2','健康状况2','领养条件2','已领养',2),(73,'2024-03-15 12:03:25','宠物名称3','file/chongwuxinxiChongwutupian3.jpg,file/chongwuxinxiChongwutupian4.jpg,file/chongwuxinxiChongwutupian5.jpg','宠物类型3','宠物品种3','公','宠物年龄3','健康状况3','领养条件3','已领养',3),(74,'2024-03-15 12:03:25','宠物名称4','file/chongwuxinxiChongwutupian4.jpg,file/chongwuxinxiChongwutupian5.jpg,file/chongwuxinxiChongwutupian6.jpg','宠物类型4','宠物品种4','公','宠物年龄4','健康状况4','领养条件4','已领养',4),(75,'2024-03-15 12:03:25','宠物名称5','file/chongwuxinxiChongwutupian5.jpg,file/chongwuxinxiChongwutupian6.jpg,file/chongwuxinxiChongwutupian7.jpg','宠物类型5','宠物品种5','公','宠物年龄5','健康状况5','领养条件5','已领养',5),(76,'2024-03-15 12:03:25','宠物名称6','file/chongwuxinxiChongwutupian6.jpg,file/chongwuxinxiChongwutupian7.jpg,file/chongwuxinxiChongwutupian8.jpg','宠物类型6','宠物品种6','公','宠物年龄6','健康状况6','领养条件6','未领养',6);
/*!40000 ALTER TABLE `chongwuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discusschongwuxinxi`
--

DROP TABLE IF EXISTS `discusschongwuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discusschongwuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710984876074 DEFAULT CHARSET=utf8 COMMENT='宠物信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discusschongwuxinxi`
--

LOCK TABLES `discusschongwuxinxi` WRITE;
/*!40000 ALTER TABLE `discusschongwuxinxi` DISABLE KEYS */;
INSERT INTO `discusschongwuxinxi` VALUES (1710984876073,'2024-03-21 01:34:35',71,1710504664535,'','11','1111111111111111111111','');
/*!40000 ALTER TABLE `discusschongwuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lingyangxuqiu`
--

DROP TABLE IF EXISTS `lingyangxuqiu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lingyangxuqiu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `chongwuleixing` varchar(200) DEFAULT NULL COMMENT '宠物类型',
  `lingyangmude` varchar(200) DEFAULT NULL COMMENT '领养目的',
  `lingyangqiwang` longtext COMMENT '领养期望',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710985286239 DEFAULT CHARSET=utf8 COMMENT='领养需求';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lingyangxuqiu`
--

LOCK TABLES `lingyangxuqiu` WRITE;
/*!40000 ALTER TABLE `lingyangxuqiu` DISABLE KEYS */;
INSERT INTO `lingyangxuqiu` VALUES (101,'2024-03-15 12:03:25','账号1','姓名1','宠物类型1','领养目的1','领养期望1','2024-03-15 20:03:25'),(102,'2024-03-15 12:03:25','账号2','姓名2','宠物类型2','领养目的2','领养期望2','2024-03-15 20:03:25'),(103,'2024-03-15 12:03:25','账号3','姓名3','宠物类型3','领养目的3','领养期望3','2024-03-15 20:03:25'),(104,'2024-03-15 12:03:25','账号4','姓名4','宠物类型4','领养目的4','领养期望4','2024-03-15 20:03:25'),(105,'2024-03-15 12:03:25','账号5','姓名5','宠物类型5','领养目的5','领养期望5','2024-03-15 20:03:25'),(106,'2024-03-15 12:03:25','账号6','姓名6','宠物类型6','领养目的6','领养期望6','2024-03-15 20:03:25'),(1710985286238,'2024-03-21 01:41:25','11','依依','宠物类型2','',' bbbbbbbbbbbbbbbbbbbbbbbbbbb','2024-03-21 09:41:10');
/*!40000 ALTER TABLE `lingyangxuqiu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-03-15 12:03:25','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common38\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xeeb2;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-user7\",\"menu\":\"用户管理\",\"unicode\":\"&#xef9d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"审核\"],\"menu\":\"宠物领养\",\"menuJump\":\"列表\",\"tableName\":\"chongwulingyang\"}],\"fontClass\":\"icon-common32\",\"menu\":\"宠物领养管理\",\"unicode\":\"&#xee66;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"审核\"],\"menu\":\"宠物送养\",\"menuJump\":\"列表\",\"tableName\":\"chongwusongyang\"}],\"fontClass\":\"icon-common46\",\"menu\":\"宠物送样管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"宠物分类\",\"menuJump\":\"列表\",\"tableName\":\"chongwufenlei\"}],\"fontClass\":\"icon-common6\",\"menu\":\"宠物分类管理\",\"unicode\":\"&#xedad;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"领养需求\",\"menuJump\":\"列表\",\"tableName\":\"lingyangxuqiu\"}],\"fontClass\":\"icon-common42\",\"menu\":\"领养需求管理\",\"unicode\":\"&#xef24;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"宠物信息\",\"menuJump\":\"列表\",\"tableName\":\"chongwuxinxi\"}],\"fontClass\":\"icon-common25\",\"menu\":\"宠物信息管理\",\"unicode\":\"&#xee09;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"回复\",\"新增\"],\"menu\":\"在线反馈\",\"menuJump\":\"列表\",\"tableName\":\"messages\"}],\"fontClass\":\"icon-common35\",\"menu\":\"留言板管理\",\"unicode\":\"&#xee8c;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"宠物资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common24\",\"menu\":\"宠物资讯管理\",\"unicode\":\"&#xee07;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"在线咨询\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"fontClass\":\"icon-common1\",\"menu\":\"在线咨询管理\",\"unicode\":\"&#xeda3;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"menu\":\"宠物资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"宠物资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"查看评论\",\"申请领养\"],\"menu\":\"宠物信息\",\"menuJump\":\"列表\",\"tableName\":\"chongwuxinxi\"}],\"menu\":\"宠物信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"领养需求\",\"menuJump\":\"列表\",\"tableName\":\"lingyangxuqiu\"}],\"fontClass\":\"icon-common42\",\"menu\":\"领养需求管理\",\"unicode\":\"&#xef24;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common37\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-circle\",\"buttons\":[\"查看\",\"新增\",\"删除\",\"修改\"],\"menu\":\"在线反馈\",\"menuJump\":\"列表\",\"tableName\":\"messages\"}],\"fontClass\":\"icon-common35\",\"menu\":\"留言板管理\",\"unicode\":\"&#xee8c;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"宠物领养\",\"menuJump\":\"列表\",\"tableName\":\"chongwulingyang\"}],\"fontClass\":\"icon-common32\",\"menu\":\"宠物领养管理\",\"unicode\":\"&#xee66;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-qrcode\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"宠物送养\",\"menuJump\":\"列表\",\"tableName\":\"chongwusongyang\"}],\"fontClass\":\"icon-common46\",\"menu\":\"宠物送样管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"在线咨询\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"fontClass\":\"icon-common1\",\"menu\":\"在线咨询管理\",\"unicode\":\"&#xeda3;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"menu\":\"宠物资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"宠物资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"查看评论\",\"申请领养\"],\"menu\":\"宠物信息\",\"menuJump\":\"列表\",\"tableName\":\"chongwuxinxi\"}],\"menu\":\"宠物信息管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext COMMENT '头像',
  `content` longtext NOT NULL COMMENT '留言内容',
  `cpicture` longtext COMMENT '留言图片',
  `reply` longtext COMMENT '回复内容',
  `rpicture` longtext COMMENT '回复图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710985359303 DEFAULT CHARSET=utf8 COMMENT='在线反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (111,'2024-03-15 12:03:25',1,'用户名1','file/messagesAvatarurl1.jpg','留言内容1','file/messagesCpicture1.jpg','回复内容1','file/messagesRpicture1.jpg'),(112,'2024-03-15 12:03:25',2,'用户名2','file/messagesAvatarurl2.jpg','留言内容2','file/messagesCpicture2.jpg','回复内容2','file/messagesRpicture2.jpg'),(113,'2024-03-15 12:03:25',3,'用户名3','file/messagesAvatarurl3.jpg','留言内容3','file/messagesCpicture3.jpg','回复内容3','file/messagesRpicture3.jpg'),(114,'2024-03-15 12:03:25',4,'用户名4','file/messagesAvatarurl4.jpg','留言内容4','file/messagesCpicture4.jpg','回复内容4','file/messagesRpicture4.jpg'),(115,'2024-03-15 12:03:25',5,'用户名5','file/messagesAvatarurl5.jpg','留言内容5','file/messagesCpicture5.jpg','回复内容5','file/messagesRpicture5.jpg'),(116,'2024-03-15 12:03:25',6,'用户名6','file/messagesAvatarurl6.jpg','留言内容6','file/messagesCpicture6.jpg','回复内容6','file/messagesRpicture6.jpg'),(1710985359302,'2024-03-21 01:42:38',1,'11','','6666666666666','file/1710985357889.png','',NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='宠物资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (31,'2024-03-15 12:03:25','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(32,'2024-03-15 12:03:25','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(33,'2024-03-15 12:03:25','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(34,'2024-03-15 12:03:25','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(35,'2024-03-15 12:03:25','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。'),(36,'2024-03-15 12:03:25','孤勇者','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望','file/newsPicture6.jpg','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望，不肯哭一场，爱你破烂的衣裳，却敢堵命运的枪，爱你和我那么像，缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，他们说 要戒了你的狂，就像擦掉了污垢，他们说 要顺台阶而上，而代价是低头，那就让我 不可 乘风，你一样骄傲着 那种孤勇，谁说对弈平凡的不算英雄，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你破烂的衣裳 却敢堵命运的枪，爱你和我那么像 缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，你的斑驳 与众不同 与众不同，你的沉默 震耳欲聋 震耳欲聋，You Are The Hero，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你来自于蛮荒 一生不借谁的光，你将造你的城邦 在废墟之上，去吗 去啊 以最卑微的梦，战吗 战啊 以最孤高的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1710984867670 DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (1710984867669,'2024-03-21 01:34:27',71,'chongwuxinxi','宠物名称1','file/chongwuxinxiChongwutupian1.jpg','1',NULL,NULL,1710504664535);
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1710504664535,'11','yonghu','用户','fpoi4lvt40ulmzaiam6ondcp5ryzsn3h','2024-03-15 12:11:09','2024-03-21 02:34:17'),(2,1,'admin','users','管理员','yq3tqh8n6a7dqhoonao847aotu5lbo0s','2024-03-21 01:34:54','2024-03-21 02:48:01');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-03-15 12:03:25','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `shengri` date DEFAULT NULL COMMENT '生日',
  `suozaichengshi` varchar(200) DEFAULT NULL COMMENT '所在城市',
  `wodechongwu` varchar(200) DEFAULT NULL COMMENT '我的宠物',
  `gerenbiaoqian` varchar(200) DEFAULT NULL COMMENT '个人标签',
  `wodejianjie` longtext COMMENT '我的简介',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1710504664536 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (51,'2024-03-15 12:03:25','账号1','姓名1','123456','file/yonghuTouxiang1.jpg','男','19819881111','2024-03-15','昆明市','暂无','暂无','我的简介1'),(52,'2024-03-15 12:03:25','账号2','姓名2','123456','file/yonghuTouxiang2.jpg','男','19819881112','2024-03-15','昆明市','暂无','暂无','我的简介2'),(53,'2024-03-15 12:03:25','账号3','姓名3','123456','file/yonghuTouxiang3.jpg','男','19819881113','2024-03-15','昆明市','暂无','暂无','我的简介3'),(54,'2024-03-15 12:03:25','账号4','姓名4','123456','file/yonghuTouxiang4.jpg','男','19819881114','2024-03-15','昆明市','暂无','暂无','我的简介4'),(55,'2024-03-15 12:03:25','账号5','姓名5','123456','file/yonghuTouxiang5.jpg','男','19819881115','2024-03-15','昆明市','暂无','暂无','我的简介5'),(56,'2024-03-15 12:03:25','账号6','姓名6','123456','file/yonghuTouxiang6.jpg','男','19819881116','2024-03-15','昆明市','暂无','暂无','我的简介6'),(1710504664535,'2024-03-15 12:11:04','11','依依','11','','男','',NULL,'昆明市','暂无','暂无','');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-21 10:37:57
