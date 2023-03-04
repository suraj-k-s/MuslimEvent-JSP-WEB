# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_mainproject
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2021-07-03 19:57:40
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_mainproject'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_mainproject" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_mainproject";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(11) NOT NULL auto_increment,
  "admin_username" varchar(100) NOT NULL,
  "admin_password" varchar(100) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_username", "admin_password") VALUES
	(1,'admin','admin');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_albummedia'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_albummedia" (
  "alm_id" int(11) NOT NULL auto_increment,
  "wa_id" int(11) NOT NULL,
  "alm_file" varchar(50) NOT NULL,
  "alm_caption" varchar(50) NOT NULL,
  PRIMARY KEY  ("alm_id")
) AUTO_INCREMENT=20;



#
# Dumping data for table 'tbl_albummedia'
#

# No data found.



#
# Table structure for table 'tbl_complaints'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaints" (
  "complaint_id" int(11) NOT NULL auto_increment,
  "complainttype_id" int(11) NOT NULL,
  "complaint_replydate" varchar(50) NOT NULL default '0000-00-00',
  "complaint_content" varchar(50) NOT NULL,
  "complaint_data" varchar(50) NOT NULL default '0',
  "complaint_date" date NOT NULL,
  "complaint_reply" varchar(50) NOT NULL default 'Not Yet Reply',
  "complaint_replystatus" varchar(50) NOT NULL default '0',
  "user_id" int(11) NOT NULL default '0',
  "hpbranch_id" int(11) NOT NULL default '0',
  "eventorg_id" int(11) NOT NULL default '0',
  "eventworker_id" int(11) NOT NULL default '0',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=20;



#
# Dumping data for table 'tbl_complaints'
#

# No data found.



#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(11) NOT NULL auto_increment,
  "complainttype_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("complainttype_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_complainttype'
#

# No data found.



#
# Table structure for table 'tbl_designation'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_designation" (
  "designation_id" int(11) NOT NULL auto_increment,
  "designation_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("designation_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_designation'
#

# No data found.



#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "District_id" int(11) NOT NULL auto_increment,
  "District_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("District_id")
) AUTO_INCREMENT=15;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(1,'Thiruvananthapuram');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(2,'Kollam');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(3,'Pathanamthitta');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(4,'Alappuzha');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(5,'Kottayam');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(6,'Idukki');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(7,'Ernakulam');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(8,'Thrissur');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(9,'Palakkad');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(10,'Malappuram');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(11,'Kozhikode');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(12,'Wayanad');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(13,'Kannur');
REPLACE INTO "tbl_district" ("District_id", "District_name") VALUES
	(14,'Kasaragod');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_dressbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_dressbook" (
  "dressbook_id" int(11) NOT NULL auto_increment,
  "dressbook_bookdate" date NOT NULL,
  "dressbook_bookstatus" int(11) NOT NULL,
  "dressbook_cstatus" int(11) NOT NULL,
  "dressbook_requiredate" date NOT NULL,
  "dr_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  PRIMARY KEY  ("dressbook_id")
);



#
# Dumping data for table 'tbl_dressbook'
#

# No data found.



#
# Table structure for table 'tbl_dresscategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_dresscategory" (
  "dresscategory_id" int(11) NOT NULL auto_increment,
  "dresscategory_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("dresscategory_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_dresscategory'
#

# No data found.



