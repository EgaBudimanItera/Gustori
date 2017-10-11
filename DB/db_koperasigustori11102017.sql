/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.6.25 : Database - db_koperasigustori
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_koperasigustori` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_koperasigustori`;

/*Table structure for table `tb_akun` */

DROP TABLE IF EXISTS `tb_akun`;

CREATE TABLE `tb_akun` (
  `idakun` varchar(10) NOT NULL,
  `namaakun` varchar(40) DEFAULT NULL,
  `jenisakun` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idakun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_akun` */

insert  into `tb_akun`(`idakun`,`namaakun`,`jenisakun`) values ('4001','Pendapatan Toko dan Lain-lain','Pendapatan'),('4002','Pendapatan Kredit ART','Pendapatan'),('4003','Pendapatan Usaha Simpan Pinjam','Pendapatan'),('4004','Pendapatan Provinsi dan ADM. Pinjaman','Pendapatan'),('4005','Pendapatan Usaha Foto Copy','Pendapatan'),('4006','Pendapatan Sewa Kursi','Pendapatan'),('4007','Pendapatan Kapling','Pendapatan'),('4008','Pendapatan Administrasi Simpanan','Pendapatan'),('4009','Pendapatan Lain-lain','Pendapatan'),('5001','Biaya Pemasaran','Biaya'),('5002','Biaya Karyawan','Biaya'),('5003','Biaya Organisasi dan Pembinaan','Biaya'),('5004','Biaya Keuangan','Biaya'),('5005','Biaya Kendaraan','Biaya'),('5006','Biaya Adm dan Umum','Biaya'),('5007','Penyusutan','Biaya'),('5008','Biaya RAT','Biaya'),('5009','Biaya Lain-lain','Biaya');

/*Table structure for table `tb_anggota` */

DROP TABLE IF EXISTS `tb_anggota`;

CREATE TABLE `tb_anggota` (
  `idanggota` varchar(10) NOT NULL,
  `iddinas` varchar(10) DEFAULT NULL,
  `nip` varchar(35) DEFAULT NULL,
  `namaanggota` varchar(40) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamatanggota` varchar(200) DEFAULT NULL,
  `gol` varchar(10) DEFAULT NULL,
  `tgldaftar` date DEFAULT NULL,
  `umroh` double DEFAULT NULL,
  `sukarela` double DEFAULT NULL,
  `haji` double DEFAULT NULL,
  `dapen` double DEFAULT NULL,
  `art` double DEFAULT NULL,
  `usipa` double DEFAULT NULL,
  `sosial` double DEFAULT NULL,
  PRIMARY KEY (`idanggota`),
  KEY `FK_tb_anggota` (`iddinas`),
  CONSTRAINT `FK_tb_anggota` FOREIGN KEY (`iddinas`) REFERENCES `tb_dinas` (`iddinas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_anggota` */

insert  into `tb_anggota`(`idanggota`,`iddinas`,`nip`,`namaanggota`,`tgllahir`,`agama`,`jabatan`,`alamatanggota`,`gol`,`tgldaftar`,`umroh`,`sukarela`,`haji`,`dapen`,`art`,`usipa`,`sosial`) values ('A001','D001','12345678','Netylia Sukri, SE, MM','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A002','D001','12345679','Heri Muheri, S.H','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A003','D001','12345670','Dra. Hj. Elya Saleh, MM','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A004','D001','12345671','Eti Rohyani, S.E M.M','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A005','D001','12345672','Deveria Syusanda, SH','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A006','D002','01234567','Sapriyani, SH','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A007','D002','01234568','Efendi Yunus, SH','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A008','D002','01234569','Erwanuddin A.Mat.','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A009','D002','01234560','Muherwan, S.E','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A010','D002','01234561','Diantina, S.Sos.','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A011','D003','23456789','Ir.  Ibrahim','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A012','D003','23456780','Ir. Andrya Yunila Hastuti','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,250000,20000,50000,0,0,25000),('A013','D003','23456781','Desti Mega Puri, S.P.','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,50000,20000,50000,0,0,25000),('A014','D003','23456782','Ir. Nunuk Trimurni','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,100000,20000,50000,0,0,25000),('A015','D003','23456783','A. Taupik, S.E.','2017-10-07','Islam','Pegawau','Bandar Lampung','4a','2017-10-07',10000,250000,20000,50000,0,0,25000),('A016','D004','34567890','Nani Winarni, SH','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A017','D004','34567891','Sri Yuwiyati SP, Sip','2017-10-07','Katholik','Pegawai','Bandar Lampung','3d','2017-10-07',0,15000,0,50000,0,0,20000),('A018','D004','34567892','Dati Sumarni','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A019','D004','34567893','Eli Rusita Ariani','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,15000,20000,50000,0,0,20000),('A020','D004','34567894','Antonius Ginting, ST.','2017-10-07','Katholik','Pegawai','Bandar Lampung','3d','2017-10-07',0,15000,0,50000,0,0,20000),('A021','D005','45678901','Syahrir, SH, MM','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A022','D005','45678902','Sijaya, S. Sos','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A023','D005','45678903','Helmi Tamsil, S.H.','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A024','D005','45678904','Dra.Maryati','2017-10-07','Islam','Pegawai','Bandar Lampung','4a','2017-10-07',10000,20000,20000,50000,0,0,25000),('A025','D005','45678905','Sani Gempita Japri','2017-10-07','Islam','Pegawai','Bandar Lampung','3d','2017-10-07',10000,20000,20000,50000,0,0,20000);

/*Table structure for table `tb_dinas` */

DROP TABLE IF EXISTS `tb_dinas`;

CREATE TABLE `tb_dinas` (
  `iddinas` varchar(10) NOT NULL,
  `namadinas` varchar(40) DEFAULT NULL,
  `alamatdinas` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`iddinas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_dinas` */

insert  into `tb_dinas`(`iddinas`,`namadinas`,`alamatdinas`) values ('D001','SEKRET DPRD','Jl A'),('D002','TATA KOTA','Jl B'),('D003','BAPPEDA','Jl C'),('D004','PERIZINAN','Jl D'),('D005','KEPENDUDUKAN','Jl E');

/*Table structure for table `tb_lr` */

DROP TABLE IF EXISTS `tb_lr`;

CREATE TABLE `tb_lr` (
  `idLR` varchar(10) NOT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `dari` date DEFAULT NULL,
  `ke` date DEFAULT NULL,
  `idakun` varchar(10) DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  PRIMARY KEY (`idLR`),
  KEY `FK_tb_lr` (`idakun`),
  CONSTRAINT `FK_tb_lr` FOREIGN KEY (`idakun`) REFERENCES `tb_akun` (`idakun`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_lr` */

insert  into `tb_lr`(`idLR`,`tahun`,`dari`,`ke`,`idakun`,`jumlah`) values ('L001122017','2017','2017-01-01','2017-12-31','4009',10000000),('L002122017','2017','2017-01-01','2017-12-31','5009',5000000);

/*Table structure for table `tb_pengguna` */

DROP TABLE IF EXISTS `tb_pengguna`;

CREATE TABLE `tb_pengguna` (
  `namapengguna` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `level` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pengguna` */

insert  into `tb_pengguna`(`namapengguna`,`password`,`level`) values ('A','123','USIPA'),('B','123','Bendahara Koperasi'),('C','123','Bendahara Anggota'),('D','123','Ketua Koperasi');

/*Table structure for table `tb_pinjaman` */

DROP TABLE IF EXISTS `tb_pinjaman`;

CREATE TABLE `tb_pinjaman` (
  `idpinjaman` varchar(20) NOT NULL,
  `tglpinjaman` date DEFAULT NULL,
  `idanggota` varchar(10) DEFAULT NULL,
  `jenispinjaman` varchar(30) DEFAULT NULL,
  `lamapinjaman` int(11) DEFAULT NULL,
  `jumlahpinjaman` double DEFAULT NULL,
  `angsuran` double DEFAULT NULL,
  `sisapinjaman` double DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpinjaman`),
  KEY `FK_tb_pinjaman` (`idanggota`),
  CONSTRAINT `FK_tb_pinjaman` FOREIGN KEY (`idanggota`) REFERENCES `tb_anggota` (`idanggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pinjaman` */

insert  into `tb_pinjaman`(`idpinjaman`,`tglpinjaman`,`idanggota`,`jenispinjaman`,`lamapinjaman`,`jumlahpinjaman`,`angsuran`,`sisapinjaman`,`ke`) values ('P001102017','2017-10-07','A001','USIPA',12,1000000,94166,1000000,3),('P002102017','2017-10-07','A009','ART',24,4000000,188333,4000000,1),('P003102017','2017-10-07','A021','ART',36,10000000,315277,10000000,1);

/*Table structure for table `tb_shu` */

DROP TABLE IF EXISTS `tb_shu`;

CREATE TABLE `tb_shu` (
  `idshu` varchar(20) NOT NULL,
  `tglpenetapan` date DEFAULT NULL,
  `tahunshu` varchar(4) DEFAULT NULL,
  `totalpendapatan` double DEFAULT NULL,
  `totalbeban` double DEFAULT NULL,
  `totalsimpanan` double DEFAULT NULL,
  `totalbayar` double DEFAULT NULL,
  PRIMARY KEY (`idshu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_shu` */

insert  into `tb_shu`(`idshu`,`tglpenetapan`,`tahunshu`,`totalpendapatan`,`totalbeban`,`totalsimpanan`,`totalbayar`) values ('S001122017','2017-12-31','2017',10000000,5000000,1840000,597776);

/*Table structure for table `tb_shuanggota` */

DROP TABLE IF EXISTS `tb_shuanggota`;

CREATE TABLE `tb_shuanggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `idshu` varchar(20) DEFAULT NULL,
  `idanggota` varchar(10) DEFAULT NULL,
  `jumlahsimpanan` double DEFAULT NULL,
  `labasimpanan` double DEFAULT NULL,
  `jumlahbayar` double DEFAULT NULL,
  `labajasa` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tb_shuanggota` (`idanggota`),
  KEY `FK_tb_shuanggota1` (`idshu`),
  CONSTRAINT `FK_tb_shuanggota` FOREIGN KEY (`idanggota`) REFERENCES `tb_anggota` (`idanggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tb_shuanggota1` FOREIGN KEY (`idshu`) REFERENCES `tb_shu` (`idshu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `tb_shuanggota` */

insert  into `tb_shuanggota`(`id`,`tgl`,`idshu`,`idanggota`,`jumlahsimpanan`,`labasimpanan`,`jumlahbayar`,`labajasa`) values (2,'2017-12-31','S001122017','A001',55000,37364,94166,216599),(3,'2017-12-31','S001122017','A002',55000,37364,0,0),(4,'2017-12-31','S001122017','A003',55000,37364,0,0),(5,'2017-12-31','S001122017','A004',45000,30570,0,0),(6,'2017-12-31','S001122017','A005',45000,30570,0,0),(7,'2017-12-31','S001122017','A006',55000,37364,0,0),(8,'2017-12-31','S001122017','A007',55000,37364,0,0),(9,'2017-12-31','S001122017','A008',45000,30570,0,0),(10,'2017-12-31','S001122017','A009',45000,30570,188333,433202),(11,'2017-12-31','S001122017','A010',45000,30570,0,0),(12,'2017-12-31','S001122017','A011',45000,30570,0,0),(13,'2017-12-31','S001122017','A012',285000,193614,0,0),(14,'2017-12-31','S001122017','A013',85000,57744,0,0),(15,'2017-12-31','S001122017','A014',135000,91711,0,0),(16,'2017-12-31','S001122017','A015',285000,193614,0,0),(17,'2017-12-31','S001122017','A016',55000,37364,0,0),(18,'2017-12-31','S001122017','A017',45000,30570,0,0),(19,'2017-12-31','S001122017','A018',45000,30570,0,0),(20,'2017-12-31','S001122017','A019',45000,30570,0,0),(21,'2017-12-31','S001122017','A020',45000,30570,0,0),(22,'2017-12-31','S001122017','A021',55000,37364,315277,725197),(23,'2017-12-31','S001122017','A022',55000,37364,0,0),(24,'2017-12-31','S001122017','A023',55000,37364,0,0),(25,'2017-12-31','S001122017','A024',55000,37364,0,0),(26,'2017-12-31','S001122017','A025',50000,33967,0,0);

/*Table structure for table `tb_simpanan` */

DROP TABLE IF EXISTS `tb_simpanan`;

CREATE TABLE `tb_simpanan` (
  `idsimpanan` varchar(20) NOT NULL,
  `tgltagih` date DEFAULT NULL,
  `tglsimpan` date DEFAULT NULL,
  `idanggota` varchar(10) DEFAULT NULL,
  `pokok` double DEFAULT NULL,
  `wajib` double DEFAULT NULL,
  `sukarela` double DEFAULT NULL,
  `sosial` double DEFAULT NULL,
  `dapen` double DEFAULT NULL,
  `haji` double DEFAULT NULL,
  `umroh` double DEFAULT NULL,
  `laba` double DEFAULT NULL,
  `jasa` double DEFAULT NULL,
  `art` double DEFAULT NULL,
  `artke` int(11) DEFAULT NULL,
  `usipa` double DEFAULT NULL,
  `usipake` int(11) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idsimpanan`),
  KEY `FK_tb_simpanan1` (`idanggota`),
  CONSTRAINT `FK_tb_simpanan1` FOREIGN KEY (`idanggota`) REFERENCES `tb_anggota` (`idanggota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_simpanan` */

insert  into `tb_simpanan`(`idsimpanan`,`tgltagih`,`tglsimpan`,`idanggota`,`pokok`,`wajib`,`sukarela`,`sosial`,`dapen`,`haji`,`umroh`,`laba`,`jasa`,`art`,`artke`,`usipa`,`usipake`,`status`) values ('S001102017','2017-10-07','2017-10-07','A001',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S002102017','2017-10-07','2017-10-07','A002',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S003102017','2017-10-07','2017-10-07','A003',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S004102017','2017-10-07','2017-10-07','A004',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S005102017','2017-10-07','2017-10-07','A005',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S006102017','2017-10-07','2017-10-07','A006',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S007102017','2017-10-07','2017-10-07','A007',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S008102017','2017-10-07','2017-10-07','A008',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S009102017','2017-10-07','2017-10-07','A009',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S010102017','2017-10-07','2017-10-07','A010',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S011102017','2017-10-07','2017-10-07','A011',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S012102017','2017-10-07','2017-10-07','A012',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S013102017','2017-10-07','2017-10-07','A013',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S014102017','2017-10-07','2017-10-07','A014',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S015102017','2017-10-07','2017-10-07','A015',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S016102017','2017-10-07','2017-10-07','A016',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S017102017','2017-10-07','2017-10-07','A017',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S018102017','2017-10-07','2017-10-07','A018',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S019102017','2017-10-07','2017-10-07','A019',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S020102017','2017-10-07','2017-10-07','A020',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S021102017','2017-10-07','2017-10-07','A021',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S022102017','2017-10-07','2017-10-07','A022',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S023102017','2017-10-07','2017-10-07','A023',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S024102017','2017-10-07','2017-10-07','A024',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S025102017','2017-10-07','2017-10-07','A025',10000,0,0,0,0,0,0,0,0,0,0,0,0,'Simpanan'),('S026102017','2017-10-27','2017-11-02','A001',0,25000,20000,3000,50000,20000,10000,0,0,0,0,94166,1,'Simpanan'),('S027102017','2017-10-27','2017-11-02','A002',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S028102017','2017-10-27','2017-11-02','A003',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S029102017','2017-10-27','2017-11-02','A004',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S030102017','2017-10-27','2017-11-02','A005',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S031102017','2017-10-27','2017-11-02','A006',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S032102017','2017-10-27','2017-11-02','A007',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S033102017','2017-10-27','2017-11-02','A008',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S034102017','2017-10-27','2017-11-02','A009',0,20000,15000,3000,50000,20000,10000,0,0,188333,1,0,0,'Simpanan'),('S035102017','2017-10-27','2017-11-02','A010',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S036102017','2017-10-27','2017-11-02','A011',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S037102017','2017-10-27','2017-11-02','A012',0,25000,250000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S038102017','2017-10-27','2017-11-02','A013',0,25000,50000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S039102017','2017-10-27','2017-11-02','A014',0,25000,100000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S040102017','2017-10-27','2017-11-02','A015',0,25000,250000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S041102017','2017-10-27','2017-11-02','A016',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S042102017','2017-10-27','2017-11-02','A017',0,20000,15000,3000,50000,0,0,0,0,0,0,0,0,'Simpanan'),('S043102017','2017-10-27','2017-11-02','A018',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S044102017','2017-10-27','2017-11-02','A019',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S045102017','2017-10-27','2017-11-02','A020',0,20000,15000,3000,50000,0,0,0,0,0,0,0,0,'Simpanan'),('S046102017','2017-10-27','2017-11-02','A021',0,25000,20000,3000,50000,20000,10000,0,0,315277,1,0,0,'Simpanan'),('S047102017','2017-10-27','2017-11-02','A022',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S048102017','2017-10-27','2017-11-02','A023',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S049102017','2017-10-27','2017-11-02','A024',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S050102017','2017-10-27','2017-11-02','A025',0,20000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Simpanan'),('S051122017','2017-12-31','2017-12-31','A001',0,0,0,0,0,0,0,37364,216599,0,0,0,0,'Simpanan'),('S052122017','2017-12-31','2017-12-31','A002',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S053122017','2017-12-31','2017-12-31','A003',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S054122017','2017-12-31','2017-12-31','A004',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S055122017','2017-12-31','2017-12-31','A005',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S056122017','2017-12-31','2017-12-31','A006',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S057122017','2017-12-31','2017-12-31','A007',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S058122017','2017-12-31','2017-12-31','A008',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S059122017','2017-12-31','2017-12-31','A009',0,0,0,0,0,0,0,30570,433202,0,0,0,0,'Simpanan'),('S060122017','2017-12-31','2017-12-31','A010',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S061122017','2017-12-31','2017-12-31','A011',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S062122017','2017-12-31','2017-12-31','A012',0,0,0,0,0,0,0,193614,0,0,0,0,0,'Simpanan'),('S063122017','2017-12-31','2017-12-31','A013',0,0,0,0,0,0,0,57744,0,0,0,0,0,'Simpanan'),('S064122017','2017-12-31','2017-12-31','A014',0,0,0,0,0,0,0,91711,0,0,0,0,0,'Simpanan'),('S065122017','2017-12-31','2017-12-31','A015',0,0,0,0,0,0,0,193614,0,0,0,0,0,'Simpanan'),('S066122017','2017-12-31','2017-12-31','A016',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S067122017','2017-12-31','2017-12-31','A017',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S068122017','2017-12-31','2017-12-31','A018',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S069122017','2017-12-31','2017-12-31','A019',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S070122017','2017-12-31','2017-12-31','A020',0,0,0,0,0,0,0,30570,0,0,0,0,0,'Simpanan'),('S071122017','2017-12-31','2017-12-31','A021',0,0,0,0,0,0,0,37364,725197,0,0,0,0,'Simpanan'),('S072122017','2017-12-31','2017-12-31','A022',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S073122017','2017-12-31','2017-12-31','A023',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S074122017','2017-12-31','2017-12-31','A024',0,0,0,0,0,0,0,37364,0,0,0,0,0,'Simpanan'),('S075122017','2017-12-31','2017-12-31','A025',0,0,0,0,0,0,0,33967,0,0,0,0,0,'Simpanan'),('S076102017','2017-10-27','2017-10-27','A001',0,25000,20000,3000,50000,20000,10000,0,0,0,0,94166,2,'Tagihan'),('S077102017','2017-10-27','2017-10-27','A002',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S078102017','2017-10-27','2017-10-27','A003',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S079102017','2017-10-27','2017-10-27','A004',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S080102017','2017-10-27','2017-10-27','A005',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S081102017','2017-10-27','2017-10-27','A006',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S082102017','2017-10-27','2017-10-27','A007',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S083102017','2017-10-27','2017-10-27','A008',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S084102017','2017-10-27','2017-10-27','A009',0,20000,15000,3000,50000,20000,10000,0,0,188333,1,0,0,'Tagihan'),('S085102017','2017-10-27','2017-10-27','A010',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S086102017','2017-10-27','2017-10-27','A011',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S087102017','2017-10-27','2017-10-27','A012',0,25000,250000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S088102017','2017-10-27','2017-10-27','A013',0,25000,50000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S089102017','2017-10-27','2017-10-27','A014',0,25000,100000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S090102017','2017-10-27','2017-10-27','A015',0,25000,250000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S091102017','2017-10-27','2017-10-27','A016',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S092102017','2017-10-27','2017-10-27','A017',0,20000,15000,3000,50000,0,0,0,0,0,0,0,0,'Tagihan'),('S093102017','2017-10-27','2017-10-27','A018',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S094102017','2017-10-27','2017-10-27','A019',0,20000,15000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S095102017','2017-10-27','2017-10-27','A020',0,20000,15000,3000,50000,0,0,0,0,0,0,0,0,'Tagihan'),('S096102017','2017-10-27','2017-10-27','A021',0,25000,20000,3000,50000,20000,10000,0,0,315277,1,0,0,'Tagihan'),('S097102017','2017-10-27','2017-10-27','A022',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S098102017','2017-10-27','2017-10-27','A023',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S099102017','2017-10-27','2017-10-27','A024',0,25000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan'),('S100102017','2017-10-27','2017-10-27','A025',0,20000,20000,3000,50000,20000,10000,0,0,0,0,0,0,'Tagihan');

/*Table structure for table `vw_anggota` */

DROP TABLE IF EXISTS `vw_anggota`;

/*!50001 DROP VIEW IF EXISTS `vw_anggota` */;
/*!50001 DROP TABLE IF EXISTS `vw_anggota` */;

/*!50001 CREATE TABLE `vw_anggota` (
  `idanggota` varchar(10) NOT NULL,
  `iddinas` varchar(10) DEFAULT NULL,
  `namadinas` varchar(40) DEFAULT NULL,
  `alamatdinas` varchar(200) DEFAULT NULL,
  `nip` varchar(35) DEFAULT NULL,
  `namaanggota` varchar(40) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamatanggota` varchar(200) DEFAULT NULL,
  `gol` varchar(10) DEFAULT NULL,
  `tgldaftar` date DEFAULT NULL,
  `umroh` double DEFAULT NULL,
  `sukarela` double DEFAULT NULL,
  `haji` double DEFAULT NULL,
  `dapen` double DEFAULT NULL,
  `art` double DEFAULT NULL,
  `usipa` double DEFAULT NULL,
  `sosial` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `vw_lr` */

DROP TABLE IF EXISTS `vw_lr`;

/*!50001 DROP VIEW IF EXISTS `vw_lr` */;
/*!50001 DROP TABLE IF EXISTS `vw_lr` */;

/*!50001 CREATE TABLE `vw_lr` (
  `idLR` varchar(10) NOT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `dari` date DEFAULT NULL,
  `ke` date DEFAULT NULL,
  `idakun` varchar(10) DEFAULT NULL,
  `jenisakun` varchar(20) DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  `namaakun` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `vw_pinjaman` */

DROP TABLE IF EXISTS `vw_pinjaman`;

/*!50001 DROP VIEW IF EXISTS `vw_pinjaman` */;
/*!50001 DROP TABLE IF EXISTS `vw_pinjaman` */;

/*!50001 CREATE TABLE `vw_pinjaman` (
  `idpinjaman` varchar(20) NOT NULL,
  `tglpinjaman` date DEFAULT NULL,
  `idanggota` varchar(10) DEFAULT NULL,
  `jenispinjaman` varchar(30) DEFAULT NULL,
  `lamapinjaman` int(11) DEFAULT NULL,
  `jumlahpinjaman` double DEFAULT NULL,
  `angsuran` double DEFAULT NULL,
  `sisapinjaman` double DEFAULT NULL,
  `iddinas` varchar(10) DEFAULT NULL,
  `nip` varchar(35) DEFAULT NULL,
  `namaanggota` varchar(40) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamatanggota` varchar(200) DEFAULT NULL,
  `gol` varchar(10) DEFAULT NULL,
  `namadinas` varchar(40) DEFAULT NULL,
  `alamatdinas` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `vw_shu` */

DROP TABLE IF EXISTS `vw_shu`;

/*!50001 DROP VIEW IF EXISTS `vw_shu` */;
/*!50001 DROP TABLE IF EXISTS `vw_shu` */;

/*!50001 CREATE TABLE `vw_shu` (
  `idshu` varchar(20) NOT NULL,
  `tglpenetapan` date DEFAULT NULL,
  `tahunshu` varchar(4) DEFAULT NULL,
  `totalpendapatan` double DEFAULT NULL,
  `totalbeban` double DEFAULT NULL,
  `totalsimpanan` double DEFAULT NULL,
  `totalbayar` double DEFAULT NULL,
  `jasa` double DEFAULT NULL,
  `laba` double DEFAULT NULL,
  `persenjasa` double DEFAULT NULL,
  `persenlaba` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `vw_shuanggota` */

DROP TABLE IF EXISTS `vw_shuanggota`;

/*!50001 DROP VIEW IF EXISTS `vw_shuanggota` */;
/*!50001 DROP TABLE IF EXISTS `vw_shuanggota` */;

/*!50001 CREATE TABLE `vw_shuanggota` (
  `id` int(11) NOT NULL DEFAULT '0',
  `tgl` date DEFAULT NULL,
  `idshu` varchar(20) DEFAULT NULL,
  `idanggota` varchar(10) DEFAULT NULL,
  `jumlahsimpanan` double DEFAULT NULL,
  `labasimpanan` double DEFAULT NULL,
  `jumlahbayar` double DEFAULT NULL,
  `labajasa` double DEFAULT NULL,
  `tglpenetapan` date DEFAULT NULL,
  `tahunshu` varchar(4) DEFAULT NULL,
  `totalpendapatan` double DEFAULT NULL,
  `totalbeban` double DEFAULT NULL,
  `iddinas` varchar(10) DEFAULT NULL,
  `namadinas` varchar(40) DEFAULT NULL,
  `alamatdinas` varchar(200) DEFAULT NULL,
  `namaanggota` varchar(40) DEFAULT NULL,
  `nip` varchar(35) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamatanggota` varchar(200) DEFAULT NULL,
  `gol` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `vw_simpanan` */

DROP TABLE IF EXISTS `vw_simpanan`;

/*!50001 DROP VIEW IF EXISTS `vw_simpanan` */;
/*!50001 DROP TABLE IF EXISTS `vw_simpanan` */;

/*!50001 CREATE TABLE `vw_simpanan` (
  `idsimpanan` varchar(20) NOT NULL,
  `tgltagih` date DEFAULT NULL,
  `tglsimpan` date DEFAULT NULL,
  `idanggota` varchar(10) DEFAULT NULL,
  `iddinas` varchar(10) DEFAULT NULL,
  `namadinas` varchar(40) DEFAULT NULL,
  `alamatdinas` varchar(200) DEFAULT NULL,
  `nip` varchar(35) DEFAULT NULL,
  `namaanggota` varchar(40) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `alamatanggota` varchar(200) DEFAULT NULL,
  `gol` varchar(10) DEFAULT NULL,
  `tgldaftar` date DEFAULT NULL,
  `pokok` double DEFAULT NULL,
  `wajib` double DEFAULT NULL,
  `sukarela` double DEFAULT NULL,
  `sosial` double DEFAULT NULL,
  `dapen` double DEFAULT NULL,
  `haji` double DEFAULT NULL,
  `umroh` double DEFAULT NULL,
  `laba` double DEFAULT NULL,
  `jasa` double DEFAULT NULL,
  `art` double DEFAULT NULL,
  `artke` int(11) DEFAULT NULL,
  `usipa` double DEFAULT NULL,
  `usipake` int(11) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*View structure for view vw_anggota */

/*!50001 DROP TABLE IF EXISTS `vw_anggota` */;
/*!50001 DROP VIEW IF EXISTS `vw_anggota` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_anggota` AS select `tb_anggota`.`idanggota` AS `idanggota`,`tb_anggota`.`iddinas` AS `iddinas`,`tb_dinas`.`namadinas` AS `namadinas`,`tb_dinas`.`alamatdinas` AS `alamatdinas`,`tb_anggota`.`nip` AS `nip`,`tb_anggota`.`namaanggota` AS `namaanggota`,`tb_anggota`.`tgllahir` AS `tgllahir`,`tb_anggota`.`agama` AS `agama`,`tb_anggota`.`jabatan` AS `jabatan`,`tb_anggota`.`alamatanggota` AS `alamatanggota`,`tb_anggota`.`gol` AS `gol`,`tb_anggota`.`tgldaftar` AS `tgldaftar`,`tb_anggota`.`umroh` AS `umroh`,`tb_anggota`.`sukarela` AS `sukarela`,`tb_anggota`.`haji` AS `haji`,`tb_anggota`.`dapen` AS `dapen`,`tb_anggota`.`art` AS `art`,`tb_anggota`.`usipa` AS `usipa`,`tb_anggota`.`sosial` AS `sosial` from (`tb_anggota` join `tb_dinas` on((`tb_anggota`.`iddinas` = `tb_dinas`.`iddinas`))) */;

/*View structure for view vw_lr */

/*!50001 DROP TABLE IF EXISTS `vw_lr` */;
/*!50001 DROP VIEW IF EXISTS `vw_lr` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_lr` AS select `tb_lr`.`idLR` AS `idLR`,`tb_lr`.`tahun` AS `tahun`,`tb_lr`.`dari` AS `dari`,`tb_lr`.`ke` AS `ke`,`tb_lr`.`idakun` AS `idakun`,`tb_akun`.`jenisakun` AS `jenisakun`,`tb_lr`.`jumlah` AS `jumlah`,`tb_akun`.`namaakun` AS `namaakun` from (`tb_lr` join `tb_akun` on((`tb_lr`.`idakun` = `tb_akun`.`idakun`))) */;

/*View structure for view vw_pinjaman */

/*!50001 DROP TABLE IF EXISTS `vw_pinjaman` */;
/*!50001 DROP VIEW IF EXISTS `vw_pinjaman` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pinjaman` AS select `tb_pinjaman`.`idpinjaman` AS `idpinjaman`,`tb_pinjaman`.`tglpinjaman` AS `tglpinjaman`,`tb_pinjaman`.`idanggota` AS `idanggota`,`tb_pinjaman`.`jenispinjaman` AS `jenispinjaman`,`tb_pinjaman`.`lamapinjaman` AS `lamapinjaman`,`tb_pinjaman`.`jumlahpinjaman` AS `jumlahpinjaman`,`tb_pinjaman`.`angsuran` AS `angsuran`,`tb_pinjaman`.`sisapinjaman` AS `sisapinjaman`,`tb_anggota`.`iddinas` AS `iddinas`,`tb_anggota`.`nip` AS `nip`,`tb_anggota`.`namaanggota` AS `namaanggota`,`tb_anggota`.`tgllahir` AS `tgllahir`,`tb_anggota`.`agama` AS `agama`,`tb_anggota`.`jabatan` AS `jabatan`,`tb_anggota`.`alamatanggota` AS `alamatanggota`,`tb_anggota`.`gol` AS `gol`,`tb_dinas`.`namadinas` AS `namadinas`,`tb_dinas`.`alamatdinas` AS `alamatdinas` from ((`tb_pinjaman` join `tb_anggota` on((`tb_pinjaman`.`idanggota` = `tb_anggota`.`idanggota`))) join `tb_dinas` on((`tb_anggota`.`iddinas` = `tb_dinas`.`iddinas`))) */;

/*View structure for view vw_shu */

/*!50001 DROP TABLE IF EXISTS `vw_shu` */;
/*!50001 DROP VIEW IF EXISTS `vw_shu` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_shu` AS select `tb_shu`.`idshu` AS `idshu`,`tb_shu`.`tglpenetapan` AS `tglpenetapan`,`tb_shu`.`tahunshu` AS `tahunshu`,`tb_shu`.`totalpendapatan` AS `totalpendapatan`,`tb_shu`.`totalbeban` AS `totalbeban`,`tb_shu`.`totalsimpanan` AS `totalsimpanan`,`tb_shu`.`totalbayar` AS `totalbayar`,(((`tb_shu`.`totalpendapatan` - `tb_shu`.`totalbeban`) * 27.5) / 100) AS `jasa`,(((`tb_shu`.`totalpendapatan` - `tb_shu`.`totalbeban`) * 25) / 100) AS `laba`,((((`tb_shu`.`totalpendapatan` - `tb_shu`.`totalbeban`) * 27.5) / 100) / `tb_shu`.`totalbayar`) AS `persenjasa`,((((`tb_shu`.`totalpendapatan` - `tb_shu`.`totalbeban`) * 25) / 100) / `tb_shu`.`totalsimpanan`) AS `persenlaba` from `tb_shu` */;

/*View structure for view vw_shuanggota */

/*!50001 DROP TABLE IF EXISTS `vw_shuanggota` */;
/*!50001 DROP VIEW IF EXISTS `vw_shuanggota` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_shuanggota` AS select `tb_shuanggota`.`id` AS `id`,`tb_shuanggota`.`tgl` AS `tgl`,`tb_shuanggota`.`idshu` AS `idshu`,`tb_shuanggota`.`idanggota` AS `idanggota`,`tb_shuanggota`.`jumlahsimpanan` AS `jumlahsimpanan`,`tb_shuanggota`.`labasimpanan` AS `labasimpanan`,`tb_shuanggota`.`jumlahbayar` AS `jumlahbayar`,`tb_shuanggota`.`labajasa` AS `labajasa`,`tb_shu`.`tglpenetapan` AS `tglpenetapan`,`tb_shu`.`tahunshu` AS `tahunshu`,`tb_shu`.`totalpendapatan` AS `totalpendapatan`,`tb_shu`.`totalbeban` AS `totalbeban`,`tb_anggota`.`iddinas` AS `iddinas`,`tb_dinas`.`namadinas` AS `namadinas`,`tb_dinas`.`alamatdinas` AS `alamatdinas`,`tb_anggota`.`namaanggota` AS `namaanggota`,`tb_anggota`.`nip` AS `nip`,`tb_anggota`.`tgllahir` AS `tgllahir`,`tb_anggota`.`agama` AS `agama`,`tb_anggota`.`jabatan` AS `jabatan`,`tb_anggota`.`alamatanggota` AS `alamatanggota`,`tb_anggota`.`gol` AS `gol` from (((`tb_shuanggota` join `tb_shu` on((`tb_shuanggota`.`idshu` = `tb_shu`.`idshu`))) join `tb_anggota` on((`tb_shuanggota`.`idanggota` = `tb_anggota`.`idanggota`))) join `tb_dinas` on((`tb_anggota`.`iddinas` = `tb_dinas`.`iddinas`))) */;

/*View structure for view vw_simpanan */

/*!50001 DROP TABLE IF EXISTS `vw_simpanan` */;
/*!50001 DROP VIEW IF EXISTS `vw_simpanan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_simpanan` AS select `tb_simpanan`.`idsimpanan` AS `idsimpanan`,`tb_simpanan`.`tgltagih` AS `tgltagih`,`tb_simpanan`.`tglsimpan` AS `tglsimpan`,`tb_simpanan`.`idanggota` AS `idanggota`,`tb_anggota`.`iddinas` AS `iddinas`,`tb_dinas`.`namadinas` AS `namadinas`,`tb_dinas`.`alamatdinas` AS `alamatdinas`,`tb_anggota`.`nip` AS `nip`,`tb_anggota`.`namaanggota` AS `namaanggota`,`tb_anggota`.`tgllahir` AS `tgllahir`,`tb_anggota`.`agama` AS `agama`,`tb_anggota`.`jabatan` AS `jabatan`,`tb_anggota`.`alamatanggota` AS `alamatanggota`,`tb_anggota`.`gol` AS `gol`,`tb_anggota`.`tgldaftar` AS `tgldaftar`,`tb_simpanan`.`pokok` AS `pokok`,`tb_simpanan`.`wajib` AS `wajib`,`tb_simpanan`.`sukarela` AS `sukarela`,`tb_simpanan`.`sosial` AS `sosial`,`tb_simpanan`.`dapen` AS `dapen`,`tb_simpanan`.`haji` AS `haji`,`tb_simpanan`.`umroh` AS `umroh`,`tb_simpanan`.`laba` AS `laba`,`tb_simpanan`.`jasa` AS `jasa`,`tb_simpanan`.`art` AS `art`,`tb_simpanan`.`artke` AS `artke`,`tb_simpanan`.`usipa` AS `usipa`,`tb_simpanan`.`usipake` AS `usipake`,`tb_simpanan`.`status` AS `status` from ((`tb_anggota` join `tb_dinas` on((`tb_anggota`.`iddinas` = `tb_dinas`.`iddinas`))) join `tb_simpanan` on((`tb_simpanan`.`idanggota` = `tb_anggota`.`idanggota`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
