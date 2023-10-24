drop database tugas2;
create database tugas2;
use tugas2;

create table FAKULTAS(
	ID_fakultas smallint primary key,
	fakultas varchar(45)
);

create table strata(
	ID_Strata smallint primary key,
	singkat varchar(10),
	strata varchar (45)
);

create table seleksi_masuk(
	ID_seleksimasuk smallint primary key,
	singkat varchar(12),
	seleksi_masuk varchar (45)
);

create table jurusan(
	ID_Jurusan smallint primary key,
	ID_fakultas smallint references FAKULTAS(ID_fakultas),
	jurusan varchar (45)
);

create table program_studi(
	id_program_studi smallint primary key,
	id_strata smallint references strata (id_strata),
	id_jurusan smallint references jurusan(id_jurusan),
	program_studi varchar (60)
);

create table mahasiswa(
	NIM varchar (15) primary key,
	id_seleksimasuk smallint references seleksi_masuk (id_seleksimasuk),
	id_program_studi smallint references program_studi (id_program_studi),
	nama varchar(45),
	angkatan smallint,
	tgl_lahir date,
	kota_lahir varchar (60),
	jenis_kelamin char(1)
);

insert into fakultas values
(1,'Ekonomi & Bisnis'),
(2,'Ilmu Komputer');

insert into jurusan values
(21,2,'informatika'),
(22,2,'sistem informasi'),
(23,2,'teknik komputer');

insert into strata values 
(1,'D1','Diploma'),
(2,'S1','Sarjana'),
(3,'S2','Magister');

insert into program_studi values
(211,2,21,'teknik informatika'),
(212,2,21, 'teknik komputer'),
(219,3,21,'magister ilmu komputer');

insert into seleksi_masuk values
(1,'SNMPTN','SELEKSI NASIONAL MAHASISWA PTN'),
(2, 'SBMPTN', 'SELEKSI BERSAMA MAHASISWA PTN');

insert into mahasiswa values
('155150400',1,211,'JONI',2015,'1997-1-1','Malang','W'),
('155150401',2,212,'JONO',2015,'1997-10-2','Situbondo','P');

update mahasiswa set nama = 'DERA' where nama = 'jono';

select * from mahasiswa;

update mahasiswa set nama = 'JONO' where nama ='DERA';

select * from mahasiswa ;

delete from mahasiswa where nama = 'JONI';

select * from mahasiswa ;

