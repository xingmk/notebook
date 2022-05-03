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
field  typle,
field  typle
);

```

<++>


