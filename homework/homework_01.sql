USE lab2;

# 1.Get the details of all employees who are not between the ages of 40 and 50.

SELECT
        *
FROM
        DETAILS
WHERE
        age BETWEEN 40 AND 50;

# 2.Get the details of all employees who work between the 10 and 15 hours per week

SELECT
        *
FROM
        DETAILS
WHERE
        hours BETWEEN 10 AND 15;

# 3.Find all employees who have an ‘e’ in their first name

SELECT
        *
FROM
        DETAILS
WHERE
        firstName LIKE '%e%';

# 4.Find all employees whose second letter of their first name is ‘u

SELECT
        *
FROM
        DETAILS
WHERE
    firstName LIKE '_u%';

# 5.Find all employees whose first name:
# 	ends with n and is only 4 letters in length

SELECT
        *
FROM
        DETAILS
WHERE
        length(firstName) = 4 AND firstName LIKE '%n';
# 	starts with a ‘J’ but is only 4 letters in length

SELECT
        *
FROM
        DETAILS
WHERE
        length(firstName) = 4 AND firstName LIKE 'J%';
# 	is only 3 letters in length

SELECT
        *
FROM
        DETAILS
WHERE
        length(firstName) = 3;
# 	Is greater than 4 letters in length

SELECT
        *
FROM
        DETAILS
WHERE
        length(firstName) > 4;

# 6.Find all female employees who have a ‘3’ in their age.

SELECT
        *
FROM
        DETAILS
WHERE
        gender = 'M';

# 7.Count the number of females.
# 8.Count the number of males.

SELECT
        count(CASE WHEN gender = 'M' THEN gender END ),
        count(CASE WHEN gender = 'F' THEN gender END )
FROM
        DETAILS;

# 9.Calculate the average age of the females.

SELECT
        avg(age) AS AVGAGE
FROM
        DETAILS
WHERE
        gender = 'M';

# 10.Calculate the average age of the males.

SELECT
        avg(age) AS AVGAGE
FROM
        DETAILS
WHERE
        gender = 'F';

# 11.	Who is the oldest employee?

SELECT
        lastName,
        age
FROM
        DETAILS
ORDER BY
        age DESC ;
# 12.	Who is the youngest employee?

SELECT
        lastName,
        age
FROM
        DETAILS
ORDER BY
        age ASC ;
# 13.	What is the average hours worked?

SELECT
        avg(hours) AS AVGHOURS
FROM
        DETAILS;
# 14.	What is the sum of the female wage?
SELECT
        age * hours AS wage
FROM
        DETAILS
WHERE
        gender = 'F';
# 15.	What is the sum of the male wage?
SELECT
        age * hours AS wage
FROM
        DETAILS
WHERE
        gender = 'M';
# 16.	What is the average age in each department?
SELECT
        avg(age) AS AVGAGE,
        department
FROM
        DETAILS
GROUP BY
        department;
# 17.	What is the average age of each position?
SELECT
        avg(age) AS AVGAGE,
        position
FROM
        DETAILS
GROUP BY
        position;