#
# Table structure for table 'tbl_dressrequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_dressrequest" (
  "dr_id" int(11) NOT NULL auto_increment,
  "eventworker_id" int(50) NOT NULL,
  "user_id" int(11) NOT NULL,
  "dresscategory_id" int(11) NOT NULL,
  "dr_material" varchar(50) NOT NULL,
  "dr_feature" varchar(50) NOT NULL,
  "dr_size" varchar(50) NOT NULL,
  "dr_rate" varchar(50) NOT NULL,
  "dr_requiredate" date NOT NULL,
  "dr_cstatus" int(11) NOT NULL,
  "dr_vstatus" int(11) NOT NULL,
  PRIMARY KEY  ("dr_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_dressrequest'
#

# No data found.



#
# Table structure for table 'tbl_eventorg'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventorg" (
  "eventorg_id" int(11) NOT NULL auto_increment,
  "eventorg_name" varchar(50) NOT NULL,
  "eventorg_contact" varchar(50) NOT NULL,
  "eventorg_email" varchar(50) NOT NULL,
  "eventorg_address" varchar(50) NOT NULL,
  "place_id" int(11) NOT NULL,
  "eventorg_proof" varchar(50) NOT NULL,
  "eventorg_licno" varchar(50) NOT NULL,
  "eventorg_logo" varchar(50) NOT NULL,
  "eventorg_username" varchar(50) NOT NULL,
  "eventorg_password" varchar(50) NOT NULL,
  "eventorg_doj" date NOT NULL,
  "eventorg_pstatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("eventorg_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_eventorg'
#

# No data found.



#
# Table structure for table 'tbl_eventorgcat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventorgcat" (
  "eventorgcat_id" int(11) NOT NULL auto_increment,
  "eventorgcat_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("eventorgcat_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_eventorgcat'
#

# No data found.



#
# Table structure for table 'tbl_eventworkercat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventworkercat" (
  "eventworkcat_id" int(11) NOT NULL auto_increment,
  "eventworkcat_name" varchar(100) NOT NULL,
  PRIMARY KEY  ("eventworkcat_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_eventworkercat'
#

# No data found.



#
# Table structure for table 'tbl_eventworkers'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_eventworkers" (
  "eventworker_id" int(11) NOT NULL auto_increment,
  "eventworker_name" varchar(50) NOT NULL,
  "eventworker_contact" varchar(50) NOT NULL,
  "eventworker_email" varchar(50) NOT NULL,
  "eventworker_address" varchar(50) NOT NULL,
  "Place_id" int(11) NOT NULL,
  "eventworker_gender" varchar(50) NOT NULL,
  "eventworkcat_id" int(10) unsigned NOT NULL,
  "eventworker_photo" varchar(50) NOT NULL,
  "eventworker_idproof" varchar(50) NOT NULL,
  "eventworker_username" varchar(50) NOT NULL,
  "eventworker_password" varchar(50) NOT NULL,
  "eventworker_doj" date NOT NULL,
  "eventworker_pstatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("eventworker_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_eventworkers'
#

# No data found.



#
# Table structure for table 'tbl_giftbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_giftbook" (
  "gb_id" int(11) NOT NULL auto_increment,
  "gifts_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "gift_count" varchar(50) NOT NULL,
  "gift_trate" varchar(50) NOT NULL,
  "gb_vstatus" int(11) NOT NULL default '0',
  "gb_cstatus" int(11) NOT NULL default '0',
  "gb_orderdate" date NOT NULL,
  PRIMARY KEY  ("gb_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_giftbook'
#

# No data found.



#
# Table structure for table 'tbl_giftgallery'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_giftgallery" (
  "gg_id" int(11) NOT NULL auto_increment,
  "gg_caption" varchar(50) NOT NULL,
  "gg_image" varchar(100) NOT NULL,
  "gifts_id" int(11) NOT NULL,
  PRIMARY KEY  ("gg_id")
);



#
# Dumping data for table 'tbl_giftgallery'
#

# No data found.



#
# Table structure for table 'tbl_giftrequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_giftrequest" (
  "gr_id" int(11) NOT NULL auto_increment,
  "gifttype_id" int(11) NOT NULL,
  "gr_feature" varchar(50) NOT NULL,
  "gr_items" varchar(50) NOT NULL,
  "gr_rate" varchar(50) NOT NULL default '0',
  "user_id" int(11) NOT NULL,
  "gr_requestdate" date NOT NULL,
  "gr_vstatus" int(11) NOT NULL default '0',
  "gr_cstatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("gr_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_giftrequest'
#

# No data found.



#
# Table structure for table 'tbl_gifts'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_gifts" (
  "gifts_id" int(11) NOT NULL auto_increment,
  "gifts_name" varchar(50) NOT NULL,
  "gifttype_id" int(11) NOT NULL,
  "gifts_item" varchar(50) NOT NULL,
  "gifts_photo" varchar(50) NOT NULL,
  "gifts_rate" varchar(50) NOT NULL,
  PRIMARY KEY  ("gifts_id")
) AUTO_INCREMENT=15;



#
# Dumping data for table 'tbl_gifts'
#

# No data found.



#
# Table structure for table 'tbl_gifttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_gifttype" (
  "gifttype_id" int(11) NOT NULL auto_increment,
  "gifttype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("gifttype_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_gifttype'
#

# No data found.



#
# Table structure for table 'tbl_hpbranch'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_hpbranch" (
  "hpbranch_id" int(10) unsigned NOT NULL auto_increment,
  "hpbranch_name" varchar(100) NOT NULL,
  "hpbranch_contact" varchar(100) NOT NULL,
  "hpbranch_email" varchar(100) NOT NULL,
  "hpbranch_address" varchar(100) NOT NULL,
  "place_id" int(11) NOT NULL,
  "hpbranch_landmark1" varchar(50) NOT NULL,
  "hpbranch_landmark2" varchar(50) NOT NULL,
  "hpbranch_proof" varchar(100) NOT NULL,
  "hpbranch_username" varchar(50) NOT NULL,
  "hpbranch_password" varchar(50) NOT NULL,
  "hpbranch_photo" varchar(50) NOT NULL,
  "hpbranch_vstatus" int(50) NOT NULL default '0',
  PRIMARY KEY  ("hpbranch_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_hpbranch'
#

# No data found.



#
# Table structure for table 'tbl_organisationpackagefeedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_organisationpackagefeedback" (
  "opfeedback_id" int(11) NOT NULL auto_increment,
  "opfeedback_content" varchar(50) NOT NULL,
  "opfeedback_date" timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  "user_id" int(11) NOT NULL,
  "packages_id" int(11) NOT NULL,
  PRIMARY KEY  ("opfeedback_id")
);



#
# Dumping data for table 'tbl_organisationpackagefeedback'
#

# No data found.



#
# Table structure for table 'tbl_packagebook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_packagebook" (
  "packbook_id" int(11) NOT NULL auto_increment,
  "packages_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "packbook_bookdate" date NOT NULL,
  "packbook_requiredate" date NOT NULL,
  "packbook_bookstatus" int(11) NOT NULL default '0',
  "packbook_cstatus" int(11) NOT NULL default '0',
  PRIMARY KEY  ("packbook_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_packagebook'
#

# No data found.



#
# Table structure for table 'tbl_packagecategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_packagecategory" (
  "packagecat_id" int(11) NOT NULL auto_increment,
  "packagecat_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("packagecat_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_packagecategory'
#

# No data found.



#
# Table structure for table 'tbl_packages'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_packages" (
  "packages_id" int(11) NOT NULL auto_increment,
  "packagecat_id" int(11) NOT NULL,
  "packages_name" varchar(50) NOT NULL,
  "packages_remark" varchar(50) NOT NULL,
  "packages_details" varchar(50) NOT NULL,
  "packages_rate" varchar(50) NOT NULL,
  "eventorg_id" int(11) NOT NULL,
  PRIMARY KEY  ("packages_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_packages'
#

# No data found.



#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "Place_id" int(11) NOT NULL auto_increment,
  "Place_name" varchar(100) NOT NULL,
  "District_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("Place_id")
) AUTO_INCREMENT=25;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(1,'Kovalam','1');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(2,'Anchal','2');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(3,'Konni','3');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(4,'Cherthala','4');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(5,'Paala','5');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(6,'Kumali','6');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(7,'Kakkanad','7');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(8,'Kunnamkulam','8');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(9,'Alathur','9');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(10,'Thirur','10');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(11,'Beypore','11');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(12,'Neelimala','12');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(13,'Payyanur','13');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(14,'Kanhangad','14');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(15,'Thaliparamb','13');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(16,'Thalasssery','13');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(17,'Mangalpady','14');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(18,'Perole','14');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(19,'Mananthavady','12');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(20,'Kalpeta','12');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(21,'Manjeri','10');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(22,'Perinthalmanna','10');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(23,'Vadakara','11');
REPLACE INTO "tbl_place" ("Place_id", "Place_name", "District_id") VALUES
	(24,'Neeleswaram','11');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_productbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_productbook" (
  "pb_id" int(11) NOT NULL auto_increment,
  "product_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  "product_count" varchar(50) NOT NULL,
  "product_trate" varchar(50) NOT NULL,
  "pb_vstatus" int(11) NOT NULL default '0',
  "pb_cstatus" int(50) NOT NULL default '0',
  "pb_orderdate" date NOT NULL,
  PRIMARY KEY  ("pb_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_productbook'
#

# No data found.



#
# Table structure for table 'tbl_productcategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_productcategory" (
  "productcategory_id" int(11) NOT NULL auto_increment,
  "productcategory_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("productcategory_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_productcategory'
#

# No data found.



#
# Table structure for table 'tbl_products'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_products" (
  "product_id" int(11) NOT NULL auto_increment,
  "product_name" varchar(50) NOT NULL,
  "productcategory_id" int(11) NOT NULL,
  "product_qty" varchar(50) NOT NULL,
  "hpbranch_id" int(11) NOT NULL,
  "product_photo" varchar(100) NOT NULL,
  "product_rate" varchar(50) NOT NULL,
  PRIMARY KEY  ("product_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_products'
#

# No data found.



#
# Table structure for table 'tbl_pstock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_pstock" (
  "pstock_id" int(11) NOT NULL auto_increment,
  "product_id" int(11) NOT NULL,
  "pstock_qty" varchar(100) NOT NULL,
  "pstock_date" date NOT NULL,
  PRIMARY KEY  ("pstock_id")
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_pstock'
#

# No data found.



#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(11) NOT NULL auto_increment,
  "user_name" varchar(100) NOT NULL,
  "user_gender" varchar(50) NOT NULL,
  "user_address" varchar(100) NOT NULL,
  "user_email" varchar(100) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "user_username" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "place_id" int(50) unsigned NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_user'
#

# No data found.



#
# Table structure for table 'tbl_workeralbum'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workeralbum" (
  "wa_id" int(11) NOT NULL auto_increment,
  "wa_title" varchar(100) NOT NULL,
  "wa_description" varchar(100) NOT NULL,
  "wa_date" date NOT NULL,
  "wa_other" varchar(50) NOT NULL,
  "eventworker_id" int(11) NOT NULL,
  "wa_update" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("wa_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_workeralbum'
#

# No data found.



#
# Table structure for table 'tbl_workerbook'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workerbook" (
  "workerbook_id" int(11) NOT NULL auto_increment,
  "workerbook_bookdate" date NOT NULL,
  "workerbook_bookstatus" int(11) NOT NULL default '0',
  "workerbook_cstatus" int(11) NOT NULL default '0',
  "workerbook_requiredate" date NOT NULL,
  "wsp_id" int(11) NOT NULL,
  "user_id" int(11) NOT NULL,
  PRIMARY KEY  ("workerbook_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_workerbook'
#

# No data found.



#
# Table structure for table 'tbl_workerspackage'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workerspackage" (
  "wsp_id" int(11) NOT NULL auto_increment,
  "packagecat_id" int(11) NOT NULL,
  "wsp_workimage" varchar(100) NOT NULL,
  "wsp_remark" varchar(50) NOT NULL,
  "wsp_detail" varchar(50) NOT NULL,
  "wsp_rate" varchar(50) NOT NULL,
  "eventworker_id" int(11) NOT NULL,
  PRIMARY KEY  ("wsp_id")
) AUTO_INCREMENT=20;



#
# Dumping data for table 'tbl_workerspackage'
#

# No data found.



#
# Table structure for table 'tbl_workerspackagefeedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_workerspackagefeedback" (
  "wpfeedback_id" int(11) NOT NULL auto_increment,
  "wpfeedback_content" varchar(50) NOT NULL,
  "wpfeedback_date" date NOT NULL,
  "user_id" int(11) NOT NULL,
  "wsp_id" int(11) NOT NULL,
  PRIMARY KEY  ("wpfeedback_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_workerspackagefeedback'
#

# No data found.

/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
