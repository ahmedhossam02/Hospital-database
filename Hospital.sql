create database Hospital;
use Hospital;
CREATE TABLE patient
(
  Fname VARCHAR(50) NOT NULL,
  Lname VARCHAR(50) NOT NULL,
  patient_id INT NOT NULL,
  National_id INT NOT NULL,
  Bdate DATE ,
  gender CHAR(1) ,
  patient_room_id INT NOT NULL
  
);

CREATE TABLE Department
(
  DepartmentName VARCHAR(50) NOT NULL,
  DepartmentCode VARCHAR(50) NOT NULL,
  
);

CREATE TABLE clinics
(
  clinicCode VARCHAR(50) NOT NULL,
  clinicName VARCHAR(50) NOT NULL,
  DepartmentCode VARCHAR(50) NOT NULL,
 
);

CREATE TABLE patient_record
(
  Patient_record_id INT NOT NULL,
  patient_Record_Name VARCHAR(50) NOT NULL,
  patient_id INT NOT NULL,
 
);

CREATE TABLE medical_equipment
(
  MedicalName VARCHAR(50) NOT NULL,
  MedicalId INT NOT NULL,
  MedicalType VARCHAR(50) NOT NULL,
  clinicCode VARCHAR(50),
  
  
);

CREATE TABLE Relatives
(
  RelativeId INT NOT NULL,
  Relative_name VARCHAR(50) NOT NULL,
  R_national_Id INT NOT NULL,
  Relativity_degree VARCHAR(50) NOT NULL,
  
);

CREATE TABLE has
(
  RelativeId INT NOT NULL,
  Relative_name VARCHAR(50) NOT NULL,
  patient_id INT NOT NULL,
 
);

CREATE TABLE Doctor
(
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  Doctor_id INT NOT NULL,
  Bdate DATE ,
  salary INT NOT NULL,
  gender CHAR(1) NOT NULL,
  DepartmentCode VARCHAR(50) NOT NULL,
  
);

CREATE TABLE nurse
(
  nurse_id INT NOT NULL,
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  Bdate DATE ,
  salary INT NOT NULL,
  gender CHAR(1) NOT NULL,
  DepartmentCode VARCHAR(50) NOT NULL,
  
);

CREATE TABLE accesss
(
  Doctor_id INT NOT NULL,
  Patient_record_id INT NOT NULL,
  patient_id INT NOT NULL,
  
);

CREATE TABLE can_have
(
  ttime VARCHAR(50) NOT NULL,
  clinicCode VARCHAR(50) NOT NULL,
  Doctor_id INT NOT NULL,
  
);

CREATE TABLE Staff
(
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  staff_id INT NOT NULL,
  Bdate DATE ,
  salary INT NOT NULL,
  JopTitle VARCHAR(50) NOT NULL,
  gender CHAR(1) NOT NULL,
  DepartmentCode VARCHAR(50) NOT NULL,
  supervise_staff_id INT NOT NULL,
  
);
CREATE TABLE patient_room(
patient_room_id INT NOT NULL,
patient_room_name VARCHAR(50),
room_size INT NOT NULL
);


Alter table patient add constraint pk_1 primary key(patient_id);
Alter table Department add constraint pk_2 primary key(DepartmentCode);
Alter table clinics add constraint pk_3 primary key (clinicCode);
Alter table clinics add constraint fk_1 foreign key (DepartmentCode) references Department(DepartmentCode);
Alter table patient_record add constraint pkc_1 primary key (Patient_record_id, patient_id);
Alter table patient_record add constraint fk_2 foreign key (patient_id) references Patient (patient_id);
Alter table medical_equipment add constraint pk_4 PRIMARY KEY (MedicalId);
Alter table medical_equipment add constraint fk_3 foreign KEY (clinicCode) REFERENCES clinics(clinicCode) ;
Alter table Relatives add constraint pkc_2 PRIMARY KEY (RelativeId, Relative_name);
Alter table has add constraint pkc_3 PRIMARY KEY (RelativeId, Relative_name, patient_id);
 Alter table has add constraint fkc_1 FOREIGN KEY (RelativeId, Relative_name) REFERENCES Relatives(RelativeId, Relative_name);
  Alter table has add constraint fk_4 FOREIGN KEY (patient_id) REFERENCES patient(patient_id);
   Alter table Doctor add constraint pk_5 PRIMARY KEY (Doctor_id);
 Alter table Doctor add constraint fk_5 FOREIGN KEY (DepartmentCode) REFERENCES Department(DepartmentCode);
  Alter table nurse add constraint pk_6 PRIMARY KEY (nurse_id);
  Alter table nurse add constraint fk_6 FOREIGN KEY (DepartmentCode) REFERENCES Department(DepartmentCode);
  Alter table can_have add constraint pkc_4 PRIMARY KEY (clinicCode, Doctor_id);
 Alter table can_have add constraint fk_7 FOREIGN KEY (clinicCode) REFERENCES clinics(clinicCode);
  Alter table can_have add constraint fk_8 FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id);
  Alter table accesss add constraint pkc_5 PRIMARY KEY (Doctor_id, Patient_record_id, patient_id);
  Alter table accesss add constraint fk_9 FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id);
  Alter table accesss add constraint fkc_2 FOREIGN KEY (Patient_record_id, patient_id) REFERENCES patient_record(Patient_record_id, patient_id);
 Alter table Staff add constraint pk_7 PRIMARY KEY (staff_id);
 Alter table Staff add constraint fk_10 FOREIGN KEY (DepartmentCode) REFERENCES Department(DepartmentCode);
  Alter table Staff add constraint fk_11 FOREIGN KEY (supervise_staff_id) REFERENCES Staff(staff_id);
  Alter table patient_room add constraint pk_8 primary key (patient_room_id);
  
 alter table patient add constraint fk_12 foreign key (patient_room_id) references patient_room(patient_room_id);
  Alter table patient add constraint ch_1 check(gender='m' or gender='f');
