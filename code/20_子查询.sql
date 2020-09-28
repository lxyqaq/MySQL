USE myemployees;

#进阶7：子查询
/*
含义：
出现在其他语句中的select语句，称为子查询或内查询
外部的查询语句，称为主查询或外查询
分类：
按子查询出现的位置：
	select后面：
		仅仅支持标量子查询

	from后面：
		支持表子查询
	where或having后面：★
		标量子查询（单行） √
		列子查询  （多行） √

		行子查询

	exists后面（相关子查询）
		表子查询
按结果集的行列数不同：
	标量子查询（结果集只有一行一列）
	列子查询（结果集只有一列多行）
	行子查询（结果集有一行多列）
	表子查询（结果集一般为多行多列）
*/


#一、where或having后面
/*
1、标量子查询（单行子查询）
2、列子查询（多行子查询）
3、行子查询（多列多行）
特点：
①子查询放在小括号内
②子查询一般放在条件的右侧
③标量子查询，一般搭配着单行操作符使用
> < >= <= = <>
列子查询，一般搭配着多行操作符使用
in、any/some、all
④子查询的执行优先于主查询执行，主查询的条件用到了子查询的结果
*/
#1.标量子查询★

#案例1：谁的工资比 Abel 高?

SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Abel'
);

#案例2：返回job_id与141号员工相同，salary比143号员工多的员工 姓名，job_id 和工资

SELECT last_name,
       job_id,
       salary
FROM employees
WHERE job_id = (
    SELECT job_id
    FROM employees
    WHERE employee_id = 141
)
  AND salary > (
    SELECT salary
    FROM employees
    WHERE employee_id = 143
);

#案例3：返回公司工资最少的员工的last_name,job_id和salary

SELECT last_name,
       job_id,
       salary
FROM employees
WHERE salary = (
    SELECT min(salary)
    FROM employees
);

#案例4：查询最低工资大于50号部门最低工资的部门id和其最低工资

SELECT department_id,
       min(salary)
FROM employees
GROUP BY department_id
HAVING min(salary) > (
    SELECT min(salary)
    FROM employees
    WHERE department_id = 50
);

#2.列子查询（多行子查询）★
#案例1：返回location_id是1400或1700的部门中的所有员工姓名

SELECT last_name
FROM employees
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM departments
    WHERE location_id IN (1400, 1700)
);

#案例2：返回其它工种中比job_id为‘IT_PROG’工种任一工资低的员工的员工号、姓名、job_id 以及salary

SELECT employee_id,
       last_name,
       job_id,
       salary
FROM employees
WHERE salary < ANY (
    SELECT DISTINCT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
)
  AND job_id <> 'IT_PROG';

#案例3：返回其它部门中比job_id为‘IT_PROG’部门所有工资都低的员工的员工号、姓名、job_id 以及salary

SELECT employee_id,
       last_name,
       job_id,
       salary
FROM employees
WHERE salary < ALL (
    SELECT DISTINCT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
)
  AND job_id <> 'IT_PROG';

#3、行子查询（结果集一行多列或多行多列）

#案例：查询员工编号最小并且工资最高的员工信息

/*SELECT *
FROM employees
WHERE employee_id = (
    SELECT min(employee_id)
    FROM employees
)
  AND salary = (
    SELECT max(salary)
    FROM employees
);*/

SELECT *
FROM employees
WHERE (employee_id, salary) = (
    SELECT min(employee_id),
           max(salary)
    FROM employees
);

#二、select后面
/*
仅仅支持标量子查询
*/

#案例：查询每个部门的员工个数

SELECT d.*,
       (
           SELECT COUNT(*)
           FROM employees e
           WHERE e.department_id = d.`department_id`
       ) 个数
FROM departments d;


#案例2：查询员工号=102的部门名

SELECT (
           SELECT department_name, e.department_id
           FROM departments d
                    INNER JOIN employees e
                               ON d.department_id = e.department_id
           WHERE e.employee_id = 102
       ) 部门名;

#三、from后面
/*
将子查询结果充当一张表，要求必须起别名
*/

#案例：查询每个部门的平均工资的工资等级
SELECT ag_dep.*, g.`grade_level`
FROM (
         SELECT AVG(salary) ag, department_id
         FROM employees
         GROUP BY department_id
     ) ag_dep
         INNER JOIN job_grades g
                    ON ag_dep.ag BETWEEN lowest_sal AND highest_sal;

#exists

SELECT department_name
FROM departments d
WHERE EXISTS(
              SELECT *
              FROM employees e
              WHERE d.`department_id` = e.`department_id`
          );


#案例2：查询没有女朋友的男神信息

#in

SELECT bo.*
FROM boys bo
WHERE bo.id NOT IN (
    SELECT boyfriend_id
    FROM beauty
);

#exists
SELECT bo.*
FROM boys bo
WHERE NOT EXISTS(
        SELECT boyfriend_id
        FROM beauty b
        WHERE bo.`id` = b.`boyfriend_id`
    );





























