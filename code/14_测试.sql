USE myemployees;

#1.查询各job_id的员工工资的最大值，最小值，平均值，总和，并按job_id升序

SELECT max(salary),
       min(salary),
       avg(salary),
       sum(salary),
       job_id
FROM employees
GROUP BY job_id
ORDER BY job_id ASC ;

#2.查询员工最高工资和最低工资的差距（DIFFERENCE）

SELECT (max(salary) - min(salary)) AS DIFFERENCE
FROM employees;

#3.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，没有管理者的员工不计算在内

SELECT min(salary),
       manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING min(salary) >= 6000;

#4.查询所有部门的编号，员工数量和工资平均值,并按平均工资降序

SELECT department_id,
       count(*),
       avg(salary)
FROM employees
GROUP BY department_id
ORDER BY avg(salary) DESC ;

#5.选择具有各个job_id的员工人数

SELECT count(*),
       job_id
FROM employees
GROUP BY job_id;
