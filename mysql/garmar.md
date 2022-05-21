# Databases

## create && inquire (创建 & 查询)
```mysql
create database DB_name;                         --> create   

create database if not exists DB_name;           --> create(judge if not exists)
create database DB_name character set utf8;      --> create(set character format)


show databases;                                  --> show more   
show create database DB_name;                    --> show instruction when creating
```

## Revise (修改)
```mysql
alter DB_name character set gbk;        --> alter character format
```

## delete (删除)
```mysql
drop database DB_name;              --> delete database 
drop database if exists DB_name;    -->  delete (judge if exists)
```

## `use DB_name;`  --> **Use before creating a data table**

# TABLE

## create table
> 一个表格由多列组成   

```mysql
create  table Name_table(
field  type (not null) (unique),
field  type (not null) (unique),
field  type (not null) (unique)
);

> null is the default 
> not null  --> must insert (can't be null) 
> unique    --> cannot be repeated  

eg:

create table students(
stu_num    char(8)     not null unique,   
stu_name   varchar(20) not null,
stu_gender char(2)     not null,
stu_age    int         not null,
ste_tel    cahr(11)    not null unique,
);
 
```


## inquire table 
`show tables;`       --> inquire tables  
`desc Name_table`     --> inquire the structure of table


## delete table
`drop Name_table`   --> delete table  
`drop table if exists Name_table`  --> delete judge if exist 

## alter table
```mysql

alter table Old_name to New_name;                  --> alter table name  
alter table Name_table character set utf8;         --> alter  character format
alter table Name_table add field type;             --> add row
alter table Old_field New_field type;               --> alter the name and type of tabel
alter table Name_table modify Name_field New_type  --> only alter type of row
alter table Name_table drop Name_field;            --> delete table field
```

# DATA

## type of data

### 数值类型
|   type    |   memoroy space size  |   range   |   explanation     |
|   :---:   |   :---:   |   :---:   |   :---:   |
|    tinyint  |    1byte  |    有符号 -128 ～ 127  无符号 0 ～ 255  | 小型整数(age)    |
|   smallint    | 2byte
|   mediumint   | 3
|**int/integer** | 4 ||整数|
|bigint| 8 | | 大型整数|
|float| 4 | | 单精度|
|double| 8 | | 双精度|
|decimal| | | |

> decimal(X.x)

### character type
> 存储字符的序列的类型

| tpye | range | explanation |
|:---:|:---:|:---|
| **char** | 0 - 255 byte | char()定义存储的字节长度 如果少于则补'\u000'直至定长|  
| **varchar** | 0 - 65535 | 可变字符 varchar() |
| tinyblob | 0 -255 | 存储二进制字符串 |
| blob | 2- 65535 |存储二进制字符串 |
| mediumblob | 0 -1677215 |存储二进制字符串 |
| longblob | 0 -4294967295 | 存储二进制字符串| 
| tinytext | 0 - 255 |文本数据字符串 |
| text | 0 - 65535 | 文本数据字符串 |
| mediumtext | 0 - 1677215 | 文本数据字符串 |
|**longtext** | 0 - 4294967295 | 文本数据字符串 |


### date type 
> 可以使用字符串存储时间  

| type | format | explanation | 
| :---: | :---: | :---: |
| **date** | 2022-05-04 | 日期 只存储年月日 |
| time | 11:12:13 | 时间 只存储分秒 |
| year | 2021 | 年份 | 
| **datetime** | 2022-05-04 14:35:25 | 时期+时间 存储年月日时分秒| 
| timestamp | 202205-04 143525 | 时期+时间 （时间戳）|



## field constraint 
> 在创建数据表中，指定对数据的列的数据限制性的要求（对表的列中的数据进行限制） 
> 保证的数据的有效性
> 保证数据的完整性  
> 保证数据的正确性 

常见的约束: 

1. 非空约束(not null) : 限制此列的值必须提供
2. 唯一约束(unique) : 此列的多条数据 不唯一性
3. 主键约束(primary key) : 非空 + 唯一 
4. 外键约束(foreign key) : 建立不用表之间的关联关系


## 非空约束 
> 此列的值必须提供

```mysql
create table Name_table(
field tpye not null
);
```


## 唯一约束
> 列中的值不能重复 
```mysql
create table Name_table(
field tpye not null,
field tpye unique
);

```

## 主键约束
> 主键 -- 记录的唯一标识 在一张表中只能有一个主键（主键可以是一列  也可以是多个列的组合）

```mysql
create table Name_table(
field tpye not null,
field tpye unique,
field tpye primary key
);

Or   


create table Name_table(
field tpye not null,
field tpye unique,
field tpye 
primary key(field_name)
);
```


