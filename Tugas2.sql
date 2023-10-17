create database penjualandvd;

use penjualandvd;

create table movie(
	kode_dvd varchar(10),
	judul varchar (60),
	harga_sewa double,
	denda double,
	tahun_rilis smallint,
	primary key(kode_dvd)
);

create table genre(
	id_genre smallint,
	genre varchar (45),
	primary key (id_genre)
);
create table kecamatan(
	id_kecamatan smallint,
	kecamatan varchar(45),
	primary key (id_kecamatan)
);

create table genre_movie(
	id_genre smallint,
	kode_dvd varchar (10),
	foreign key (id_genre) references genre(id_genre),
	foreign key (kode_dvd) references movie (kode_dvd)
);

create table kelurahan(
	id_kelurahan smallint,
	kecamatan varchar(45),
	id_kecamatan smallint references kecamatan(id_kecamatan),
	primary key (id_kelurahan)
);


create table pelanggan(
	kode_pelanggan varchar (10),
	id_kelurahan smallint,
	nama varchar(60),
	alamat varchar(60),
	jenis_kelamin char(1),
	primary key (kode_pelanggan),
	check (jenis_kelamin in ('p','l')),
	foreign key (id_kelurahan) references kelurahan(id_kelurahan)
);

create table transaksi(
	kode_dvd varchar (10),
	kode_pelanggan varchar (10), 
	tanggal_sewa date,
	tanggal_wajib_kembali date,
	tanggal_realisi_kembali date,
	primary key (kode_dvd,kode_pelanggan,tanggal_sewa),
	foreign key (kode_dvd) references movie(kode_dvd),
	foreign key (kode_pelanggan) references pelanggan(kode_pelanggan)
);

create table kontak_pelanggan(
	no_hp varchar (25),
	kode_pelanggan varchar (10) references pelanggan (kode_pelanggan),
	unique (no_hp)
);


