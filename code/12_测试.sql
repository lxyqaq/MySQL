USE myemployees;

#1.查询公司员工工资的最大值，最小值，平均值，总和

SELECT max(salary) AS "maxSalary",
       min(salary) AS "minSalary",
       avg(salary) AS "avgSalary",
       sum(salary) AS "sumSalary"
FROM employees;

#2.查询员工表中的最大入职时间和最小入职时间的相差天数（DIFFRENCE）

SELECT datediff(now() , '1998-1-28');

SELECT datediff(max(hiredate) , min(hiredate)),
       max(hiredate),
       min(hiredate)
FROM employees;

#3.查询部门编号为90的员工个数

SELECT count(*)
FROM employees
WHERE department_id = 90;
