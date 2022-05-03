# create  &&  inquire (创建 查询)
```mysql

create database DB_name;  --> create   

create database if not exists DB_name;  --> create(judge if not exists)
create database DB_name character set utf8;      --> create(set character format)


show databases;           --> show more   
show create database DB_name  --> show instruction when creating
```

# Revise (修改)
```mysql
alter DB_name character set gbk;  --> alter character format

```

# delete (删除)
```
drop database DB_name;  --> delete database
drop database if exists DB_name;  -->  delete (judge if exists)
```

# `use DB_name`  --> Use before creating a data table 

# create table
> 一个表格由多列组成   
```mysql
create  table Name_table(
field  type (not null) (unique),
field  type
);

> null is the default 
> not null  --> must insert (can't be null) 
> unique  --> cannot be repeated  

eg:

create table students(
stu_num char(8) not null unique,   
stu_name varchar(20) not null,
stu_gender char(2) not null,
stu_age int not null,
ste_tel cahr(11) not null unique,
);
 
```

# inquire table 

`show tables;`   --> inquire tables
`desc Name_table`   --> inquire the structure of table

# delete table

`drop Name_table`   --> delete table
`drop table if exists Name_table`  --> delete judge if exist 

# alter table
```mysql

alter table Old_name to New_name;   --> alter table name  
alter table Name_table character set utf8;  --> alter  character format
alter table Name_table add field type;  --> add row
lter table Old_field New_field type;  --> alter the name and type of tabel
alter table Name_table modify Name_field New_type  -->only alter type of row
alter table Name_table drop Name_field;   --> delete table field
```
# type of data

## 数值类型
|   type    |   memoroy space size  |   range   |   explanation     |
|   :---:   |   :---:   |   :---:   |   :---:   |
|    tinyint  |    1byte  |    有符号 -128 ～ 127  无符号 0 ～ 255  | 小型整数(age)    |
|   smallint    | 2byte (16bit)
|   mediumint   | 3
|**int/integer** | 4 ||整数|
|bigint| 8 | | 大型整数|
|float| 4 | | 单精度|
|double| 8 | | 双精度|
|decimal| | | |

> decimal(X.x)