Alter table Doctor add constraint ch_2 check(gender='m' or gender='f');
Alter table nurse add constraint ch_3 check(gender='m' or gender='f');
Alter table Staff add constraint ch_4 check(gender='m' or gender='f');
Alter table patient_room add constraint ch_5 check(room_size=0 or room_size=1 or room_size=2);



INSERT INTO Department (DepartmentName, DepartmentCode)
VALUES
('Emergency Department', 'ED'),
('Intensive Care Unit', 'ICU'),
('Surgery Department', 'SD'),
('Obstetrics and Gynecology Department', 'OBGYN'),
('Pediatrics Department', 'PEDS'),
('Cardiology Department', 'CARD'),
('Oncology Department', 'ONC'),
('Neurology Department', 'NEURO'),
('Radiology Department', 'RAD'),
('Pharmacy Department', 'PHARM');

INSERT INTO Nurse 
VALUES
(1,'Mazen', 'Mohsen', '1990-01-01', 50000, 'M', 'ED'),
(2,'Sarah', 'Mohammed', '1985-05-10', 60000, 'F', 'ICU'),
(3,'Mohmmed', 'Amr', '1978-12-15', 70000, 'M', 'SD'),
(4,'Maya', 'Ibrahim', '1983-08-20', 80000, 'F', 'OBGYN'),
(5,'Mohab', 'Amr', '1995-03-05', 55000, 'M', 'PEDS'),
(6,'Heba', 'Ahmed', '1989-06-30', 65000, 'F', 'CARD'),
(7,'Israa', 'Omar', '1975-11-25', 75000, 'F', 'ONC'),
(8,'Farid', 'Mazen', '1980-04-15', 85000, 'M', 'NEURO'),
(9,'Fouad', 'Roshdi', '1988-09-10', 90000, 'M', 'RAD'),
(10,'Imam', 'Kazim', '1980-04-15', 85000, 'M', 'PHARM')
;
INSERT INTO Staff 
VALUES 
    ('Ahmed', 'Al-Masry', 1001, '1980-01-01', 60000, 'Supervisor', 'M', 'ICU', 1004),
    ('Sarah', 'Saeed', 1002, '1985-05-10', 50000, 'Jaintor', 'F', 'ED', 1001),
    ('Mohammed', 'Ali', 1003, '1978-12-15', 70000, 'Security', 'M', 'SD', 1004),
    ('Laila', 'Ibrahim', 1004, '1990-08-20', 80000, 'Supervisor', 'F', 'OBGYN', 1001),
    ('Hassan', 'Hamza', 1005, '1995-03-05', 55000, 'Reseptionist', 'M', 'PEDS', 1001),
    ('Nadia', 'Taylor', 1006, '1982-11-30', 75000, 'Reseptionist', 'F', 'ICU', 1004),
    ('David', 'Abdullah', 1007, '1988-07-12', 45000, 'Jaintor', 'M','PHARM',1001),
	('Yusuf', 'Hussein', 1008, '1992-04-18', 65000, 'Security', 'M', 'ICU', 1004),
    ('Ahmed', 'Baker', 1009, '1987-09-25', 90000, 'Janitor', 'M', 'CARD', 1001),
    ('Mai', 'Mohammed', 1010, '1994-02-14', 55000, 'Reseptionist', 'F', 'PEDS', 1001);


	INSERT INTO Doctor
