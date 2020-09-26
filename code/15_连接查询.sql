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

SELECT e.last_name , e.job_id , j.job_title
FROM employees AS e ,jobs AS j
WHERE e.job_id = j.job_id;






