### 删除主键约束
`alter table New_table drop primary key` 

### 添加主键约束
`alter table New_table modify New_field tpye primary key` 

## 主键自动增长
> 有些数据表中没有合适的作为主键时，可以额外定义一个与记录本身无关的列为主键。可将此列定义成int, 同时设置为自动增长，当我们在向数据标中新增一条记录时， 无需提供ID列的值， 它会自动生成  

> 定义主键自动增长 

```mysql
create table Name_table(
field int primary key auto_increment,
field tpye not null,
field tpye unique
);
```

> 注意:
> 自动增长从1开始 每添加一条记录自动+1 
> 删除添加的某条记录之后自动增长的数据也不会重复生成  
> 即: 自动增长只保证唯一性， 不保证连续性


## 联合主键
>  将数据表中的多列联合在一起作为表的主键

```mysql
create table New_field(
field_1 char(8),
field_2 int,
field_3 varchar
primary key(field_1,field_2)
);
```


## DML 数据操作语言
> 用于完成对数据的 插入，删除,修改操作

### 插入

```mysql

insert into Name_table values(Name_field1,Name_field2....)values(value1,value2....);
```

> value 需要与 field 顺序保持一致

#### 当需要向表中的所有字段添加时

```mysql
insert into Name_table values(value1,value2....);
```

> value 需要与 stable中的field 顺序保持一致

### 删除数据
> 从数据表中删除特定的数据

 ```mysql
delete from Name_table [where field='condition']

 ```

eg:
```mysql
delete from stus where stu_num='202111'

delete from stus where where stu_age>20


```

### 修改数据
> 对表中的数据进行修改

```mysql
update Name_table set field='NEW' where field=''(condition)

update Name_table set field='NEW',...,field='NEW' where field=''(condition);
```

eg:
```mysql
update stus set stu_name='edison' where stu_num='202111';

update stus set field_name='NEW' where stu_num='202111';
```

### DQL 数据查询语言
> 从数据表中提取满足特定条件的记录
>  单表查询
>  多表联合查询

#### 查询基础
```mysql
select 关键词指定要显示查询到的记录的那些列
select field_name1,field_name2... from Name_table

select * from Name_table;
```

#### where 子句
> 在删除，修改及查询的语句后都可以添加where子句(条件) 用于筛选满足特定的添加的数据进行删除
>  修改和查询

```mysql

delete from Name_table where condition
update Name_table set ... where condition
select ... from Name_table where condition

```
Condition

```mysql
 '='
select = from stus where stu_num = '202111'

 '!='
select * from stus where stu_num != '202111'
select * from stus where stu_num <> '202111'

 '>'
select * from stus where stu_age>18;

 '<'
select * from stus where stu_age<20;

 '>='
select * from stus where stu_age>=20;


 '<='
select * from stus where stu_age<=20;

 between and 区间查询
select * from stus where stu_age between 18 and 20 
```

### 多条件查询
> 在where子句中 可以将多个条件通过逻辑预算(and or not )
> 进行连接 通过多个条件来筛选要操作的数据

```mysql

'and' 并且 --> 筛选多个条件同时满足的记录 
select * from stus where stu_gender='女' and stu_age<21;

'or' 或者 --> 筛选多个条件中至少满足一个条件的记录
select * from stus where stu_gender='女' or stu_age<21;

'not' 取反
select * from stus where stu_age not between 18 and 20;

```

### like子句
> 在where子句中，我们可以使用LIKE关键字来实现模糊查询

```mysql

select * from Name_table where Name_field like 'reg';

```

> like 关键字的reg表达式
  1. % 表示任意多个字符[%o%包含字母o] 
  2. _ 表示任意一个字符[_o% 第二字母为o]

eg:

```mysql
查询学生姓名包含字母o的学生信息
select * from stus where stu_name like '%o%'

查询学生姓名第一个字为 ‘张’的学生信息

select * from stus where stu_name like '张%'

查询学生最后一个字母为o的学生信息
select * from stus where stu_name like '%o'

查询学生姓名中第二为o的学生信息
select * from stus where stu_name like '_o%'
```

### 对查询结果的处理
> 声明显示查询结果的指定列

**设置查询的列**   
`select from stus where stu_age>20;` 

**计算列** 
```
select stu_name,2021-stu_age from stus;
```

**字段别名**  
> 可以为查询结果的列名 去一个语义性更强的别名  
> as 可省略

```mysql
select stu_name,2021-stu_age as stu_birth_year from stus;

select stu_name as 姓名,2021-stu_age as 出生年份 from stus;
```

**消除重复行**   
> 从查询结果中将重复的记录消除

```mysql
原：select stu_age from stus;

后：select distinct stu_age from stus;
```