VALUES
('Khalid', 'Al-Farsi', 2001, '1985-12-01', 90000, 'M', 'SD'),
('Sara', 'Al-Mansoori', 2002, '1990-03-15', 75000, 'F', 'PEDS'),
('Youssef', 'Abdullah', 2003, '1983-07-20', 80000, 'M', 'OBGYN'),
('Aisha', 'Al-Sultan', 2004, '1994-05-10', 60000, 'F', 'ED'),
('Mohammed', 'Al-Hamad', 2005, '1987-11-25', 120000, 'M', 'ONC'),
('Fatima', 'Al-Mohsen', 2006, '1992-09-08', 70000, 'F', 'CARD'),
('Ali', 'Al-Khalifa', 2007, '1986-06-12', 95000, 'M', 'OBGYN'),
('Noura', 'Al-Harbi', 2008, '1996-02-23', 55000, 'F', 'NEURO'),
('Hassan', 'Al-Qasimi', 2009, '1989-04-30', 85000, 'M', 'PHARM'),    
('Fatima', 'Al-Abdullah', 2010, '1995-08-12', 70000, 'F', 'ED');



INSERT INTO Clinics 
VALUES 
 ('C1', 'Family Health Clinic', 'ED'),
    ('C2', 'Pediatric Clinic', 'PEDS'),
    ('C3', 'Cardiology Clinic', 'CARD'),
    ('C4', 'Emergency Clinic', 'ED'),
    ('C5', 'Dental Clinic', 'PEDS'),
    ('C6', 'Neurology Clinic', 'NEURO'),
    ('C7', 'Oncology Clinic', 'ONC'),
    ('C8', 'Psychiatry Clinic', 'PHARM'),
    ('C9', 'Physical Therapy Clinic', 'ONC'),
    ('C10', 'Obstetrics and Gynecology Clinic','OBGYN');


	INSERT INTO Can_Have (Ttime, ClinicCode, Doctor_Id)
VALUES 
    ('9:00 AM', 'C1', 2001),
    ('10:00 AM', 'C1', 2002),
    ('11:00 AM', 'C2', 2003),
    ('2:00 PM', 'C2', 2001),
    ('3:00 PM', 'C3', 2004),
    ('4:00 PM', 'C3', 2005),
    ('5:00 PM', 'C4', 2006),
    ('6:00 PM', 'C4', 2003),
    ('7:00 PM', 'C5', 2002),
    ('8:00 PM', 'C5', 2004);



	INSERT INTO Relatives 
VALUES 
    (4001, 'Ali Ahmed', 123456789, 'Father'),
    (4002, 'Fatima Ali', 234567890, 'Mother'),
    (4003, 'Hassan Ali', 345678901, 'Brother'),
    (4004, 'Sara Ahmed', 456789012, 'Sister'),
    (4005, 'Abdullah Ali', 567890123, 'Uncle'),
    (4006, 'Noura Ahmed', 678901234, 'Aunt'),
    (4007, 'Mohammed Ali', 789012345, 'Grandfather'),
    (4008, 'Aisha Ahmed', 890123456, 'Grandmother'),
    (4009, 'Youssef Ali', 901234567, 'Cousin'),
    (4010, 'Layla Ahmed', 123456780, 'Cousin');


	INSERT INTO Patient_Room 
VALUES 
    (101, 'Room 101', 1),
    (102, 'Room 102', 1),
    (103, 'Room 103', 2),
    (104, 'Room 104', 2),
    (105, 'Room 105', 1),
    (106, 'Room 106', 1),
    (107, 'Room 107', 2),
    (108, 'Room 108', 2),
    (109, 'Room 109', 1),
    (110, 'Room 110', 2);

	INSERT INTO Has 
VALUES 
    (4001, 'Ali Ahmed', 3001),
    (4002, 'Fatima Ali', 3001),
    (4003, 'Hassan Ali', 3002),
    (4004,'Sara Ahmed' , 3003),
    (4005, 'Abdullah Ali', 3004),
    (4006,'Noura Ahmed' , 3005),
    (4007,'Mohammed Ali' , 3006),
    (4008, 'Aisha Ahmed', 3007),
    (4009, 'Youssef Ali', 3008),
    (4010, 'Layla Ahmed', 3009);

