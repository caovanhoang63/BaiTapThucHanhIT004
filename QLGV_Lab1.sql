CREATE DATABASE QLGV;

USE QLGV;
DROP DATABASE QLGV;

CREATE TABLE KHOA(
    MAKHOA VARCHAR(4) PRIMARY KEY ,
    TENKHOA VARCHAR(40),
    NGTLAP DATETIME,
    TRGKHOA CHAR(4),
);

CREATE TABLE MONHOC(
  MAMH VARCHAR(10) PRIMARY KEY,
  TENMH VARCHAR(40),
  TCLT TINYINT,
  TCTH TINYINT,
  MAKHOA VARCHAR(4),
);

CREATE TABLE DIEUKIEN(
    MAMH VARCHAR(10),
    MAMH_TRUOC VARCHAR(10),
    CONSTRAINT PK_DIEUKIEN PRIMARY KEY(MAMH,MAMH_TRUOC),
);

CREATE TABLE GIAOVIEN(
    MAGV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    HOCVI VARCHAR(10),
    HOCHAM VARCHAR(10),
    GIOITINH VARCHAR(3),
    NGSINH DATETIME,
    NGVL DATETIME,
    HESO NUMERIC(4,2),
    MUCLUONG MONEY,
    MAKHOA VARCHAR(4),
);

CREATE TABLE LOP(
    MALOP CHAR(3) PRIMARY KEY ,
    TENLOP VARCHAR(40),
    TRGLOP CHAR(5),
    SISO TINYINT,
    MAGVCN CHAR(4),
);

CREATE TABLE HOCVIEN(
    MAHV CHAR(5) PRIMARY KEY,
    HO VARCHAR(40),
    TEN VARCHAR(10),
    GIOITINH VARCHAR(3),
    NOISINH VARCHAR(40),
    NGSINH DATETIME,
    MALOP CHAR(3),
);

CREATE TABLE GIANGDAY(
    MALOP CHAR(3),
    MAMH VARCHAR(10),
    MAGV CHAR(4),
    HOCKY TINYINT,
    NAM SMALLINT,
    TUNGAY DATETIME,
    DENNGAY DATETIME,
    CONSTRAINT PK_GIANGDAY PRIMARY KEY(MALOP,MAMH),
);

CREATE TABLE KETQUATHI(
    MAHV CHAR(5),
    MAMH VARCHAR(10),
    LANTHI TINYINT,
    NGTHI DATETIME,
    DIEM NUMERIC(4,2),
    KQUA VARCHAR(10),
    CONSTRAINT PK_KETQUATHI PRIMARY KEY(MAHV,MAMH,LANTHI),
);

-- CREATE FOREIGN KEY FOR TABLE HOCVIEN
ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HOCVIEN_LOP FOREIGN KEY(MALOP) REFERENCES LOP(MALOP);

-- CREATE FOREIGN KEY FOR TABLE LOP
ALTER TABLE LOP
ADD CONSTRAINT FK_TRGLOP_HOCVIEN FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV);

ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_GIAOVIEN FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV);

-- CREATE FOREIGN KEY FOR TABLE KHOA
ALTER TABLE KHOA
ADD CONSTRAINT FK_KHOA_GIAOVIEN FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV);

-- CREATE FOREIGN KEY FOR TABLE GIAOVIEN
ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_GIAOVIEN_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA);

-- CREATE FOREIGN KEY FOR TABLE MONHOC
ALTER TABLE MONHOC
ADD CONSTRAINT FK_MONHOC_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA);


-- CREATE FOREIGN KEY FOR TABLE GIANGDAY
ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GIANGDAY_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);

ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GIANGDAY_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);

ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GIANGDAY_GIAOVIEN FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);

-- CREATE FOREIGN KEY FOR TABLE DIEUKIEN
ALTER TABLE DIEUKIEN
ADD CONSTRAINT FK_DIEUKIEN_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);

ALTER TABLE DIEUKIEN
ADD CONSTRAINT FK_DIEUKIEN_MONHOCTRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH);

-- CREATE FOREIGN KEY FOR TABLE KETQUATHI
ALTER TABLE KETQUATHI
ADD CONSTRAINT FK_KETQUATHI_HOCVIEN FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV);

