USE myemployees;

#六、分组函数
/*
功能：用作统计使用，又称为聚合函数或统计函数或组函数
分类：
sum 求和、avg 平均值、max 最大值 、min 最小值 、count 计算个数
特点：
1、sum、avg一般用于处理数值型
   max、min、count可以处理任何类型
2、以上分组函数都忽略null值
3、可以和distinct搭配实现去重的运算
4、count函数的单独介绍
一般使用count(*)用作统计行数
5、和分组函数一同查询的字段要求是group by后的字段
*/


# 1、简单 的使用

SELECT sum(salary)
FROM employees;

SELECT avg(salary)
FROM employees;

SELECT max(salary)
FROM employees;

SELECT min(salary)
FROM employees;

SELECT count(salary)
FROM employees;

# 或者一起查询

SELECT sum(salary),
       round(avg(salary), 2),
       max(salary),
       min(salary),
       count(salary)
FROM employees;

#2、参数支持哪些类型

SELECT SUM(last_name), AVG(last_name)
FROM employees;
SELECT SUM(hiredate), AVG(hiredate)
FROM employees;

SELECT MAX(last_name), MIN(last_name)
FROM employees;

SELECT MAX(hiredate), MIN(hiredate)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;
SELECT COUNT(last_name)
FROM employees;

#3、是否忽略null

SELECT SUM(commission_pct), AVG(commission_pct), SUM(commission_pct) / 35, SUM(commission_pct) / 107
FROM employees;

SELECT MAX(commission_pct), MIN(commission_pct)
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;
SELECT commission_pct
FROM employees;

#4、和distinct搭配

SELECT SUM(DISTINCT salary), SUM(salary)
FROM employees;

SELECT COUNT(DISTINCT salary), COUNT(salary)
FROM employees;

# 5.count函数

SELECT count(salary)
FROM employees;

SELECT count(*)
FROM employees;

# 效率：基本使用count(*)效率高




