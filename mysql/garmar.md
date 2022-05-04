## create  &&  inquire (创建 查询)
```mysql
**create** 
create database DB_name;  --> create   

create database if not exists DB_name;           --> create(judge if not exists)
create database DB_name character set utf8;      --> create(set character format)

show databases;                --> show more   
show create database DB_name   --> show instruction when creating
```

## Revise (修改)
```mysql
alter DB_name character set gbk;  --> alter character format
```

## delete (删除)
```
drop database DB_name;  --> delete database
drop database if exists DB_name;  -->  delete (judge if exists)
```

## `use DB_name`  --> Use before creating a data table 

## create table
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

## inquire table 

`show tables;`   --> inquire tables
`desc Name_table`   --> inquire the structure of table

## delete table

`drop Name_table`   --> delete table
`drop table if exists Name_table`  --> delete judge if exist 

## alter table
```mysql

alter table Old_name to New_name;   --> alter table name  
alter table Name_table character set utf8;  --> alter  character format
alter table Name_table add field type;  --> add row
lter table Old_field New_field type;  --> alter the name and type of tabel
alter table Name_table modify Name_field New_type  -->only alter type of row
alter table Name_table drop Name_field;   --> delete table field
```
## type of data

### 数值类型
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

create table Name_table(
field tpye not null
);

## 唯一约束
> 列中的值不能重复 

create table Name_table(
field tpye not null,
field tpye unique
);


## 主键约束
> 主键 -- 记录的唯一标识 在一张表中只能有一个主键（主键可以是一列  也可以是多个列的组合）

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


### 删除主键约束
`alter table New_table drop primary key` 

### 添加主键约束
`alter table New_table modify New_field tpye primary key` 

## 主键自动增长
> 有些数据表中没有合适的作为主键时，可以额外定义一个与记录本身无关的列为主键。可将此列定义成int, 同时设置为自动增长，当我们在向数据标中新增一条记录时， 无需提供ID列的值， 它会自动生成  

> 定义主键自动增长 

create table Name_table(
field int primary key auto_increment,
field tpye not null,
field tpye unique
);

> 注意:
> 自动增长从1开始 每添加一条记录自动+1 
> 删除添加的某条记录之后自动增长的数据也不会重复生成  
> 即: 自动增长只保证唯一性， 不保证连续性


## 联合主键
>  将数据表中的多列联合在一起作为表的主键

create table New_field(
field_1 char(8),
field_2 int,
field_3 varchar
primary key(field_1,field_2)
);


## DML 数据操作语言
> 用于完成对数据的 插入，删除,修改操作

### 插入
insert into Name_table values(Name_field1,Name_field2....)values(value1,value2....);

> value 需要与 field 顺序保持一致

#### 当需要向表中的所有字段添加时

insert into Name_table values(value1,value2....);

> value 需要与 stable中的field 顺序保持一致

### 删除数据
> 从数据表中删除特定的数据

 ```mysql
delete from Name_table [where field='condition']

 ```

eg:
```
delete from stus where stu_num='202111'

delete from stus where where stu_age>20


```

### 修改数据
> 对表中的数据进行修改

```mysql
update Name_table set file='new' [where condition]

update Name_table set file='new',file='new' [where condition]
```

```mysql
修改单项
update stus set stu_name'shun' where stu_num='2021'

修改多项
update stus stu_gender='男',stu_qq='54654654' where stu_num='202012123'
```

## DQL 数据查询
> 从表中查询符合条件的记录
> 单表查询
> 多表联合查询


```mysql
select field_name from Name_table;
select field_name,field_name... from Name_table;

select * from Name_table;

```

### where 子句
> 在删除，修改及查询的语句后都可以添加子句(条件),用于满足特定的删除，修改及查询

```mysql
delete from Name_table where conditions;
update Name_table set ... where conditions;
select ... from Name_table where conditions;
```

#### Conditions
> 条件关系运算符
| 符号 | 说明 |
|:---:|:---:|
| = | 等于 |  
| <> != | 不等于|
| > < | 大 小 |
| >= <= | 大于等于 小于等于 |
| between and | 区间查询 |

### 多条件查询
> 条件逻辑查询
```mysql
> and 
select * from stus where field_1 and field_2

> or 
select * from stus where field_1 or field_2;

> not 
select * from stus where field not between 18 and 20;
```

### 模糊查询

> 包含o的数据
`select * from Name_table where New_field like '%o%' ` 

> 最后一个为o的数据
`select * from Name_table where New_field like 'o%' `   

#### 正则表达式

% --> 表示多个字符 [%o% 包含字母 o]
_ --> 表示任意一个字符[ _o% 第二个字母为o ]


## 对查询结果进行处理

### 设置查询的列

> 声明显示结果的指定列
`select field_1,field_2... from Name_table where field_condition;` 

> 计算列
> 对从数据表中的记录的列进行一定的运算之后显示出来

`select stu_name,2021-stu_age from Name_table;`

> 字段别名 
> 我们可以为查询结果的列名去一个语义性更强的别名(as 也可以省略)


`select stu_name as 姓名,2021-stu_age as 出生年份 from Name_table;`

### 消除重复行
> 从查询结果中将重复的及记录消除 **distinct** 

`select stu_age from stus` 
`select distinct stu_age from stus` 
