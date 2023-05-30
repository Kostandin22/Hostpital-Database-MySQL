#Retrieve the treatment history of each patient, including the date, disease, treatment type, and prescription:
SELECT p.Patient_id, t.Date, t.Disease, t.Treatment_Type, t.Med_Prescription
FROM PATIENT p
JOIN Treats t ON p.Patient_id = t.Patient_id;

#Retrieve the exams and results for each patient that participated in lab activities:
SELECT p.Patient_id, l.Exams, l.Results
FROM Participate p
JOIN LAB l ON p.Patient_id = l.Patient_id;

#Retrieve the medications prescribed for each patient:
SELECT p.Patient_id, m.Med_ID, m.Med_Type
FROM PATIENT p
JOIN Take t ON p.Patient_id = t.Patient_id
JOIN MEDICINE m ON t.Med_ID = m.Med_ID;

#Retrieve the list of nurses and doctors with their patient count:
SELECT e.First_Name, e.Last_Name, 
       COUNT(CASE WHEN p.Patient_id IS NOT NULL THEN 1 ELSE NULL END) AS Patient_Count
FROM EMPLOYEE e
LEFT JOIN DOCTOR d ON e.Emloyee_id = d.Emloyee_id
LEFT JOIN NURSE n ON e.Emloyee_id = n.Emloyee_id
LEFT JOIN ROOM r ON n.Emloyee_id = r.Emloyee_id OR d.Emloyee_id = r.Emloyee_id
LEFT JOIN PATIENT p ON r.Room_ID = p.Room_ID
GROUP BY e.Emloyee_id;

#Retrieve the list of nurses and doctors with their specialization and the room they are in charge of:
SELECT e.First_Name, e.Last_Name, 
       CASE WHEN d.Emloyee_id IS NOT NULL THEN ds.Specialization ELSE NULL END AS Specialization, 
       CASE WHEN n.Emloyee_id IS NOT NULL THEN r.Room_ID ELSE NULL END AS Room_ID
FROM EMPLOYEE e
LEFT JOIN DOCTOR d ON e.Emloyee_id = d.Emloyee_id
LEFT JOIN DOCTOR_Specialization ds ON d.Emloyee_id = ds.Emloyee_id
LEFT JOIN NURSE n ON e.Emloyee_id = n.Emloyee_id
LEFT JOIN ROOM r ON n.Emloyee_id = r.Emloyee_id OR d.Emloyee_id = r.Emloyee_id;









