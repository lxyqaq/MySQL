USE myemployees;

# 数学函数

# 1.round 四舍五入

SELECT
        round(1.4);

SELECT
        round(1.5);

# 保留小数点后两位
SELECT
        round(1.579,2);

# 2.ceil 向上取整 返回 >= 该参数的最小整数值

SELECT
        ceil(1.02);

# 返回 -1
SELECT
        ceil(-1.02);

# 3.floor 向下取整 返回 <= 该参数的最小整数值

SELECT
        floor(1.02);

# 返回 -2
SELECT
        floor(-1.02);

# 4.truncate 截断 保留小数点后n位，其他截断

SELECT
        truncate(1.699999,1);

SELECT
        truncate(1.478372,3);

# 5.mod取余
# /*
# mod(a,b) ：  a-a/b*b
# mod(-10,-3):-10- (-10)/(-3)*（-3）=-1
# 看被除数的正负就行了
# */

SELECT
        mod(10,3);

SELECT
        mod(-10,-3);