ALTER TABLE KETQUATHI
ADD CONSTRAINT FK_KETQUATHI_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);

-- ALTER TABLE HOCVIEN
ALTER TABLE HOCVIEN
ADD GHICHU VARCHAR(100);

ALTER TABLE HOCVIEN
ADD DIEMTB NUMERIC(4,2);

ALTER TABLE HOCVIEN
ADD XEPLOAI VARCHAR(10);

-- INSERT DATA
INSERT INTO LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES
('K11','Lop 1 khoa 1','K1108',11,'GV07'),
('K12','Lop 2 khoa 1','K1205',12,'GV09'),
('K13','Lop 3 khoa 1','K1305',12,'GV14');

INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA) VALUES
('KHMT','Khoa hoc may tinh','2005-06-07','GV01'),
('HTTT','He thong thong tin','2005-06-07','GV02'),
('CNPM','Cong nghe phan mem','2005-06-07','GV04'),
('MTT','Mang va truyen trong','2005-10-20','GV03'),
('KTMT','Ky thuat may tinh','2005-12-20',null);

INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) VALUES
('K1101', 'Nguyen Van', 'A', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '1986-03-14', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '1986-04-18', 'Nam', 'Nghe An', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '1986-02-27', 'Nam', 'TpHCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '1986-01-24', 'Nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '1986-01-27', 'Nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '1986-02-27', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '1986-01-27', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '1986-02-05', 'Nu', 'Can Tho', 'K11'),
('K1111', 'Le Ha', 'Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen Van', 'B', '1986-02-11', 'Nam', 'TpHCM', 'K12'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
('K1203', 'Tran Thi Kim', 'Duyen', '1986-09-17', 'Nu', 'TpHCM', 'K12'),
('K1204', 'Truong My', 'Hanh', '1986-05-19', 'Nu', 'Dong Nai', 'K12'),
('K1205', 'Nguyen Thanh', 'Nam', '1986-04-17', 'Nam', 'TpHCM', 'K12'),
('K1206', 'Nguyen Thi Truc', 'Thanh', '1986-03-04', 'Nu', 'Kien Giang', 'K12'),
('K1207', 'Tran Thi Bich', 'Thuy', '1986-02-08', 'Nu', 'Nghe An', 'K12'),
('K1208', 'Huynh Thi Kim', 'Trieu', '1986-04-08', 'Nu', 'Tay Ninh', 'K12'),
('K1209', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
('K1210', 'Ngo Thanh', 'Tuan', '1986-02-14', 'Nam', 'TpHCM', 'K12'),
('K1211', 'Do Thi', 'Xuan', '1986-03-09', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi Phi', 'Yen', '1986-03-12', 'Nu', 'TpHCM', 'K12'),
('K1301', 'Nguyen Thi Kim', 'Cuc', '1986-06-09', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Hien', '1986-03-21', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien', '1986-04-18', 'Nam', 'TpHCM', 'K13'),
('K1305', 'Le Thi', 'Huong', '1986-03-27', 'Nu', 'TpHCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu', '1986-03-30', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '1986-04-08', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '1987-01-18', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi Hong', 'Tham', '1986-04-22', 'Nu', 'Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
('K1312', 'Nguyen Thi Kim', 'Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13');

INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES
('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');

INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
('K1101', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '2006-12-28', 9.00, 'Dat'),
('K1101', 'THDC', 1, '2006-05-20', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '2006-05-13', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '2006-07-20', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '2006-07-27', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '2006-08-10', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '2006-12-28', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '2007-01-05', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '2007-01-15', 6.00, 'Dat'),
('K1102', 'THDC', 1, '2006-05-20', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '2006-05-13', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '2006-07-20', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '2006-07-27', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '2006-12-28', 7.00, 'Dat'),
('K1103', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '2006-05-13', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '2006-07-20', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 1, '2006-05-13', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '2006-05-20', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '2006-06-30', 4.00, 'Khong Dat'),
('K1201', 'CSDL', 1, '2006-07-20', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '2006-12-28', 5.00, 'Dat'),
('K1201', 'THDC', 1, '2006-05-20', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '2006-05-13', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '2006-07-20', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '2007-01-05', 5.00, 'Dat'),
('K1202', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '2006-05-27', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '2006-05-13', 3.00, 'Khong Dat'),
('K1202', 'CTRR', 2, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 3, '2006-06-30', 6.25, 'Dat'),
('K1203', 'CSDL', 1, '2006-07-20', 9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '2006-12-28', 9.50, 'Dat'),
('K1203', 'THDC', 1, '2006-05-20', 10.00, 'Dat'),
('K1203', 'CTRR', 1, '2006-05-13', 10.00, 'Dat'),
('K1204', 'CSDL', 1, '2006-07-20', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '2006-12-28', 6.75, 'Dat'),
('K1204', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1204', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),
('K1301', 'CSDL', 1, '2006-12-20', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
('K1301', 'THDC', 1, '2006-05-20', 7.75, 'Dat'),
('K1301', 'CTRR', 1, '2006-05-13', 8.00, 'Dat'),
('K1302', 'CSDL', 1, '2006-12-20', 6.75, 'Dat'),
('K1302', 'CTDLGT', 1, '2006-07-25', 5.00, 'Dat'),
('K1302', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1302', 'CTRR', 1, '2006-05-13', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '2006-12-20', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '2006-07-25', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '2006-08-07', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '2006-08-15', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '2006-05-20', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '2006-05-13', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '2006-05-20', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '2006-12-20', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '2006-07-25', 9.75, 'Dat'),
('K1304', 'THDC', 1, '2006-05-20', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '2006-05-13', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '2006-12-20', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '2006-07-25', 10.00, 'Dat'),
('K1305', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '2006-05-13', 10.00, 'Dat');

INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES
('K11', 'THDC', 'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
('K12', 'THDC', 'GV06', 1, 2006, '2006-01-02', '2006-05-12'),
('K13', 'THDC', 'GV15', 1, 2006, '2006-01-02', '2006-05-12'),
('K11', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K12', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K13', 'CTRR', 'GV08', 1, 2006, '2006-01-09', '2006-05-17'),
('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CSDL', 'GV05', 3, 2006, '2006-08-01', '2006-12-15'),
('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-02-18'),
('K12', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-03-20'),
('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');

INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC) VALUES
('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL');

INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-01-11', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-04-20', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1961-02-22', '2005-01-12', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-03-12', '2005-01-12', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', 4.50, 2025000, 'KHMT'),
('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-03-01', 4.00, 1800000, 'KHMT'),
('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '1974-03-26', '2005-03-01', 1.69, 760500, 'KHMT'),
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '1972-07-17', '2005-03-01', 1.86, 837000, 'CNPM'),
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-01-12', '2005-05-15', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '1980-05-23', '2005-05-15', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-05-15', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-05-04', '2005-05-15', 3.00, 1350000, 'KHMT');

-- Bai 2
CREATE TRIGGER trg_validate_mhv ON HOCVIEN
FOR INSERT
AS
BEGIN
    DECLARE @mahv CHAR(5);
    DECLARE @malop CHAR(3);
    DECLARE @count INT;
    SELECT @mahv = MAHV FROM INSERTED;
    SELECT @malop = MALOP FROM INSERTED;
    SELECT @count = COUNT(*) FROM HOCVIEN WHERE MALOP = @malop;
    PRINT @count;
    IF @mahv != @malop + CAST(@count + 1 as varchar(2))
    BEGIN
        PRINT N'Không thể thêm học viên vào lớp này'
        ROLLBACK TRAN
    END
END;

--Bai 3
ALTER TABLE HOCVIEN
ADD CONSTRAINT CHK_GIOITINH CHECK (GIOITINH IN ('Nam', 'Nu'));

--Bai 4
ALTER TABLE
    KETQUATHI
ADD CONSTRAINT
    CHK_DIEM
CHECK (
    DIEM BETWEEN 0 AND 10
    AND RIGHT(CAST(DIEM AS VARCHAR),3) LIKE '.__'
);

--Bai 5
ALTER TABLE
    KETQUATHI
ADD CONSTRAINT
    CHK_KQUA
CHECK (
    (KQUA ='Dat' AND DIEM between 5 and 10)
    or
    (KQUA ='Khong dat' AND DIEM between 0 and 4.99)
);

--Bai 6
ALTER TABLE
    KETQUATHI
ADD CONSTRAINT
    CHK_LANTHI
CHECK (LANTHI <= 3);

--Bai 7
ALTER TABLE
    GIANGDAY
ADD CONSTRAINT
    CHK_HOCKY
CHECK (HOCKY <= 3);

--Bai 8
ALTER TABLE
    GIAOVIEN
ADD CONSTRAINT
    CHK_HOCVI
CHECK (HOCVI IN ('CN','KS','TS','Ths','PTS'));

--Bai 9
CREATE TRIGGER trg_validate_classleader ON LOP
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @trglop CHAR(5)
    DECLARE @malop CHAR(3)
    SELECT @trglop = TRGLOP FROM INSERTED
    SELECT @malop = MALOP FROM INSERTED
    IF @trglop NOT IN (SELECT MAHV FROM HOCVIEN WHERE HOCVIEN.MALOP= @malop)
    BEGIN
        PRINT N'học sinh này không thuộc lớp'
        ROLLBACK TRAN
    END
END;



--Bai 10
CREATE TRIGGER trg_validate_trgkhoa ON KHOA
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @trgkhoa CHAR(5)
    DECLARE @makhoa CHAR(3)
    DECLARE @hocvi VARCHAR(10)
    SELECT @trgkhoa = TRGKHOA FROM INSERTED
    SELECT @makhoa = MAKHOA FROM INSERTED
    SELECT @hocvi = HOCVI FROM GIAOVIEN WHERE @trgkhoa = MAGV

    IF @hocvi NOT IN ('TS','PTS')
    BEGIN
        PRINT N'Học vị của trường khoa không phù hợp'
        ROLLBACK TRAN
    END
END;


--Bai 11
ALTER TABLE
    HOCVIEN
ADD CONSTRAINT
    CHK_TUOI
CHECK
    (YEAR(GETDATE())-YEAR(NGSINH) >= 18);

--Bai 12
ALTER TABLE
    GIANGDAY
ADD CONSTRAINT
    CHK_NGAYBATDAU
CHECK
    (TUNGAY < DENNGAY);

--Bai 13
ALTER TABLE
    GIAOVIEN
ADD CONSTRAINT
    CHK_TUOI
CHECK
    (YEAR(GETDATE())-YEAR(NGSINH)>2);

--Bai 14
Select * From MONHOC
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS


ALTER TABLE
    MONHOC
ADD CONSTRAINT
    CHK_CHENHLECHTC
CHECK
    (ABS(TCTH- TCLT) <= 3);

--Bai 15


CREATE TRIGGER trg_kiem_tra_ngay_thi ON KETQUATHI
FOR UPDATE, INSERT
AS
BEGIN
    DECLARE @mahv CHAR(5)
    DECLARE @malop CHAR(3)
    DECLARE @mamh VARCHAR(10)
    DECLARE @ngaykt DATETIME
    DECLARE @ngaythi DATETIME

    SELECT @mahv = MAHV FROM INSERTED
    SELECT @mamh = MAMH FROM INSERTED
    SELECT @ngaythi =NGTHI FROM INSERTED
    SELECT @malop = MALOP FROM HOCVIEN WHERE @mahv = MAHV
    SELECT @ngaykt = DENNGAY FROM GIANGDAY WHERE @malop = MALOP AND @mamh = MAMH

    IF @ngaykt >= @ngaythi
    BEGIN
        ROLLBACK TRAN
    END
END
GO
--ii DML

--Bai 1
UPDATE GIAOVIEN
SET	HESO = HESO + 0.2
WHERE MAGV IN (SELECT TRGKHOA FROM KHOA)

--Bai 2
UPDATE HOCVIEN
SET DIEMTB = (
        SELECT AVG(DIEM)
        FROM KETQUATHI KQ1
        WHERE LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI KQ2 WHERE KQ1.MAHV = KQ2.MAHV  GROUP BY KQ2.MAHV) AND HOCVIEN.MAHV = KQ1.MAHV
        GROUP BY KQ1.MAHV
    )

SELECT * FROM  HOCVIEN


--Bai 3

UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE EXISTS(SELECT *
				FROM KETQUATHI KQ
				WHERE (HOCVIEN.MAHV = KQ.MAHV) AND (KQ.DIEM < 5) AND (LANTHI = 3))

--Bai 4



UPDATE HOCVIEN
SET XEPLOAI =
(
	CASE
		WHEN DIEMTB >=9 THEN 'XS'
		WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
		WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
		WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
		WHEN DIEMTB < 5 THEN 'Y'
	END
)


--iii Query language
-- Bai 1
SELECT MAHV, HO, TEN , NGSINH, L.MALOP
FROM HOCVIEN HV INNER JOIN LOP L ON HV.MAHV = L.TRGLOP

-- Bai 2
SELECT HV.MAHV, HO, TEN, LANTHI, DIEM
FROM
    HOCVIEN HV INNER JOIN KETQUATHI K on HV.MAHV = K.MAHV
    INNER JOIN LOP L ON HV.MALOP = L.MALOP
WHERE L.MALOP = 'K12';

--Bai 3
SELECT HV.MAHV, HO, TEN, TENMH
FROM
    HOCVIEN HV INNER JOIN KETQUATHI K on HV.MAHV = K.MAHV
    INNER JOIN MONHOC M on K.MAMH = M.MAMH
WHERE K.LANTHI = 1 AND K.KQUA = 'DAT'

--Bai 4

SELECT  HV.MAHV, HO, TEN
FROM
    HOCVIEN HV INNER JOIN KETQUATHI K on HV.MAHV = K.MAHV
WHERE HV.MALOP ='K11' AND K.LANTHI = '1' AND K.KQUA='Khong dat' AND K.MAMH ='CTRR'

--Bai 5

SELECT DISTINCT
    H.MAHV,H.HO,H.TEN
FROM
    KETQUATHI K1 INNER JOIN HOCVIEN H on K1.MAHV = H.MAHV
WHERE
    H.MALOP LIKE 'K%' AND MAMH='CTRR' AND  NOT EXISTS(
            SELECT * FROM KETQUATHI K2
            WHERE KQUA='DAT' AND MAMH='CTRR' AND K1.MAHV=K2.MAHV
            )

--Bai 6
SELECT DISTINCT M.TENMH
FROM
    GIAOVIEN GV INNER JOIN GIANGDAY G on GV.MAGV = G.MAGV
    INNER JOIN MONHOC M on G.MAMH = M.MAMH
    WHERE GV.HOTEN = 'TRAN TAM THANH' AND G.HOCKY =1 AND G.NAM = 2006

--Bai 7
SELECT M.MAMH,TENMH
FROM
    LOP L INNER JOIN GIAOVIEN GV ON L.MAGVCN = GV.MAGV
    INNER JOIN GIANGDAY GD on GV.MAGV = GD.MAGV
    INNER JOIN MONHOC M on GD.MAMH = M.MAMH
WHERE L.MALOP ='K11' AND HOCKY=1 AND NAM=2006

--Bai 8

SELECT H.HO,H.TEN
    FROM
        GIAOVIEN GV INNER JOIN dbo.GIANGDAY GD on GV.MAGV = GD.MAGV
        INNER JOIN MONHOC M on GD.MAMH = M.MAMH
        INNER JOIN LOP L on GD.MALOP = L.MALOP
        INNER JOIN HOCVIEN H ON H.MAHV = L.TRGLOP
    WHERE HOTEN='NGUYEN TO LAN' AND TENMH='CO SO DU LIEU'

--Bai 9
SELECT M2.TENMH
    FROM
        DIEUKIEN D INNER JOIN MONHOC M on D.MAMH = M.MAMH
        INNER JOIN MONHOC M2 ON D.MAMH_TRUOC = M2.MAMH
    WHERE M.TENMH='CO SO DU LIEU'

--Bai 10

SELECT M2.MAMH, M2.TENMH
    FROM
        DIEUKIEN D INNER JOIN MONHOC M on D.MAMH_TRUOC = M.MAMH
     INNER JOIN MONHOC M2 ON D.MAMH = M2.MAMH
    WHERE M.TENMH = 'CAU TRUC ROI RAC'

--Bai 11

SELECT GV.MAGV, HOTEN
FROM
    GIAOVIEN GV INNER JOIN
    (SELECT MAGV FROM GIANGDAY
        WHERE MAMH='CTRR' AND MALOP='K11' AND HOCKY=1 AND NAM=2006
    INTERSECT
    SELECT MAGV FROM GIANGDAY
        WHERE MAMH='CTRR' AND MALOP='K12' AND HOCKY=1 AND NAM=2006) AS GD
    ON GV.MAGV = GD.MAGV

--Bai 12

SELECT H.MAHV,H.HO,H.TEN
    FROM
            KETQUATHI KQ1 INNER JOIN HOCVIEN H on KQ1.MAHV = H.MAHV
    WHERE MAMH='CSDL' AND KQUA='KHONG DAT' AND LANTHI=1
    AND NOT EXISTS(
        SELECT *
            FROM KETQUATHI KQ2
            WHERE KQ2.MAMH='CSDL' AND KQ2.LANTHI<>1 AND KQ2.MAHV = KQ1.MAHV
    )

--Bai 13


SELECT GV.MAGV,GV.HOTEN
    FROM
        GIAOVIEN GV
    WHERE NOT EXISTS(
        SELECT *
        FROM
            GIANGDAY GD
        WHERE GD.MAGV = GV.MAGV
    )

--Bai 14

SELECT GV.MAGV,GV.HOTEN
    FROM
        GIAOVIEN GV
    WHERE NOT EXISTS(
        SELECT *
        FROM
            GIANGDAY GD INNER JOIN MONHOC M on GD.MAMH = M.MAMH
        WHERE GD.MAGV = GV.MAGV AND GV.MAKHOA = M.MAKHOA
    )

--Bai 15

SELECT KQ.MAHV,HO,TEN
FROM KETQUATHI KQ INNER JOIN HOCVIEN H on KQ.MAHV = H.MAHV
WHERE MALOP = 'K11' AND KQUA='KHONG DAT'
GROUP BY KQ.MAHV,MAMH,HO,TEN HAVING COUNT(LANTHI) > 3
UNION
SELECT KQ.MAHV,HO,TEN
FROM KETQUATHI KQ INNER JOIN HOCVIEN H ON KQ.MAHV =H.MAHV
WHERE MALOP='K11' AND MAMH='CTRR' AND DIEM = 5 AND LANTHI =2

--Bai 16
SELECT HOTEN
From GIAOVIEN
    inner join
(SELECT MAGV
    FROM GIANGDAY
    WHERE MAMH='CTRR'
    GROUP BY MAGV, HOCKY, NAM
    HAVING COUNT (MALOP) >= 2) as kq
on GIAOVIEN.MAGV = kq.MAGV

--Bai 17

SELECT HOCVIEN.MAHV, HO + ' ' + TEN AS HOTEN, LANTHI, DIEM FROM
             HOCVIEN
INNER JOIN
(SELECT KQT.MAHV, LANTHI, DIEM FROM
    KETQUATHI KQT
INNER JOIN
(SELECT MAHV  , MAX( LANTHI) AS LTC FROM KETQUATHI
WHERE MAMH = 'CSDL'
GROUP BY MAHV) AS LTC
ON LTC.MAHV = KQT.MAHV AND  LTC.LTC = KQT.LANTHI
WHERE KQT.MAMH = 'CSDL') AS KQLTC
ON KQLTC.MAHV = HOCVIEN.MAHV

--Bai 18

SELECT HOCVIEN.MAHV, DIEMTHI
FROM HOCVIEN
INNER JOIN
(SELECT MAHV,MAX(DIEM) AS DIEMTHI
FROM KETQUATHI
WHERE MAMH = 'CSDL'
GROUP BY MAHV) AS KQTCN
ON KQTCN.MAHV=HOCVIEN.MAHV

--Bai 19

SELECT * FROM KHOA
WHERE NGTLAP <= ALL (
    SELECT NGTLAP
        FROM KHOA
    )

--Bai 20

SELECT COUNT(*) AS SOGV FROM  GIAOVIEN
WHERE HOCHAM IN ('GS','PGS')

--Bai 21

SELECT MAKHOA, HOCVI , COUNT(*) AS SOGV FROM GIAOVIEN
GROUP BY MAKHOA, HOCVI ORDER BY MAKHOA

--Bai 22

SELECT DEM1.MAMH,SODAT,SOKHONGDAT FROM
             (
                SELECT MAMH, COUNT(DISTINCT MAHV) AS SODAT
                FROM KETQUATHI
                WHERE KQUA = 'DAT'
                GROUP BY MAMH
             ) AS DEM1
INNER JOIN
            (
                SELECT MAMH, COUNT(DISTINCT MAHV) AS SOKHONGDAT
                FROM KETQUATHI KQ1
                WHERE KQUA = 'KHONG DAT' AND MAHV NOT IN (
                    SELECT MAHV
                    FROM KETQUATHI KQ2
                    WHERE KQUA = 'DAT' AND KQ1.MAMH = KQ2.MAMH
                )
            GROUP BY MAMH) AS DEM2
ON  DEM1.MAMH = DEM2.MAMH

--Bai 23

SELECT DISTINCT MAGVCN,HOTEN FROM
    GIANGDAY INNER JOIN LOP ON GIANGDAY.MAGV = LOP.MAGVCN AND GIANGDAY.MALOP = LOP.MALOP
             INNER JOIN GIAOVIEN G on GIANGDAY.MAGV = G.MAGV

--Bai 24
SELECT HO +' ' + TEN AS HOTEN
FROM HOCVIEN
INNER JOIN
(SELECT TOP 1 WITH TIES TRGLOP FROM LOP
ORDER BY SISO DESC) AS KQ
ON HOCVIEN.MAHV = KQ.TRGLOP

--Bai 25
SELECT MAHV, MAMH
FROM KETQUATHI KQ INNER JOIN  LOP L ON KQ.MAHV = L.TRGLOP
select TRGLOP from LOP


SELECT MAHV
FROM KETQUATHI KQ INNER JOIN  LOP L ON KQ.MAHV = L.TRGLOP
WHERE KQUA = 'KHONG DAT' AND NOT EXISTS(
        SELECT * FROM KETQUATHI KQ1
                 WHERE KQ.MAHV = KQ1.MAHV AND KQ1.KQUA = 'DAT'
    )
GROUP BY MAHV
having count(DISTINCT MAMH) >3

DELETE KETQUATHI
WHERE MAHV = 'K1205'

INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
('K1205', 'CSDL', 1, '2006-07-20', 3, 'khong dat'),
('K1205', 'CSDL', 2, '2006-07-20', 3, 'khong dat'),
('K1205', 'CSDL', 3, '2006-07-20', 3, 'khong dat'),
('K1205', 'CTDLGT', 1, '2006-12-28', 6, 'dat'),
('K1205', 'THDC', 1, '2006-05-20',5, 'dat'),
('K1205', 'CTRR', 1, '2006-05-20',3, 'khong dat')

--Bai 26
SELECT TOP 1 WITH TIES H.MAHV, H.HO + ' '+  H.TEN AS HOTEN ,COUNT(*) AS SODIEM910
FROM KETQUATHI K INNER JOIN HOCVIEN H ON K.MAHV = H.MAHV
WHERE DIEM BETWEEN 9 AND 10
GROUP BY H.MAHV, HO,TEN
ORDER BY COUNT(*) DESC

--Bai 27


SELECT H.MAHV, H.HO + ' '+  H.TEN AS HOTEN ,COUNT(*) AS SODIEM910, MALOP
FROM KETQUATHI K INNER JOIN HOCVIEN H ON K.MAHV = H.MAHV
WHERE DIEM BETWEEN 9 AND 10
GROUP BY H.MAHV, HO,TEN,MALOP
HAVING COUNT(*) >= ALL (
        SELECT COUNT(*)
        FROM KETQUATHI K1 INNER JOIN HOCVIEN H1 ON K1.MAHV = H1.MAHV
        WHERE DIEM BETWEEN 9 AND 10 AND H.MALOP = H1.MALOP
        GROUP BY K1.MAHV, H1.MALOP
    )


--Bai 28
SELECT MAGV,NAM,HOCKY, COUNT(DISTINCT MAMH) AS SOMONPHANCONG, COUNT(MALOP) AS SOLOPPHANCONG
FROM GIANGDAY
GROUP BY MAGV, NAM, HOCKY

--Bai 29

SELECT MAGV,NAM,HOCKY, COUNT(*) AS SOLOPPHANCONG
FROM GIANGDAY G1
GROUP BY MAGV, NAM, HOCKY
HAVING COUNT(*) >= ALL (
        SELECT COUNT(*) AS SOLOPPHANCONG
        FROM GIANGDAY G2
        WHERE G1.HOCKY = G2.HOCKY AND G1.NAM = G2.NAM
        GROUP BY MAGV, NAM, HOCKY
    )
--Bai 30
select * from KETQUATHI where LANTHI = 1 and KQUA = 'khong dat'

SELECT TOP 1 WITH TIES K.MAMH, TENMH
FROM KETQUATHI K INNER JOIN MONHOC M on K.MAMH = M.MAMH
WHERE LANTHI = 1 AND KQUA = 'KHONG DAT'
GROUP BY K.MAMH, TENMH
ORDER BY COUNT(MAHV) DESC
--Bai 31
SELECT MAHV
FROM KETQUATHI K1
WHERE LANTHI = 1 AND KQUA = 'DAT' AND NOT EXISTS (
        SELECT *
        FROM KETQUATHI K2
        WHERE K2.KQUA = 'KHONG DAT' AND K1.MAHV = K2.MAHV
    )
GROUP BY MAHV
--Bai 32
SELECT * FROM KETQUATHI

SELECT DISTINCT MAHV
FROM KETQUATHI K1
WHERE NOT EXISTS(SELECT *
                 FROM KETQUATHI K2
                 WHERE K1.MAHV = K2.MAHV
                   AND K2.KQUA = 'KHONG DAT'
                   AND K2.LANTHI = (SELECT MAX(LANTHI)
                                    FROM KETQUATHI K3
                                    WHERE K2.MAHV = K3.MAHV
                                      AND K2.MAMH = K3.MAMH
                                    GROUP BY K3.MAHV, K3.MAMH))
--Bai 33


SELECT distinct MAHV
FROM HOCVIEN H
WHERE NOT EXISTS(
    select *
    from MONHOC m
    where not exists (
        select *
        from KETQUATHI k
        where k.MAMH = m.MAMH and k.MAHV = h.MAHV and KQUA = 'dat' and LANTHI = 1
        )
)

select * from KETQUATHI where MAHV = 'K1111'
delete KETQUATHI where MAHV = 'k1111'

INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES
('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');

INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
('K1111', 'THDC', 1, '2006-07-20', 4.00, 'Khong dat'),
('K1111', 'THDC', 2, '2006-07-20', 3.00, 'KHONG DAT'),
('K1111', 'CTRR', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'CTDLGT', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'PTTKTT', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'DHMT', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'KTMT', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'TKCSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'PTTKHTTT', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'HDH', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'NMCNPM', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'LTCFW', 1, '2006-07-20', 10.00, 'Dat'),
('K1111', 'LTHDT', 1, '2006-07-20', 10.00, 'Dat')
--Bai 34

SELECT distinct MAHV
FROM HOCVIEN H
WHERE NOT EXISTS(select *
                 from MONHOC m
                 where not exists (select *
                                   from KETQUATHI k
                                   where k.MAMH = m.MAMH
                                     and k.MAHV = h.MAHV
                                     and KQUA = 'dat'
                                     and LANTHI = (select max(lanthi)
                                                   from KETQUATHI k1
                                                   where k1.MAHV = k.MAHV
                                                     and k.mamh = k1.MAmh)))

--Bai 35

select *
from
    KETQUATHI k1
inner join
(select MAMH , max(diem) as diem
from KETQUATHI
group by MAMH) as kq
on kq.MAMH = k1.MAMH and k1.DIEM = kq.diem
where LANTHI = (
    select max(lanthi)
    from KETQUATHI k2
    where k1.MAMH = k2.MAMH and k1.mahv = k2.MAHV
    )