USE myemployees;

#进阶4：常见函数

/*
概念：类似于java的方法，将一组逻辑语句封装在方法体中，对外暴露方法名
好处：1、隐藏了实现细节  2、提高代码的重用性
调用：select 函数名(实参列表) 【from 表】;
特点：
	①叫什么（函数名）
	②干什么（函数功能）
分类：
	1、单行函数
	如 concat、length、ifnull等
	2、分组函数

	功能：做统计使用，又称为统计函数、聚合函数、组函数

常见函数：
	一、单行函数
	字符函数：
	length:获取字节个数(utf-8一个汉字代表3个字节,gbk为2个字节)
	concat
	substr
	instr
	trim
	upper
	lower
	lpad
	rpad
	replace

	数学函数：
	round
	ceil
	floor
	truncate
	mod

	日期函数：
	now
	curdate
	curtime
	year
	month
	monthname
	day
	hour
	minute
	second
	str_to_date
	date_format
	其他函数：
	version
	database
	user
	控制函数
	if
	case

*/


#一、字符函数

#1.length 获取参数值的字节个数

SELECT
        length('john');

SELECT
        length('张三丰haha');

#2.concat 拼接字符串

SELECT
        concat(first_name,'_',last_name) AS 姓名
FROM
        employees;

#3.upper、lower

SELECT
        upper('john');

SELECT
        lower('JoHn');

#示例：将姓变大写，名变小写，然后拼接

SELECT
        concat(upper(first_name),'_',last_name) AS 姓_名
FROM
        employees;



