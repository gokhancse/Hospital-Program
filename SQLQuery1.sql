CREATE TABLE Doctors(
	NameSurname text,
	TCNo varchar(20) not null primary key,
	Department varchar(50),
	StartingDate datetime,
	Salary int
)

CREATE TABLE Nurses(
Namesurname text,
TCNo varchar(20) not null primary key,
Department varchar(50),
StartingDate datetime,
Salary int
)

CREATE TABLE Staff(
Namesurname text,
TCNo varchar(20) not null primary key,
WorkingFloor int,
StartingDate datetime,
Salary int
)

CREATE TABLE Managers(
Namesurname text,
TCNo varchar(20) not null primary key,
Department varchar(50),
StartingDate datetime,
Salary int
)

CREATE TABLE Departments(
DepartmentID int,
Department varchar(50),
Place int,
Price int
)

CREATE TABLE Ambulance(
Plate varchar(50) not null primary key,
Driver text,
CarModel text
)

CREATE TABLE EmergencyService(
Date datetime,
DoctorID varchar(20),
NursesID varchar(20)
)
-- ALTERS

ALTER TABLE EmergencyService
ADD ID INT NOT NULL

-- CONSTRAINTS

ALTER TABLE Doctors
ADD CONSTRAINT fk_Doctors_Department FOREIGN KEY (Department) REFERENCES Departments (DepartmentID)

ALTER TABLE Nurses
ADD CONSTRAINT fk_Nurses_Department FOREIGN KEY (Department) REFERENCES Departments (DepartmentID)

ALTER TABLE EmergencyService
ADD CONSTRAINT fk_EmergencyService_Department FOREIGN KEY (DoctorID) REFERENCES Doctors (TCNo)

ALTER TABLE EmergencyService
ADD CONSTRAINT fk_EmergencyService_NursesID FOREIGN KEY (NursesID) REFERENCES Nurses (TCNo)


-- INSERT COMMANDS


INSERT INTO Departments(DepartmentID,Department,Place,Price)VALUES(1,'Dahiliye',1,10)
INSERT INTO Departments(DepartmentID,Department,Place,Price)VALUES(2,'Çocuk',1,30)
INSERT INTO Departments(DepartmentID,Department,Place,Price)VALUES(3,'Kadýn Doðum',2,30)
INSERT INTO Departments(DepartmentID,Department,Place,Price)VALUES(4,'Acil',3,0)
INSERT INTO Departments(DepartmentID,Department,Place,Price)VALUES(5,'BoioKimya Laboratuarý',4,50)
INSERT INTO Departments(DepartmentID,Department,Place,Price)VALUES(6,'Acil Laboratuar',3,0)


INSERT INTO Doctors(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('Ahmet Hakan','2222111144',1,'2001-01-20',4500)
INSERT INTO Doctors(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('Ali Veli','223244421144',2,'2012-10-20',3000)
INSERT INTO Doctors(NameSurname,TCNo,Department,StartingDate,Salary)VALUES('Mehmet Iþýk','29998866671144',1,'1990-12-23',6000)


INSERT INTO Nurses(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Aylin Kaya','99999999',1,'2013-03-01',1000)
INSERT INTO Nurses(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Ayþe Fatma','88888888',2,'2013-03-04',1000)
INSERT INTO Nurses(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Merve Uz','55555555',3,'2012-03-01',1000)


INSERT INTO Staff(Namesurname,TCNo,WorkingFloor,StartingDate,Salary)VALUES('Zülküf Çoban','12121212',5,'2013-04-01',2000)


INSERT INTO Managers(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Recep Çakman','144544','Müdür','1990-01-01',10000)
INSERT INTO Managers(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Volkan Demir','544111','Müdür Yardýmcýsý','1993-01-01',8000)
INSERT INTO Managers(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Mehmet Iþýk','29998866671144',1,'1990-12-23',6000)
INSERT INTO Managers(Namesurname,TCNo,Department,StartingDate,Salary)VALUES('Merve Uz','55555555',3,'2012-03-01',1000)

INSERT INTO EmergencyService(Date,DoctorID,NursesID)VALUES('2013-12-11','223244421144','88888888')
INSERT INTO EmergencyService(Date,DoctorID,NursesID)VALUES('2013-12-10','2222111144','99999999')








