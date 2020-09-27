USE myemployees;

# 1.显示员工表的最大工资，工资平均值

SELECT max(salary),
       avg(salary)
FROM employees;

# 2.查询员工表的employee_id , job_id , last_name , 按department_id降序 , salary升序

SELECT employee_id,
       job_id,
       last_name
FROM employees
ORDER BY department_id DESC ,salary ASC ;

# 3.查询员工表的job_id中包含 a 和 e 的，并a在e的前面

SELECT job_id
FROM employees
WHERE job_id LIKE '%a%e%';




