USE girls;

#进阶6：连接查询
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接查询
笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行
发生原因：没有有效的连接条件
如何避免：添加有效的连接条件
分类：
	按年代分类：
	sql92标准:仅仅支持内连接
	sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接

	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接

		交叉连接
*/

#一、sql92标准
#1、等值连接
/*
① 多表等值连接的结果为多表的交集部分
② n表连接，至少需要n-1个连接条件
③ 多表的顺序没有要求
④ 一般需要为表起别名
⑤ 可以搭配前面介绍的所有子句使用，比如排序、分组、筛选
*/

#案例1：查询女神名和对应的男神名

SELECT name,
       boyName
FROM beauty,
     boys
WHERE beauty.boyfriend_id = boys.id;

#案例2：查询员工名和对应的部门名

SELECT last_name,
       department_name
FROM employees,
     departments
WHERE employees.department_id = departments.department_id;

#2、为表起别名
/*
①提高语句的简洁度
②区分多个重名的字段
注意：如果为表起了别名，则查询的字段就不能使用原来的表名去限定
*/
#查询员工名、工种号、工种名

SELECT e.last_name, e.job_id, j.job_title
FROM employees AS e,
     jobs AS j
WHERE e.job_id = j.job_id;

#3、两个表的顺序是否可以调换

#查询员工名、工种号、工种名

SELECT e.last_name, e.job_id, j.job_title
FROM jobs AS j,
     employees AS e
WHERE e.`job_id` = j.`job_id`;

#4、可以加筛选

#案例：查询有奖金的员工名、部门名

SELECT last_name, department_name, commission_pct
FROM employees AS e,
     departments AS d
WHERE commission_pct IS NOT NULL
  AND e.department_id = d.department_id;

#案例2：查询城市名中第二个字符为o的部门名和城市名

SELECT department_name, city
FROM departments AS d,
     locations AS l
WHERE d.location_id = l.location_id
  AND city LIKE '_o%';

#5、可以加分组


#案例1：查询每个城市的部门个数

SELECT count(*),
       city
FROM departments AS d,
     locations AS l
WHERE d.location_id = l.location_id
GROUP BY city;

#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资

SELECT department_name,
       d.manager_id,
       min(salary)
FROM departments AS d,
     employees AS e
WHERE commission_pct IS NOT NULL
  AND d.department_id = e.department_id
GROUP BY department_name, d.manager_id;

#6、可以加排序

#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序

SELECT count(*),
       job_title,
       j.job_id
FROM jobs AS j,
     employees AS e
WHERE j.job_id = e.job_id
GROUP BY job_title, j.job_id
ORDER BY count(*) DESC;

#7、可以实现三表连接？

#案例：查询员工名、部门名和所在的城市

SELECT last_name,
       department_name,
       city
FROM employees AS e,
     departments AS d,
     locations AS l
WHERE d.department_id = e.department_id
  AND d.location_id = l.location_id;


# 2.非等值连接
CREATE TABLE job_grades
(
    grade_level VARCHAR(3),
    lowest_sal  INT,
    highest_sal INT
);
INSERT INTO job_grades
VALUES ('A', 1000, 2999);
INSERT INTO job_grades
VALUES ('B', 3000, 5999);
INSERT INTO job_grades
VALUES ('C', 6000, 9999);
INSERT INTO job_grades
VALUES ('D', 10000, 14999);
INSERT INTO job_grades
VALUES ('E', 15000, 24999);
INSERT INTO job_grades
VALUES ('F', 25000, 40000);

#案例1：查询员工的工资和工资级别

SELECT last_name,
       salary,
       grade_level
FROM employees AS e,
     job_grades AS j
WHERE salary BETWEEN lowest_sal AND highest_sal
ORDER BY salary ASC;

#3、自连接

#案例：查询 员工名和上级的名称

SELECT e.employee_id AS "员工id",
       e.last_name   AS "员工姓名",
       m.employee_id AS "管理者id",
       m.last_name   AS "管理者姓名"
FROM employees AS e,
     employees AS m
WHERE e.manager_id = m.employee_id;
















































