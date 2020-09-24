USE myemployees;

# 三.日期函数

# 1.now 返回当前系统日期和时间

SELECT
        now();

# 2.curdate 返回当前系统日期

SELECT
        curdate();

# 3.curtime 返回当前系统时间

SELECT
        curtime();

# 4.可以获取指定的部分，年、月、日、小时、分钟、秒

SELECT
        year(now()) AS "年";

SELECT
        year(hiredate) AS "年"
FROM
        employees
ORDER BY
        year(hiredate) ASC ;

# 5.str_to_date 将字符通过指定的格式转换成日期

SELECT
        str_to_date('1998-1-28' , '%Y-%c-%d');

SELECT str_to_date('1998-01-28' , '%Y-%m-%d');

# 查询入职日期为1992-4-3的员工信息

SELECT
        *
FROM
        employees
WHERE
        hiredate = str_to_date('1992-4-3' , '%Y-%c-%d');

#date_format 将日期转换成字符

SELECT
        DATE_FORMAT(NOW(),'%y-%m-%d') AS out_put;

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)

SELECT
        last_name,
        date_format(hiredate,'%m月%d日 %Y') AS "日期"
FROM
        employees
WHERE
        commission_pct IS NOT NULL ;

# 四.其他函数

SELECT
        version();

SELECT
        database();

SELECT
        user();
