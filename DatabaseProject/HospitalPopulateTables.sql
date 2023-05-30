INSERT INTO EMPLOYEE (First_Name, Last_Name, Emloyee_id, Contact, Hire_date)
VALUES 
  ('John', 'Doe', '1001', '555-1234', '2021-01-01'),
  ('Jane', 'Doe', '1002', '555-5678', '2021-01-02'),
  ('Mary', 'Smith', '1003', '555-2468', '2021-01-03'),
  ('Bob', 'Johnson', '1004', '555-7890', '2021-01-04');

-- Populate NURSE table
INSERT INTO NURSE (Emloyee_id)
VALUES 
  ('1001'),
  ('1002');

-- Populate DOCTOR table
INSERT INTO DOCTOR (Emloyee_id)
VALUES 
  ('1003'),
  ('1004');

-- Populate MEDICINE table
INSERT INTO MEDICINE (Med_Type, Med_ID, Med_Desc)
VALUES 
  ('Antibiotic', 'M1001', 'Used to treat bacterial infections'),
  ('Analgesic', 'M1002', 'Used to relieve pain'),
  ('Antihistamine', 'M1003', 'Used to treat allergies'),
  ('Antidepressant', 'M1004', 'Used to treat depression');

-- Populate DOCTOR_SPECIALIZATION table
INSERT INTO DOCTOR_SPECIALIZATION (Specialization, Emloyee_id)
VALUES 
  (1, '1003'), -- Cardiologist
  (2, '1004'); -- Oncologist

 -- Populate ROOM table
INSERT INTO ROOM (Room_ID, Type, Max_occupancy, Occupied, Emloyee_id)
VALUES 
  ('101', 'Private', 2, 'Y', '1001'),
  ('102', 'Private', 2, 'N', NULL),
  ('103', 'Ward', 4, 'Y', '1002');

-- Populate PATIENT table
INSERT INTO PATIENT (First_Name, Last_Name, Contact, Patient_id, Gender, Notes, Age, Room_ID)
VALUES 
  ('David', 'Smith', '555-1111', '2001', 'Male', 'History of heart disease', 40, '101'),
  ('Sara', 'Johnson', '555-2222', '2002', 'Female', 'Severe allergies', 28, '102'),
  ('Tom', 'Williams', '555-3333', '2003', 'Male', 'Recovering from surgery', 65, '103');

-- Populate TREATS table
INSERT INTO TREATS (Date, Disease, Treatment_Type, Med_Prescription, Patient_id, Emloyee_id)
VALUES 
  ('2022-01-01', 'Heart disease', 'Medication', 'M1001', '2001', '1003'),
  ('2022-01-02', 'Allergies', 'Medication', 'M1003', '2002', '1004'),
  ('2022-01-03', 'Recovering from surgery', 'Physical therapy', NULL, '2003', '1003');

-- Populate TAKE table
INSERT INTO TAKE (Patient_id, Med_ID)
VALUES 
  ('2001', 'M1001'),
  ('2002', 'M1003');

-- Populate PARTICIPATE table
INSERT INTO PARTICIPATE (Patient_id)
VALUES 
  ('2001'),
  ('2002'),
  ('2003');

INSERT INTO LAB (Exams, Results, Date, Patient_id)
VALUES
('Blood test', 'Normal', '2022-01-04', '2001'),
('X-ray', 'Abnormal', '2022-01-05', '2002'),
('MRI', 'Normal', '2022-01-06', '2003');