CREATE DATABASE books;

USE books;

#二、表的管理
#1.表的创建 ★

/*
语法：
create table 表名(
	列名 列的类型【(长度) 约束】,
	列名 列的类型【(长度) 约束】,
	列名 列的类型【(长度) 约束】,
	...
	列名 列的类型【(长度) 约束】
)
*/
#案例：创建表Book

CREATE TABLE IF NOT EXISTS book
(
    id          INT,
    bName       VARCHAR(20),
    price       DOUBLE,
    authorid    VARCHAR(20),
    publishDate DATETIME
);

DESC book;

#案例：创建表author
CREATE TABLE IF NOT EXISTS author
(
    id      INT,
    au_name VARCHAR(20),
    nation  VARCHAR(10)
);

DESC author;

#2.表的修改

/*
语法
alter table 表名 add|drop|modify|change column 列名 【列类型 约束】;
*/

#①修改列名

ALTER TABLE book
    CHANGE COLUMN publishDate pubDate DATETIME;

DESC book;

#②修改列的类型或约束

ALTER TABLE book
    MODIFY COLUMN price INT;

DESC book;

#③添加新列

ALTER TABLE book
    ADD COLUMN annual DOUBLE;

DESC book;

#④删除列

ALTER TABLE book
    DROP annual;

DESC book;

#⑤修改表名

ALTER TABLE author RENAME TO book_author;

DESC book_author;


# 3.表的删除

SHOW TABLES;

DROP TABLE IF EXISTS book_author;

SHOW TABLES;

#通用的写法：

/*
DROP DATABASE IF EXISTS 旧库名;
CREATE DATABASE 新库名;


DROP TABLE IF EXISTS 旧表名;
CREATE TABLE  表名();
*/

#4.表的复制

INSERT INTO author
VALUES (1, '村上春树', '日本'),
       (2, '莫言', '中国'),
       (3, '冯唐', '中国'),
       (4, '金庸', '中国');

SELECT *
FROM Author;
SELECT *
FROM copy2;
#1.仅仅复制表的结构

CREATE TABLE copy LIKE author;

#2.复制表的结构+数据
CREATE TABLE copy2
SELECT *
FROM author;

#只复制部分数据
CREATE TABLE copy3
SELECT id, au_name
FROM author
WHERE nation = '中国';


#仅仅复制某些字段

CREATE TABLE copy4
SELECT id, au_name
FROM author
WHERE 0;











