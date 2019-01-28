CREATE TABLE PENGGUNA(
  ID_USER CHAR(6) NOT NULL ENABLE,
  NAMA_USER VARCHAR2(20),
  TGL_LAHIR DATE,
  CONSTRAINT USER_PK PRIMARY KEY(ID_USER) ENABLE
);

CREATE TABLE EMAIL_PENGGUNA(
  ID_USER CHAR(6),
  EMAIL VARCHAR2(30),
  CONSTRAINT USER_FK FOREIGN KEY(ID_USER)
  REFERENCES PENGGUNA(ID_USER) ON DELETE CASCADE ENABLE
);

CREATE TABLE DEVELOPER(
  ID_DEVELOPER CHAR(6) NOT NULL ENABLE,
  NAMA_DEVELOPER VARCHAR2(20),
  CONSTRAINT DEVELOPER_PK PRIMARY KEY(ID_DEVELOPER) ENABLE
);

CREATE TABLE AKUN(
  USERNAME VARCHAR2(20) NOT NULL ENABLE,
  ID_USER CHAR(6),
  ID_DEVELOPER CHAR(6),
  PASSWORD VARCHAR2(10),
  CONSTRAINT USERNAME_PK PRIMARY KEY(USERNAME) ENABLE,
  CONSTRAINT AKUN_FK1 FOREIGN KEY(ID_USER)
  REFERENCES PENGGUNA(ID_USER) ON DELETE CASCADE ENABLE,
  CONSTRAINT AKUN_FK2 FOREIGN KEY(ID_DEVELOPER)
  REFERENCES DEVELOPER(ID_DEVELOPER) ON DELETE CASCADE ENABLE
);

CREATE TABLE BARANG_IMPIAN(
  ID_BARANG_IMPIAN CHAR(6) NOT NULL ENABLE,
  NAMA_BARANG VARCHAR2(20),
  HARGA NUMBER,
  BATAS_WAKTU DATE,
  USERNAME VARCHAR2(20),
  CONSTRAINT ID_BARANG_IMPIAN_PK PRIMARY KEY(ID_BARANG_IMPIAN) ENABLE,
  CONSTRAINT BARANG_IMPIAN_FK FOREIGN KEY(USERNAME)
  REFERENCES AKUN(USERNAME) ON DELETE CASCADE ENABLE
);

CREATE TABLE HUTANG(
  ID_HUTANG CHAR(6) NOT NULL ENABLE,
  USERNAME VARCHAR2(20),
  NAMA_PEMINJAM VARCHAR2(20),
  NOMINAL NUMBER,
  CONSTRAINT ID_HUTANG_PK PRIMARY KEY(ID_HUTANG) ENABLE,
  CONSTRAINT HUTANG_FK FOREIGN KEY(USERNAME) 
  REFERENCES AKUN(USERNAME) ON DELETE CASCADE ENABLE
);

CREATE TABLE BUDGET(
  ID_BUDGET CHAR(6) NOT NULL ENABLE,
  USERNAME VARCHAR2(20),
  NOMINAL NUMBER,
  CONSTRAINT ID_BUDGET_PK PRIMARY KEY(ID_BUDGET) ENABLE,
  CONSTRAINT BUDGET_FK FOREIGN KEY(USERNAME)
  REFERENCES AKUN(USERNAME) ON DELETE CASCADE ENABLE
);

CREATE TABLE REKAP_BUDGET(
  ID_BUDGET CHAR(6) NOT NULL ENABLE,
  TGL_BUDGET DATE,
  CONSTRAINT REKAP_BUDGET_FK FOREIGN KEY(ID_BUDGET)
  REFERENCES BUDGET(ID_BUDGET) ON DELETE CASCADE ENABLE
);

CREATE TABLE PEMASUKAN(
  ID_PEMASUKAN CHAR(6) NOT NULL ENABLE,
  NOMINAL NUMBER,
  CONSTRAINT ID_PEMASUKAN_PK PRIMARY KEY(ID_PEMASUKAN) ENABLE
);

CREATE TABLE PENGELUARAN(
  ID_PENGELUARAN CHAR(6) NOT NULL ENABLE,
  NOMINAL NUMBER,
  CONSTRAINT ID_PENGELUARAN_PK PRIMARY KEY(ID_PENGELUARAN) ENABLE
);

CREATE TABLE REKAP_PEMASUKAN(
  ID_PEMASUKAN CHAR(6),
  TGL DATE,
  CONSTRAINT REKAP_PEMASUKAN_FK FOREIGN KEY(ID_PEMASUKAN)
  REFERENCES PEMASUKAN(ID_PEMASUKAN) ON DELETE CASCADE ENABLE
);

CREATE TABLE REKAP_PENGELUARAN(
  ID_PENGELUARAN CHAR(6),
  TGL DATE,
  CONSTRAINT REKAP_PENGELUARAN_FK FOREIGN KEY(ID_PENGELUARAN)
  REFERENCES PENGELUARAN(ID_PENGELUARAN) ON DELETE CASCADE ENABLE
);

CREATE TABLE MENYIMPAN(
  ID_PEMASUKAN CHAR(6),
  ID_PENGELUARAN CHAR(6),
  ID_BUDGET CHAR(6),
  CONSTRAINT MENYIMPAN_FK1 FOREIGN KEY(ID_PEMASUKAN)
  REFERENCES PEMASUKAN(ID_PEMASUKAN) ON DELETE CASCADE ENABLE,
  CONSTRAINT MENYIMPAN_FK2 FOREIGN KEY(ID_PENGELUARAN)
  REFERENCES PENGELUARAN(ID_PENGELUARAN) ON DELETE CASCADE ENABLE,
  CONSTRAINT MENYIMPAN_FK3 FOREIGN KEY(ID_BUDGET)
  REFERENCES BUDGET(ID_BUDGET) ON DELETE CASCADE ENABLE
);

CREATE TABLE LAPORAN(
  ID_REKAP CHAR(6) NOT NULL ENABLE,
  TGL_REKAP DATE,
  CONSTRAINT LAPORAN_PK PRIMARY KEY(ID_REKAP) ENABLE
);

CREATE TABLE MEMROSES(
  ID_BUDGET CHAR(6),
  ID_HUTANG CHAR(6),
  ID_REKAP CHAR(6),
  CONSTRAINT MEMROSES_FK1 FOREIGN KEY(ID_BUDGET)
  REFERENCES BUDGET(ID_BUDGET) ON DELETE CASCADE ENABLE,
  CONSTRAINT MEMROSES_FK2 FOREIGN KEY(ID_HUTANG)
  REFERENCES HUTANG(ID_HUTANG) ON DELETE CASCADE ENABLE,
  CONSTRAINT MEMROSES_FK3 FOREIGN KEY(ID_REKAP)
  REFERENCES LAPORAN(ID_REKAP) ON DELETE CASCADE ENABLE
);

