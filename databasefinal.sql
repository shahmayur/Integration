/*
SQLyog Enterprise - MySQL GUI v8.2 
MySQL - 5.0.45-community-nt : Database - capstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`capstore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `capstore`;

/*Table structure for table `advertisement` */

DROP TABLE IF EXISTS `advertisement`;

CREATE TABLE `advertisement` (
  `advertisement_id` bigint(255) default NULL,
  `media_id` bigint(255) default NULL,
  `advertisement_entryid` bigint(255) NOT NULL auto_increment,
  `advertisement_startdate` date default NULL,
  `advertisement_enddate` date default NULL,
  PRIMARY KEY  (`advertisement_entryid`),
  UNIQUE KEY `NewIndex1` (`media_id`),
  CONSTRAINT `FK_advertisement` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `advertisement` */

insert  into `advertisement`(`advertisement_id`,`media_id`,`advertisement_entryid`,`advertisement_startdate`,`advertisement_enddate`) values (1,1,1,'2013-10-26','2013-10-28'),(2,2,2,'2013-10-26','2013-10-28'),(3,3,3,'2013-10-26','2013-10-28');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` varchar(255) NOT NULL default '',
  `category_name` varchar(255) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values ('CAT_01','Clothing'),('CAT_02','Mobiles'),('CAT_03','Cosmetics'),('CAT_04','Footwear'),('CAT_05','Computers');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `user_id` varchar(255) default NULL,
  `feedback_id` bigint(255) NOT NULL auto_increment,
  `id` varchar(255) default NULL,
  `feedback_content` varchar(500) default NULL,
  `feedback_date` date default NULL,
  `rating` double default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`feedback_id`),
  KEY `FK_feedback` (`user_id`),
  KEY `FK_feedbackproduct` (`id`),
  CONSTRAINT `FK_feedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `media_id` bigint(255) NOT NULL auto_increment,
  `media_path` varchar(255) default NULL,
  `media_type` varchar(255) default NULL,
  `product_id` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`),
  KEY `FK_media` (`product_id`),
  CONSTRAINT `FK_media` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `media` */

insert  into `media`(`media_id`,`media_path`,`media_type`,`product_id`) values (1,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg','iamge','P_21M_001'),(2,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg','image','P_22M_001'),(3,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg','images','P_23M_001'),(4,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_24M_001'),(5,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_25M_001'),(6,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_31M_001'),(7,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_32M_001'),(8,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_41M_001'),(9,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_42M_001'),(10,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_43M_001'),(11,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_44M_001'),(12,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_45M_001'),(13,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_52M_001'),(14,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_54M_001'),(15,'/CapStoreImageUpload/Albums/Nokia Lumia 720/1.jpg',NULL,'P_55M_001');

/*Table structure for table `merchant` */

DROP TABLE IF EXISTS `merchant`;

CREATE TABLE `merchant` (
  `merchant_id` varchar(255) NOT NULL default '',
  `merchant_name` varchar(255) default NULL,
  `merchant_type` varchar(255) default NULL,
  `merchant_email` varchar(255) default NULL,
  `merchant_status` varchar(255) default NULL,
  `merchant_address` varchar(500) default NULL,
  `merchant_password` varchar(255) default NULL,
  `merchant_securityquestion` varchar(255) default NULL,
  `merchant_securityanswer` varchar(255) default NULL,
  `merchant_addeddate` date default NULL,
  `merchant_removeddate` date default NULL,
  PRIMARY KEY  (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `merchant` */

insert  into `merchant`(`merchant_id`,`merchant_name`,`merchant_type`,`merchant_email`,`merchant_status`,`merchant_address`,`merchant_password`,`merchant_securityquestion`,`merchant_securityanswer`,`merchant_addeddate`,`merchant_removeddate`) values ('m0',NULL,NULL,NULL,'INACTIVE',NULL,NULL,NULL,NULL,'2013-10-25','2013-10-25'),('M_0001','first merchant','Third Party','sangita.das@capgemini.com','ACTIVE','aaaaaaaaaaaa','PubZup3hiaUD6RrLYxWn4w==','What is the first alphabet of your company name?','c','2013-10-26',NULL),('M_0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('M_0003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('M_0004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('M_0005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `scheme_id` bigint(255) NOT NULL auto_increment,
  `scheme_name` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `merchant_id` varchar(255) default NULL,
  `scheme_description` varchar(500) default NULL,
  PRIMARY KEY  (`scheme_id`),
  KEY `FK_offer` (`merchant_id`),
  CONSTRAINT `FK_offer` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `offer` */

insert  into `offer`(`scheme_id`,`scheme_name`,`value`,`type`,`merchant_id`,`scheme_description`) values (1,'20000','20','cart',NULL,'20 off on 20000'),(2,'OFF20','20','product','M_0001','hgrhgjsgjwgejg'),(3,'Diwali25','25','product','M_0001','buy 1 at 25 off'),(4,'P_25M_001','2','buyandget','M_0001','buy one vaio get two free');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` bigint(255) NOT NULL auto_increment,
  `user_id` varchar(255) default NULL,
  `order_date` date default NULL,
  `cart_value` double default NULL,
  `order_status` varchar(255) default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `FK_orders` (`user_id`),
  CONSTRAINT `FK_orders` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`user_id`,`order_date`,`cart_value`,`order_status`) values (1,'C_1234','2013-10-26',20000,'shipped');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` varchar(255) NOT NULL default '',
  `category_id` varchar(255) default NULL,
  `merchant_id` varchar(255) default NULL,
  `product_cost` double default NULL,
  `product_name` varchar(255) default NULL,
  `product_tag` varchar(255) default NULL,
  `product_creationdate` date default NULL,
  `product_solddate` date default '0000-00-00',
  `product_brand` varchar(255) default NULL,
  `product_stock` bigint(255) default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `FK_product` (`category_id`),
  KEY `FK_productmerchant` (`merchant_id`),
  CONSTRAINT `FK_productcategory` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_productmerchant` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`product_id`,`category_id`,`merchant_id`,`product_cost`,`product_name`,`product_tag`,`product_creationdate`,`product_solddate`,`product_brand`,`product_stock`) values ('P_01M_0001','CAT_01','M_0001',2899,'Jeans','pant jeans trouser cloth ','2013-10-27',NULL,'lee',100),('P_02M_0001','CAT_01','M_0001',1599,'T-shirt','shirt t-shirt tshirt cloth','2013-10-27',NULL,'Lee cooper',120),('P_03M_0001','CAT_01','M_0001',1999,'Trouser','pant  trouser cloth ','2013-10-27',NULL,'Allen Solly',90),('P_04M_0001','CAT_01','M_0001',5699,'Jacket','pullover jacket leather cloth','2013-10-27',NULL,'Gucci',50),('P_05M_0001','CAT_01','M_0001',899,'Casual Shirt','shirt t-shirt casual tshirt cloth','2013-10-27',NULL,'Levi\'s',250),('P_06M_0001','CAT_01','M_0001',3590,'Salwar','salwar kameez traditional kurti cloth','2013-10-27',NULL,'Akriti',200),('P_07M_0001','CAT_01','M_0001',1290,'Top','top shirt cloth','2013-10-27',NULL,'Prapti',150),('P_08M_0001','CAT_01','M_0001',670,'Tie','tie necktie neck','2013-10-27',NULL,'Moustache',450),('P_09M_0001','CAT_01','M_0001',1869,'Pant','pant trouser cloth','2013-10-27',NULL,'Pepe',70),('P_10M_0001','CAT_01','M_0001',1200,'Formal Shirt','shirt formal cloth','2013-10-27',NULL,'Peter England',300),('P_11M_0002','CAT_02','M_0002',19000,'Samsung S2','phone mobile cell samsung S2','2013-10-27',NULL,'Samsung',200),('P_12M_0002','CAT_02','M_0002',45000,'HTC One','phone mobile cell htc htcone one','2013-10-27',NULL,'HTC',300),('P_13M_0002','CAT_02','M_0002',4599,'Nokia Asha 200','phone mobile cell asha nokia nokiaasha','2013-10-27',NULL,'Nokia',684),('P_14M_0002','CAT_02','M_0002',38000,'Sony xperia z','phone mobile cell sony xperia z ','2013-10-27',NULL,'Sony',80),('P_15M_0002','CAT_02','M_0002',12000,'Micromax Canvas HD','phone mobile cell micromax Micromax Canvas HD','2013-10-27',NULL,'Micromax',250),('P_16M_0002','CAT_02','M_0002',36000,'LG G2','phone mobile cell lg LG G2','2013-10-27',NULL,'LG',200),('P_17M_0002','CAT_02','M_0002',20000,'Motorola moto X','phone mobile cell motorola moto x  Motorola moto X','2013-10-27',NULL,'Motorola',550),('P_18M_0002','CAT_02','M_0002',67000,' iPhone 5S','phone mobile cell apple iPhone iphone 5S','2013-10-27',NULL,'Apple',150),('P_19M_0002','CAT_02','M_0002',50000,'Samsung Galaxy note III','phone mobile cell Samsung Galaxy note III ','2013-10-27',NULL,'Samsung',280),('P_20M_0002','CAT_02','M_0002',17000,'Nokia lumia720','phone mobile cell nokia lumia 720','2013-10-27',NULL,'Nokia',500),('P_21M_0005','CAT_05','M_0005',38000,'XPS 15','laptop pc computer dell xps 15','2013-10-27',NULL,'Dell',170),('P_21M_001','CAT_02','M_0001',38999,'XPS 15','laptop pc dell xps 15 computer notebook','2013-10-26',NULL,'Dell',30),('P_22M_0005','CAT_05','M_0005',26000,'K500','laptop pc computer lenovo k500','2013-10-27',NULL,'Lenovo',380),('P_22M_001','CAT_02','M_0001',25999,'K500','laptop pc lenovo ibm K500 computer notebook','2013-10-26',NULL,'Lenovo',120),('P_23M_0005','CAT_05','M_0005',41000,'Pavillion DV9','laptop pc computer hp Pavillion DV9','2013-10-27',NULL,'HP',230),('P_23M_001','CAT_02','M_0001',41999,'Pavillion DV9','laptop pc hp pavillion DV9 computer notebook','2013-10-26',NULL,'HP',90),('P_24M_0005','CAT_05','M_0005',25000,'Ultrabook 500','laptop pc computer asus Ultrabook 500','2013-10-27',NULL,'ASUS',90),('P_24M_001','CAT_02','M_0001',25699,'Ultrabook 500','laptop pc Ultrabook 500 computer notebook','2013-10-26',NULL,'ASUS',50),('P_25M_0005','CAT_05','M_0005',49000,'VAIO P','laptop pc computer sony vaio p notebook','2013-10-27',NULL,'Sony',210),('P_25M_001','CAT_02','M_0001',49899,'VAIO P','laptop sony vaio p computer notebook','2013-10-26',NULL,'Sony',250),('P_26M_0005','CAT_05','M_0005',25000,'Me','laptop pc computer hcl me','2013-10-27',NULL,'Hcl',300),('P_27M_0005','CAT_05','M_0005',30000,'NP','laptop pc computer samsung np ','2013-10-27',NULL,'Samsung',140),('P_28M_0005','CAT_05','M_0005',75000,'MacBook','laptop pc computer apple macbook','2013-10-27',NULL,'Apple',270),('P_29M_0005','CAT_05','M_0005',26000,'Inspiron','laptop pc computer dell inspiron','2013-10-27',NULL,'Dell',220),('P_30M_0005','CAT_05','M_0005',23000,'IPAD Mini','laptop pc computer ipad apple mini','2013-10-27',NULL,'Apple',100),('p_31M_0003','CAT_04','M_0003',2400,'nike casuals','nike shoes footwear sports ','2013-10-27',NULL,'Nike',500),('P_31M_001','CAT_02','M_0001',2599,'Nike Casuals','nike shoes casual sports footwear','2013-10-26',NULL,'Nike',200),('p_32M_0003','CAT_04','M_0003',2200,'adidas T400 sports','adidas shoes footwear sports','2013-10-27',NULL,'Adidas',200),('P_32M_001','CAT_02','M_0001',2299,'Adidas T400 Sports','adidas shoes casual sports footwear','2013-10-26',NULL,'Adidas',100),('p_33M_0003','CAT_04','M_0003',3000,'Rough trek','woodland shoes footwear sports trek','2013-10-27',NULL,'Woodland',300),('P_33M_001','CAT_02','M_0001',2999,'Rough Trek 6','woodland shoes rough trekking footwear','2013-10-26',NULL,'Woodland',40),('p_34M_0003','CAT_04','M_0003',2500,'fottball 8','reebok shoes footwear sports','2013-10-27',NULL,'Reebok',100),('P_34M_001','CAT_02','M_0001',7899,'Football 8','sports reebok football shoes footwear','2013-10-26',NULL,'Reebok',70),('p_35M_0003','CAT_04','M_0003',1200,'sports sneakers','Converse shoes footwear sports sneakers','2013-10-27',NULL,'Converse',375),('P_35M_001','CAT_02','M_0001',2599,'Sports Sneakers','sneakers converse shoes casual footwear','2013-10-26',NULL,'Converse',30),('P_36M_0003','CAT_04','M_0003',900,'Sandal','bata sandal  shoe footwear','2013-10-27',NULL,'Bata',270),('P_37M_0003','CAT_04','M_0003',400,'Slipper','Paragon sandal  shoe footwear slipper','2013-10-27',NULL,'Paragon',490),('P_38M_0003','CAT_04','M_0003',1900,'High heels','INC5 sandal shoe footwear heel','2013-10-27',NULL,'INC5',100),('P_39M_0003','CAT_04','M_0003',900,'palm shoe','Mochi sandal palm shoe footwear','2013-10-27',NULL,'Mochi',300),('P_40M_0003','CAT_04','M_0003',2900,'Sports shoe','inblu sandal  shoe footwear sports','2013-10-27',NULL,'Inblu',700),('P_41M_0004','CAT_03','M_0004',300,'Lip Gloss','maybelline lip gloss cosmetics','2013-10-27',NULL,'Maybelline',600),('P_41M_001','CAT_02','M_0001',399,'Lip Gloss','maybelline lip gloss cosmetics','2013-10-26',NULL,'Maybelline',100),('P_42M_0004','CAT_03','M_0004',350,'Perfume','perfume cosmetics deo yardley','2013-10-27',NULL,'yardley',200),('P_42M_001','CAT_02','M_0001',150,'Perfume','yardley deo perfume cosmetics','2013-10-26',NULL,'Yardley',120),('P_43M_0004','CAT_03','M_0004',200,'Fructis','Garnier fruictis shampoo cosmetics','2013-10-27',NULL,'Garnier',150),('P_43M_001','CAT_02','M_0001',160,'Fructis','garnier fructis shampoo cosmetics','2013-10-26',NULL,'Garnier',90),('P_44M_0004','CAT_03','M_0004',199,'White cream','cream white pond\'s cosmetics','2013-10-27',NULL,'Pond\'s',360),('P_44M_001','CAT_02','M_0001',75,'White Cream','ponds pond\'s face cream white cosmetics','2013-10-26',NULL,'Pond\'s',50),('P_45M_0004','CAT_03','M_0004',70,'Face wash','face wash nivea cosmetics','2013-10-27',NULL,'Nivea',400),('P_45M_001','CAT_02','M_0001',110,'Face Wash','nivea face wash cosmetics','2013-10-26',NULL,'Nivea',250),('P_46M_0004','CAT_03','M_0004',200,'Deodorant','deo perfume cosmetics','2013-10-27',NULL,'Wild Stone',60),('P_47M_0004','CAT_03','M_0004',45,'Soap','soap denim cosmetics','2013-10-27',NULL,'Denim',47),('P_48M_0004','CAT_03','M_0004',80,'Conditioner','dove cosmetics conditioner','2013-10-27',NULL,'Dove',89),('P_49M_0004','CAT_03','M_0004',299,'Anti-aging cream','anti aging cream cosmetics olay','2013-10-27',NULL,'Olay',90),('P_50M_0004','CAT_03','M_0004',100,'Foundation','lakme foundation cosmetics','2013-10-27',NULL,'Lakme',200),('P_51M_001','CAT_02','M_0001',38000,'LG Optimus Pro','phone mobile cell lg Optimus pro','2013-10-26',NULL,'LG',200),('P_52M_001','CAT_02','M_0001',25999,'Nexus 4','cell','2013-10-26',NULL,'Google',150),('P_53M_001','CAT_02','M_0001',57000,' iPhone 5C','cell','2013-10-26',NULL,'Apple',450),('P_54M_001','CAT_02','M_0001',41999,'Samsung Galaxy S4','phone mobile cell Samsung Galaxy S4','2013-10-26',NULL,'Samsung',70),('P_55M_001','CAT_02','M_0001',37000,'Nokia lumia 1020','phone mobile cell nokia lumia 1020','2013-10-26',NULL,'Nokia',300);

