USE myemployees;

#1.	显示系统时间(注：日期+时间)

SELECT now();

#2.	查询员工号，姓名，工资，以及工资提高百分之20%后的结果（new salary）

SELECT employee_id,
       last_name,
       salary,
       salary * (1 + 0.2) AS "new salary"
FROM employees;

#3.	将员工的姓名按首字母排序，并写出姓名的长度（length）

SELECT length(last_name) AS "字符长度",
       substr(last_name,1,1) AS "首字母",
       last_name
FROM employees
ORDER BY 首字母 ASC ;

#4.	做一个查询，产生下面的结果
/*
<last_name> earns <salary> monthly but wants <salary*3>
Dream Salary
King earns 24000 monthly but wants 72000
*/

SELECT concat(last_name,' earn ',salary,' monthly but wants ',salary * 3) AS "Dream Salary"
FROM employees;


#5.	使用case-when，按照下面的条件：
/*
job                  grade
AD_PRES              A
ST_MAN               B
IT_PROG              C
SA_REP               D
ST_CLERK             E
产生下面的结果
Last_name	Job_id	 Grade
king	    AD_PRES  A
*/

SELECT last_name,
       job_id,
CASE job_id
WHEN 'AD_PRES' THEN 'A'
WHEN 'ST_MAN' THEN 'B'
WHEN 'IT_PROG' THEN 'C'
WHEN 'SA_REP' THEN 'D'
WHEN 'ST_CLERK' THEN 'E'
END AS "Grade"
FROM employees;