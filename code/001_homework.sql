USE lab2;

# 1.Get the details of all employees who are not between the ages of 40 and 50.

SELECT *
FROM DETAILS
WHERE age BETWEEN 40 AND 50;

# 2.Get the details of all employees who work between the 10 and 15 hours per week.

SELECT *
FROM DETAILS
WHERE hours BETWEEN 10 AND 15;

# 3.Find all employees who have an ‘e’ in their first name.

SELECT *
FROM DETAILS
WHERE firstName LIKE '%e%';

# 4.Find all employees whose second letter of their first name is ‘u’

SELECT *
FROM DETAILS
WHERE firstName LIKE '_u%';

# 5.Find all employees whose first name:
# 	ends with n and is only 4 letters in length

SELECT firstName
FROM DETAILS
WHERE firstName LIKE '___n'
  AND length(firstName) = 4;

# 	starts with a ‘J’ but is only 4 letters in length

SELECT firstName
FROM DETAILS
WHERE firstName LIKE 'J___'
  AND length(firstName) = 4;

# 	is only 3 letters in length

SELECT firstName
FROM DETAILS
WHERE length(firstName) = 3;

# 	Is greater than 4 letters in length

SELECT firstName
FROM DETAILS
WHERE length(firstName) > 4;

# 6.Find all female employees who have a ‘3’ in their age.

SELECT *
FROM DETAILS
WHERE gender = 'F'
  AND age LIKE '%3%';

# 7.Count the number of females.

SELECT count(*)
FROM DETAILS
WHERE gender = 'F';

# 8.Count the number of males.

SELECT count(*)
FROM DETAILS
WHERE gender = 'M';

# 9.Calculate the average age of the females.

SELECT avg(age) AS F_avgAge
FROM DETAILS
WHERE gender = 'F';

# 10.Calculate the average age of the males.

SELECT avg(age) AS M_avgAge
FROM DETAILS
WHERE gender = 'M';

# 11.Who is the oldest employee?

SELECT firstName,
       lastName,
       age
FROM DETAILS
WHERE age = (
    SELECT max(age)
    FROM DETAILS
    );

# 12.Who is the youngest employee?

SELECT firstName,
       lastName,
       age
FROM DETAILS
WHERE age = (
    SELECT min(age)
    FROM DETAILS
    );

# 13.What is the average hours worked?

SELECT avg(hours)
FROM DETAILS;

# 14.What is the sum of the female wage?

SELECT sum()
FROM DETAILS
WHERE gender = 'F';

# 15.What is the sum of the male wage?

SELECT sum()
FROM DETAILS
WHERE gender = 'M';

# 16.What is the average age in each department?

SELECT avg(age),
       department
FROM DETAILS
GROUP BY department;

# 17.What is the average age of each position?

SELECT avg(age),
       position
FROM DETAILS
GROUP BY position;



