CREATE DATABASE HOSPITAL;
USE HOSPITAL;

CREATE TABLE EMPLOYEE
(
  First_Name CHAR(50) NOT NULL,
  Last_Name CHAR(50) NOT NULL,
  Emloyee_id CHAR(50) NOT NULL,
  Contact CHAR(50) NOT NULL,
  Hire_date DATE NOT NULL,
  PRIMARY KEY (Emloyee_id)
);

CREATE TABLE NURSE
(
  Emloyee_id CHAR(50) NOT NULL,
  PRIMARY KEY (Emloyee_id),
  FOREIGN KEY (Emloyee_id) REFERENCES EMPLOYEE(Emloyee_id)
);

CREATE TABLE DOCTOR
(
  Emloyee_id CHAR(50) NOT NULL,
  PRIMARY KEY (Emloyee_id),
  FOREIGN KEY (Emloyee_id) REFERENCES EMPLOYEE(Emloyee_id)
);

CREATE TABLE MEDICINE
(
  Med_Type CHAR(50) NOT NULL,
  Med_ID CHAR(50) NOT NULL,
  Med_Desc CHAR(50) NOT NULL,
  PRIMARY KEY (Med_ID)
);

CREATE TABLE DOCTOR_Specialization
(
  Specialization INT NOT NULL,
  Emloyee_id CHAR(50) NOT NULL,
  PRIMARY KEY (Specialization, Emloyee_id),
  FOREIGN KEY (Emloyee_id) REFERENCES DOCTOR(Emloyee_id)
);

CREATE TABLE ROOM
(
  Room_ID CHAR(50) NOT NULL,
  Type CHAR(50) NOT NULL,
  Max_occupancy INT NOT NULL,
  Occupied CHAR(50) NOT NULL,
  Emloyee_id CHAR(50),
  PRIMARY KEY (Room_ID),
  FOREIGN KEY (Emloyee_id) REFERENCES NURSE(Emloyee_id)
);

CREATE TABLE PATIENT
(
  First_Name CHAR(50) NOT NULL,
  Last_Name CHAR(50) NOT NULL,
  Contact CHAR(50) NOT NULL,
  Patient_id CHAR(50) NOT NULL,
  Gender CHAR(50) NOT NULL,
  Notes CHAR(50) NOT NULL,
  Age INT NOT NULL,
  Room_ID CHAR(50) NOT NULL,
  PRIMARY KEY (Patient_id),
  FOREIGN KEY (Room_ID) REFERENCES ROOM(Room_ID)
);

CREATE TABLE Treats
(
  Date DATE NOT NULL,
  Disease CHAR(50) NOT NULL,
  Treatment_Type CHAR(50) NOT NULL,
  Med_Prescription CHAR(50) NOT NULL,
  Patient_id CHAR(50) NOT NULL,
  Emloyee_id CHAR(50) NOT NULL,
  PRIMARY KEY (Patient_id, Emloyee_id),
  FOREIGN KEY (Patient_id) REFERENCES PATIENT(Patient_id),
  FOREIGN KEY (Emloyee_id) REFERENCES DOCTOR(Emloyee_id)
);

CREATE TABLE Take
(
  Patient_id CHAR(50) NOT NULL,
  Med_ID CHAR(50) NOT NULL,
  PRIMARY KEY (Patient_id, Med_ID),
  FOREIGN KEY (Patient_id) REFERENCES PATIENT(Patient_id),
  FOREIGN KEY (Med_ID) REFERENCES MEDICINE(Med_ID)
);

CREATE TABLE Participate
(
  Patient_id CHAR(50) NOT NULL,
  PRIMARY KEY (Patient_id),
  FOREIGN KEY (Patient_id) REFERENCES PATIENT(Patient_id)
);

CREATE TABLE LAB
(
  Exams CHAR(50) NOT NULL,
  Results CHAR(50) NOT NULL,
  Date DATE NOT NULL,
  Patient_id CHAR(50) NOT NULL,
  FOREIGN KEY (Patient_id) REFERENCES Participate(Patient_id)
);

#There are patients that don't take medicine such as people that show up for post-operation recovery (physiotherapy), we want the med section to be null in these cases.
ALTER TABLE Treats   
MODIFY COLUMN Med_Prescription CHAR(50) NULL;