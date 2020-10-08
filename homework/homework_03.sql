USE thedocs;
# 1.Count the number of patients. Use an alias to display the result as Number of Patients.
SELECT count(*) AS "number of patients"
FROM patients;

# 2.Select the patients from  Athlone town
SELECT *
FROM patients
WHERE town = 'Athlone';

# 3.What is the name of the drug(s) which costs 2.95?
SELECT drug_name
FROM drugs
WHERE cost = 2.95;

# 4.List the name of drugs which cost more than 3.50
SELECT drug_name
FROM drugs
WHERE cost > 3.50;

# 5.What is the name and date of birth of the youngest patient?
SELECT firstName,
       lastName,
       dateOfBirth
FROM patients
WHERE dateOfBirth = (
    SELECT max(dateOfBirth)
    FROM patients
);

# 6.What is the name and date of birth of the oldest patient?
SELECT firstName,
       lastName,
       dateOfBirth
FROM patients
WHERE dateOfBirth = (
    SELECT min(dateOfBirth)
    FROM patients
);

# 7.How many GPs work in the surgery?
SELECT count(*)
FROM doctors
WHERE speciality = 'GP';

# 8.List the doctors first and last names in descending order of lastName (Lookup the concat function)
SELECT firstName,
       lastName
FROM doctors
ORDER BY lastName DESC ;

# 9.Find all Doctors who’s firstName has ‘a’ as the last letter.
SELECT *
FROM doctors
WHERE firstName LIKE '%a';

# 10.Count the number of male / female doctors per speciality
SELECT speciality,
       sum(gender = 'M') AS male,
       sum(gender = 'F') AS female
FROM doctors
GROUP BY speciality;

# 11.List all the prescriptions written after  July 31st, 2012
SELECT *
FROM prescriptions
WHERE date_perscribed > '2012-07-31';

# 12.List the firstName, lastName of all the patients who had a prescription written for them.
SELECT firstName,
       lastName
FROM patients
INNER JOIN prescriptions p ON patients.pat_id = p.pat_id;

# 13.How many prescriptions did the Audiologist write?
SELECT speciality,
       count(*) AS prescriptions
FROM doctors
INNER JOIN prescriptions p ON doctors.doc_id = p.doc_id
WHERE speciality = 'Audiologist'
GROUP BY speciality;

# 14.List all the drugs that have been prescribed by the Doctors
SELECT drug_name
FROM drugs
INNER JOIN prescriptions p ON drugs.drug_id = p.drug_id
GROUP BY drug_name;

# 15.List all the drugs that have not been prescribed by Doctors
SELECT drug_name
FROM drugs
LEFT JOIN prescriptions p ON drugs.drug_id = p.drug_id
WHERE p.drug_id IS NULL
GROUP BY drug_name;

# 16.List the doctors that prescribed drugs for Colm Cummins
SELECT *
FROM doctors
INNER JOIN patients p ON doctors.contactNo = p.contactNo
WHERE p.firstName = 'Colm';

# 17.Show all information on the patients and any matching prescription information.
SELECT pa.*,
       pr.*
FROM patients AS pa
CROSS JOIN prescriptions pr ON pa.pat_id = pr.pat_id;