/*Table structure for table `productdescription` */

DROP TABLE IF EXISTS `productdescription`;

CREATE TABLE `productdescription` (
  `product_id` varchar(255) default NULL,
  `attribute_name` varchar(255) default NULL,
  `attribute_value` varchar(255) default NULL,
  `desc_id` bigint(255) NOT NULL auto_increment,
  PRIMARY KEY  (`desc_id`),
  KEY `FK_productdescription` (`product_id`),
  CONSTRAINT `FK_productdescription` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productdescription` */

/*Table structure for table `returneditems` */

DROP TABLE IF EXISTS `returneditems`;

CREATE TABLE `returneditems` (
  `return_id` bigint(255) NOT NULL auto_increment,
  `order_id` bigint(255) default NULL,
  `product_cost` double default NULL,
  `product_id` varchar(255) default NULL,
  `product_name` varchar(255) default NULL,
  `return_status` varchar(255) default NULL,
  `user_id` varchar(255) default NULL,
  `transaction_id` bigint(255) default NULL,
  `product_quantity` bigint(255) default NULL,
  `returnstatus_id` bigint(255) default NULL,
  PRIMARY KEY  (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `returneditems` */

/*Table structure for table `returnstatus` */

DROP TABLE IF EXISTS `returnstatus`;

CREATE TABLE `returnstatus` (
  `user_id` varchar(255) default NULL,
  `order_id` bigint(255) default NULL,
  `product_id` varchar(255) default NULL,
  `return_status` varchar(255) default '''NONE''',
  `returnstatus_id` bigint(255) NOT NULL auto_increment,
  PRIMARY KEY  (`returnstatus_id`),
  KEY `FK_returnstatususer` (`user_id`),
  KEY `FK_returnstatusorder` (`order_id`),
  KEY `FK_returnstatusproduct` (`product_id`),
  CONSTRAINT `FK_returnstatusorder` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_returnstatusproduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_returnstatususer` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `returnstatus` */

/*Table structure for table `rewards` */

DROP TABLE IF EXISTS `rewards`;

CREATE TABLE `rewards` (
  `user_id` varchar(255) default '',
  `reward_points` bigint(255) default NULL,
  `entry_id` bigint(255) NOT NULL auto_increment,
  PRIMARY KEY  (`entry_id`),
  UNIQUE KEY `NewIndex1` (`user_id`),
  CONSTRAINT `FK_rewards` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rewards` */

/*Table structure for table `scheme` */

DROP TABLE IF EXISTS `scheme`;

CREATE TABLE `scheme` (
  `scheme_id` bigint(255) default NULL,
  `product_id` varchar(255) default NULL,
  `start_date` date default NULL,
  `end_date` date default NULL,
  `entry_id` bigint(255) NOT NULL auto_increment,
  PRIMARY KEY  (`entry_id`),
  KEY `FK_scheme2` (`product_id`),
  KEY `FK_scheme` (`scheme_id`),
  CONSTRAINT `FK_scheme` FOREIGN KEY (`scheme_id`) REFERENCES `offer` (`scheme_id`),
  CONSTRAINT `FK_schemeproduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `scheme` */

insert  into `scheme`(`scheme_id`,`product_id`,`start_date`,`end_date`,`entry_id`) values (2,'P_21M_001','2013-10-27','2013-10-28',1),(3,'P_21M_001','2013-10-27','2013-10-28',2);

/*Table structure for table `shipping` */

DROP TABLE IF EXISTS `shipping`;

CREATE TABLE `shipping` (
  `shipping_id` bigint(255) NOT NULL auto_increment,
  `shipping_address` varchar(500) default NULL,
  `user_id` varchar(255) default NULL,
  `shipping_status` varchar(255) default NULL,
  `order_id` bigint(255) default NULL,
  `shipping_date` date default NULL,
  `delivery_date` date default NULL,
  `order_value` double default NULL,
  PRIMARY KEY  (`shipping_id`),
  KEY `FK_shippinguser` (`user_id`),
  KEY `FK_shippingorder` (`order_id`),
  CONSTRAINT `FK_shippingorder` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_shippinguser` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shipping` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `stock_id` bigint(20) NOT NULL auto_increment,
  `stock` bigint(20) NOT NULL,
  `merchant_id` varchar(255) default NULL,
  `product_id` varchar(255) default NULL,
  PRIMARY KEY  (`stock_id`),
  UNIQUE KEY `stock_id` (`stock_id`),
  KEY `FK68AF7164B027128` (`merchant_id`),
  KEY `FK68AF7169A649D2C` (`product_id`),
  CONSTRAINT `FK68AF7169A649D2C` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK68AF7164B027128` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stock` */

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `order_id` bigint(255) default NULL,
  `product_id` varchar(255) default NULL,
  `product_quantity` bigint(255) default NULL,
  `product_cost` double default NULL,
  `merchant_id` varchar(255) default NULL,
  `transaction_id` bigint(255) default NULL,
  `entry_id` bigint(255) NOT NULL auto_increment,
  `product_name` varchar(255) default NULL,
  `transaction_date` date default NULL,
  PRIMARY KEY  (`entry_id`),
  KEY `FK_transactionsorder` (`order_id`),
  KEY `FK_transactions` (`merchant_id`),
  KEY `FK_transactionsproduct` (`product_id`),
  CONSTRAINT `FK_transactions` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`),
  CONSTRAINT `FK_transactionsorder` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_transactionsproduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

insert  into `transactions`(`order_id`,`product_id`,`product_quantity`,`product_cost`,`merchant_id`,`transaction_id`,`entry_id`,`product_name`,`transaction_date`) values (1,'P_21M_001',1,38999,'M_0001',1,1,'xps','2013-10-26');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL default '',
  `user_firstname` char(255) default NULL,
  `user_lastname` char(255) default NULL,
  `user_password` varchar(255) default NULL,
  `user_email` varchar(255) default NULL,
  `user_securityquestion` varchar(255) default NULL,
  `user_securityanswer` varchar(255) default NULL,
  `user_address` varchar(255) default NULL,
  `user_status` varchar(255) default NULL,
  `user_addeddate` date default NULL,
  `user_removeddate` date default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_firstname`,`user_lastname`,`user_password`,`user_email`,`user_securityquestion`,`user_securityanswer`,`user_address`,`user_status`,`user_addeddate`,`user_removeddate`) values ('Anonymous','anonymous','anonymous',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('C_1','Avi','Roy','MA1s49XFm/GkF45rmt5PMw==','avitintin@gmail.com','What is your school name?','thyujhujhtu','fdhgfhgfbhgf','Inactive','2013-10-26',NULL),('C_1234','aditya','badireddy','ma4GUKCKLbce7guGuej8iQ==','badireddy.aditya@capgemini.com','What is your nickname?','aditya','aaaaaa','Active','2013-10-26',NULL),('C_2','AAQS','ASASA','erBXZ+F95uAJjXQIubVC7A==','avijit.roy@capgemini.com','What is the name of the first company you worked for?','cap','fdf','Inactive','2013-10-26',NULL);

/*Table structure for table `viewcount` */

DROP TABLE IF EXISTS `viewcount`;

CREATE TABLE `viewcount` (
  `product_id` varchar(255) NOT NULL default '',
  `count` bigint(255) default NULL,
  `category_id` varchar(255) default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `FK_viewcountcategory` (`category_id`),
  CONSTRAINT `FK_viewcountcategory` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_viewcountproduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `viewcount` */

insert  into `viewcount`(`product_id`,`count`,`category_id`) values ('P_21M_001',42,'CAT_02'),('P_22M_001',8,'CAT_02'),('P_23M_001',3,'CAT_02'),('P_24M_001',1,'CAT_02'),('P_25M_001',3,'CAT_02'),('P_45M_001',1,'CAT_02'),('P_52M_001',24,'CAT_02'),('P_54M_001',3,'CAT_02'),('P_55M_001',14,'CAT_02');

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `wish_id` bigint(255) NOT NULL auto_increment,
  `user_id` varchar(255) default NULL,
  `product_id` varchar(255) default NULL,
  `wish_creationdate` date default NULL,
  `wish_enddate` date default NULL,
  PRIMARY KEY  (`wish_id`),
  KEY `FK_wishlistuser` (`user_id`),
  KEY `FK_wishlistproduct` (`product_id`),
  CONSTRAINT `FK_wishlistproduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FK_wishlistuser` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `wishlist` */

insert  into `wishlist`(`wish_id`,`user_id`,`product_id`,`wish_creationdate`,`wish_enddate`) values (1,'C_1234','P_21M_001','2013-10-27','1970-01-01'),(2,'C_1234','P_25M_001','2013-10-27','1970-01-01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