INSERT INTO Patient 
VALUES
('Ahmed', 'Ali', 3001, 123456789, '1995-05-12', 'M', 103),
('Fatima', 'Hassan', 3002, 234567890, '1996-02-18', 'F',103),
('Ali', 'Sara', 3003, 345678901, '1998-09-21', 'M', 104),
('Nora', 'Salman', 3004, 456789012, '1994-11-08', 'F', 104),
('Hassan', 'Ibrahim', 3005, 567890123, '1993-06-15','M',101),
('Sara', 'Khalid', 3006, 678901234, '1991-12-25', 'F', 110),
('Ali', 'Ahmed', 3007, 789012345, '1992-08-02', 'M', 110),
('Nadia', 'Abdulaziz', 3008, 890123456, '1997-04-16', 'F', 109),
('Khalid', 'Mohammed', 3009, 901234567, '1990-10-11', 'M', 108),
('Hala', 'Abdullah', 3010, 345678901, '1993-01-28', 'F', 106);


INSERT INTO accesss 
VALUES 
    (2001, 501, 3001),
    (2001, 502, 3002),
    (2003, 503, 3003),
    (2004, 504, 3004),
    (2005, 505, 3005),
    (2006, 506, 3006),
    (2005, 507, 3007),
    (2007, 508, 3008),
    (2008, 509, 3009),
    (2010, 510, 3010);

INSERT INTO Patient_Record 
VALUES 
  (501, 'Blood test', 3001),
    (502, 'X-Ray', 3002),
    (503, 'CT Scan', 3003),
    (504, 'MRI', 3004),
    (505, 'Ultrasound', 3005),
    (506, 'Blood Pressure Check', 3006),
    (507, 'ECG', 3007),
    (508, 'Ventilation', 3008),
    (509, 'Defibrillation', 3009),
    (510, 'Infusion', 3010);


	INSERT INTO Medical_Equipment 
VALUES 
    ('X-Ray Machine', 1, 'Diagnostic', 'C3'),
    ('Ultrasound Machine', 2, 'Diagnostic', 'C2'),
    ('CT Scanner', 3, 'Diagnostic', 'C7'),
    ('MRI Machine', 4, 'Diagnostic', 'C6'),
    ('Defibrillator', 5, 'Life Support', 'C4'),
    ('Ventilator', 6, 'Life Support', 'C1'),
    ('Infusion Pump', 7, 'Life Support', 'C9'),
    ('Patient Monitor', 8, 'Monitoring', 'C5'),
    ('Electrocardiogram Machine', 9, 'Diagnostic', 'C3'),
    ('Blood Pressure Monitor', 10, 'Monitoring', 'C8');

	select * from Staff;
	select * from clinics;
	select * from Department;
	select * from Doctor;
	select * from can_have;
	select * from accesss;
	select * from has;
	select * from medical_equipment;
	select * from patient;
	select * from patient_room;
	select * from patient_record;
	select * from nurse;


	/**secound page**/
	select * from Doctor where
	salary > 5000
	order by fname ASC;

	select fname As Male_gender
	from nurse 
	where gender='M'
	order by fname desc;


	select CONCAT(fname,' ',lname) as fullname
	from Staff
	where salary >50000
	order by fullname desc;

	/**third page**/
	Select DepartmentCode, max(salary) as Male_Docotrs_Max_Salary
	from Doctor
	where gender='M'
	group by DepartmentCode
	Having max(salary)>50000
	order by DepartmentCode Asc;


		
	Select DepartmentCode, min(salary) as Female_Min_Salary
	from Staff
	where gender='F'
	group by DepartmentCode
	Having min(salary)<75000
	order by DepartmentCode Asc;

	select DepartmentCode , Max(DATEDIFF(year,Bdate,GETDATE()))AS MaxDoctor_AGE
	From Doctor
	group by DepartmentCode
	Having MAX(DATEDIFF(year,Bdate,GETDATE())) > 26
	order by MaxDoctor_AGE desc;


	/**fourth page**/

	select Fname from Doctor where salary >(select salary from Doctor where Doctor_id=2003 );
	select COUNT(*) as NumberOfSalary from nurse  where salary <(select min(salary) from nurse where DepartmentCode='OBGYN');

	/**fifth page**/

	select distinct fname,Lname,gender  from patient inner join has on patient.patient_id=has.patient_id;
	select *from patient_room full join patient on patient_room.patient_room_id =patient.patient_room_id;
	select *from can_have right join Doctor on can_have.Doctor_id=Doctor.Doctor_id;
	select *from clinics left join medical_equipment on clinics.clinicCode =medical_equipment.clinicCode;
	
	