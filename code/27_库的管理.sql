#DDL
/*
数据定义语言
库和表的管理
一、库的管理
创建、修改、删除
二、表的管理
创建、修改、删除
创建： create
修改： alter
删除： drop
*/

#一、库的管理
#1、库的创建
/*
语法：
create database  [if not exists]库名;
*/


#案例：创建库Books

CREATE DATABASE IF NOT EXISTS books;

# 修改字符集

ALTER DATABASE books CHARACTER SET gbk;

# 删除库

DROP DATABASE books;

