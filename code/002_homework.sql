USE lab2;

# 1.Count the number of males/females per department.
# 2.Outline an SQL query to produce the following result:
# Note: you should lookup count and case
SELECT department,
       sum(gender = 'M') AS "male_count",
       sum(gender = 'F') AS "fmale_count"
FROM DETAILS
GROUP BY department;

# 3.List the top 3 wage earners. (look up LIMIT)

SELECT *
FROM DETAILS
ORDER BY (rate * hours) DESC
LIMIT 3;

# 4.Add a column named PPS (varchar(20)) to the details table

ALTER TABLE DETAILS
    ADD COLUMN PPS VARCHAR(20);

# 5.Set Jim Mitchell’s PPS number to A123456

UPDATE DETAILS
SET DETAILS.PPS = 'A123456'
WHERE firstName = 'Jim'
  AND lastName = 'Mitchell';

# 6.Select all the employees with no PPS

SELECT *
FROM DETAILS
WHERE PPS IS NULL;

# 7.Select all employees with a  PPS

SELECT *
FROM DETAILS
WHERE PPS IS NOT NULL;

# 8.Add a department table to the details table
#   The department table will have 3 attributes
# 	    DeptName – Varchar(20), the Primary Key
#   	Manager – Varchar(20)

CREATE TABLE IF NOT EXISTS department
(
    DeptName VARCHAR(20) PRIMARY KEY,
    Manager  VARCHAR(20)
);

# 9.Add rows for all the departments mentioned in the details table to the department table.
# You can assign the manager names!

INSERT INTO department(DeptName)
VALUES ('Engineering'),
       ('Science'),
       ('Business'),
       ('Humanities'),
       ('Design'),
       ('Hospitality'),
       ('Nursing');


# 10.Set the department column in the details as a Foreign Key

ALTER TABLE DETAILS
    ADD FOREIGN KEY (department) REFERENCES department (DeptName);


# 11.try to insert an employee into the Art department with the following details
# Jack Moore, age 22, Lecturer in Art department
# Rate = 55.49,  hours = 35 and PPS = AB232323
# 			What happens and why?

INSERT INTO DETAILS(firstName, lastName, age, position, department, rate, hours, PPS)
VALUES ('Jack', 'Moore', 22, 'Lecturer', 'art department', 55.49, 35, 'AB232323');
# can not add


# 12.	Add a  row for the art department to the department table

INSERT INTO department(DeptName)
VALUES ('art department');

# 13.	Now add Jack Moore to the details table.

INSERT INTO DETAILS(firstName, lastName, age, gender, position, department, rate, hours, PPS)
VALUES ('Jack', 'Moore', 22, 'F', 'Lecturer', 'art department', 55.49, 35, 'AB232323');


# 14.Add a Column ‘middleName’ to the details table.  Position 	this column after the firstName column.

ALTER TABLE DETAILS
    ADD COLUMN middleName VARCHAR(20) AFTER firstName;

# 15.Update Joe Mullins middleName to Patrick.

UPDATE DETAILS
SET DETAILS.middleName = 'Patrick'
WHERE firstName = 'Joe'
  AND lastName = 'Mullins';