**order by 排序**  
> 将查询到的满足条件的记录按照指定的列的升序/降序排列 

```mysql
### 单字段排序列
select * from New_table where condition order by  Name_field  asc|desc

select * from stus where stu_age>15 order by stu_gender;

### 多字段排序
select * from stus where stu_age>15 order by stu_gender asc,stu_age desc;

> 先按照姓名进行升序排列 
> 再按照年龄进行降序排列

```
**asc 升序** 
**desc 降序** 

## 聚合函数
> 提供了一些可以对查询记录的列进行计算的函数--聚合函数

- count  
- max 
- min
- sum
 
 **count()**  统计函数，统计满足条件的指定字段值的个数(记录数)
```mysql
select count(stu_num) from stus;

```


**max()** 计算最大值，查询满足条件的记录中指定的最大值

```mysql
select max(stu_age) from stus;

select max(stu_age) from stus where stu_gender='女';

```

**min()**  计算最小值，查询满足条件的记录中指定的最小值

```mysql
select min(stu_age) from stus;

select min(stu_age) from stus where stu_gender='女';

```

**sum()**  计算和，查询满足条件的记录中，指定列的值的和
```mysql
select sum(stu_age) from stus;

select sum(stu_age) from stus where stu_gender='男';
```

**avg()**  求平均值，查询满足条件的记录中 计算指定列的平均值  
```mysql
select avg(stu_age) from stus;

select avg(stu_age) from stus where stu_gender='男';
```

**日期函数** 
> 当我们想日期类型的函数添加数据时，
> 可以通过字符串类型赋值(字符串的格式必须为yyyy-mmm--dd hh:mm:ss) 
> 如果我们想要获取当前系统时间添加到日期类型的列 可以使用now() 或者 sysdate() 

eg: 
```mysql
**通过字符串给日期类型的赋值** 
insert into stus(stu_num,stu_enterence)
values('202111','2022-05-12 11:20:00')

**通过now()获取当前时间** 
insert into stus(stu_num,stu_enterence)
values('202111',now()) 

**通过sysdate()获取当前时间** 
insert into stus(stu_num,stu_enterence)
values('202111',sysdate());

**通过now和sysdate获取当前系统时间** 
select now();

select sysdate();

```

## 字符串函数
> 就是通过SQL指令对字符串进行处理

```mysql
#### concat
select concat(Name_field1,Name_field2,.....)

select concat(stu_name,'-',stu_gender) from stus;

#### upper(filed) 将字段的值转换成大写
select upper(stu_name) from stus;

#### lower(filed) 将指定列的值转换成小写
select lower(stu_name) from stus;

#### substring(filed,start,len) 从指定列中截取部分显示 start从1开始
select stu_name,substring(stu_tel,8,4) from stus;

```

### 分组查询
> 分组--就是将表中的记录按照指定的类进行分组

```mysql
select * from stus group by stu_gender;

select Name_field from stus group by stu_gender;  

```

`select 分字段/聚合函数 from 表名 [where 条件] group by 分组列名 [having 条件] [order by 排序字段]` 

- group是绝对没有having的
- select 后使用 * 显示对查询的结果进行分组之后，显示每组的第一条记录(这种显示通常是无意义的)
- select 后通常显示分组字段和聚合函数(对分组后的数据进行统计 求和 平均值等)
- 语句执行属性:
    - 先根据where 条件从数据库查询结果
    - 对查询结果进行分组
    - 执行having对分组后的数据进行筛选

eg:  
> 先对学生按照年龄进行分组，后统计各组的学生数量，还可以对最终的结果进行排序

`select stu_age,count(stu_num) from stus group by stu_age order by stu_age` 


### 分页查询
> 当数据中的记录比较多的时候，如果一次性全部查询出来显示给用户，用户的可读性/体验性就不太好，因此我们可以将这些数据分页进行展示。  

**语法** 

```mysql
select ...
from ...
where ...
limit param1,param2
```
- param1 int, 表示获取查询语句的结果中的第一条数据的索引(索引从0开始)
- param2 int, 表示获取的查询的记录条数
    - 如果剩下的数据条数<param2 则返回剩下的所有记录

```mysql
### 查询第一页 
select * from stus [where ...] limit 0,3;  (1-1)*3

### 查询第二页
select * from stus [where ...] limit 3,3;   (2-1)*3

### 如果在一张数据表中，
### pageNum表示查询的页码，pageSize表示每页显示的条数
select * from <tableName> [where ...] limit (pageNum-1)*pageSize
```

### 数据表的关联关系

#### 关联关系介绍
> mysql 是一个关系库，不仅可以存储数据，还可以维护数据与数据之间的关系  





















