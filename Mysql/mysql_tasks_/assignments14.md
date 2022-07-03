# 1. 用 SQL 语句创建以上各表
CREATE TABLE StudInfo(
studNo VARCHAR(15) PRIMARY KEY COMMENT '学生学号',
studName VARCHAR(20) not NULL COMMENT '学生姓名',
studsex char(2) not NULL DEFAULT('男') CHECK(studsex in ('男','女')) COMMENT '学生性别',
StudBirthDay date null COMMENT '出生年月',
ClassName VARCHAR(10) not NULL COMMENT'班级编号'
);

CREATE TABLE Typeinfo(
TypeID VARCHAR(10) PRIMARY KEY COMMENT'打字类型号 ',
TypeName varchar(50) not NULL comment '打字类型名称',
TypeDesc varchar(100) NULL comment '打字描述'
);

```mysql
CREATE TABLE StudScore(
StudNo VARCHAR(15) COMMENT'学生学号',
TypeID VARCHAR(10) COMMENT'打字类型号',
studscore DECIMAL(4,1) DEFAULT(0) CHECK(studscore>=0 and studscore<=100) COMMENT'学生成绩',

CONSTRAINT PK_S_T PRIMARY KEY ( StudNo, TypeID ),
CONSTRAINT FK_S_S FOREIGN key(studno) REFERENCES studinfo(studno),
CONSTRAINT FK_S_T FOREIGN key(TypeID) REFERENCES Typeinfo(TypeID)
);
```

#2. 画出以上各表间的 ER 图。





#3. 创建学生课程成绩视图(ViewStudCourseScore)，包括（学生学号、学生姓名、学生性别、班级名称、打字编号、打字名称、学生成绩）字段。
CREATE VIEW ViewStudCourseScore as(
SELECT si.studno 学生学号,studName 学生姓名,studsex 学生性别,ClassName 班级名称,t.TypeID 打字编号,TypeName 打字名称,studscore 学生成绩
FROM StudInfo si,StudScore ss,Typeinfo t
WHERE si.studno=ss.studno and t.TypeID=ss.TypeID
);

# 4. 分别写出以上各表插入一条记录的 SQL 语句。(记录为举例中的数据
INSERT INTO StudInfo
(StudNo,StudName,StudSex,StudBirthDay,ClassName)
VALUES
('20190704072','王老五','男','2003-2-3','Computer');

INSERT INTO StudScore
(StudNo,TypeID,StudScore)
VALUES
('20190704072','C0103',99.5);

INSERT INTO TypeInfo
(TypeID,TypeName,TypeDesc)
VALUES
('C0103','英文','英文输入');

# 5. 写出更新学生成绩表(StudScore)中学号为 20190704070，打字编号为 C0101 的成绩为 75 的 SQL 语句。
UPDATE studscore
SET StudScore=75
WHERE studNo='20190704070' and TypeID='C0101';

#6. 写出删除打字类型信息表(TypeInfo)中打字编号为 C0101 记录的 SQL 语句。

DELETE FROM TypeInfo
WHERE TypeID='C0101';

#7. 写出将打字编号为 C0101 成绩从高到低排序的 SQL 语句。
SELECT * FROM
StudScore
WHERE TypeID='C0101'
ORDER BY StudScore desc;

#8. 写出统计各学生打字总分的 SQL 语句。
SELECT studNo,sum(StudScore) 总分
FROM StudScore
GROUP BY studNo;

#9. 写出统计学生打字平均分大于 85 的 SQL 语句。
SELECT studNo,AVG(StudScore) 平均分
FROM StudScore
GROUP BY studNo
HAVING AVG(StudScore)>85;

#10 写出将学生成绩按平均分排名前 30 名记录插入新表(StudInfoBack)中的 SQL语句（包括学号、姓名、班级名称、平均分字段）
CREATE TABLE StudInfoBack
SELECT i.studNo,i.studName,i.ClassName,AVG(StudScore)
FROM StudScore,StudInfo i
WHERE studscore.StudNo=i.studNo
GROUP BY i.studNo
ORDER BY AVG(StudScore) DESC
LIMIT 30;

#11.写出统计各打字类型的平均分、打字类型数、最高分、最低分的 SQL 语句。

SELECT t.TypeID 打字类型,avg(ss.StudScore) 平均分,TypeName ,max(ss.StudScore),MIN(ss.StudScore)
FROM StudScore ss,Typeinfo t
WHERE t.TypeID=ss.TypeID
GROUP BY t.TypeID;


#12.写出查询学生打字平均分大于85的学生基本信息。（用关联表和子查询来做）

SELECT s.StudNo,StudName,StudSex,StudBirthDay,ClassName
FROM studinfo s,StudScore ss
WHERE s.studNo=ss.StudNo
GROUP BY StudNo
HAVING avg(StudScore)>85;


SELECT *
FROM studinfo
WHERE studNo in
(
SELECT studNo
FROM StudScore
GROUP BY studNo
HAVING AVG(StudScore)>85);

#13. 写出按性别统计人数、打字平均分。
select studsex,count(*),avg(studscore)
from studscore,studinfo
where studscore.studno=studinfo.studno and studscore group by studsex;

#14.用存储过程和游标，显示学生学号、学生姓名、学生平均分名次

DELIMITER //
#存在即删除P_GetQuence
DROP PROCEDURE IF EXISTS P_GetQuence;
Create Procedure P_GetQuence()

begin
#存在即删除Temp_Quence

```mysql
set @strsql= 'Drop Table if Exists Temp_Quence;';
PREPARE drop_sql from @strsql;
execute drop_sql;
```


#创建Temp_Quence，将QuenceOne设为auto_increment primary key浮标
set @strsql="Create Table Temp_Quence(
StudNo Varchar(15),
StudName Varchar(20),
AvgScore Numeric(4,1),
QuenceOne int auto_increment primary key,
QuenceTwo int null);";

Prepare create_sql from @strsql;
execute create_sql;
#将StudInfoBack表中的数据导入新创建的Temp_Quence表中
Insert Into Temp_Quence(StudNo,StudName,AvgScore)
Select StudNo,StudName,AVgStudScore
From StudInfoBack
Order By AvgstudScore Desc;

Update Temp_Quence,
(Select AvgScore,Min(QuenceOne) MinQuence
From Temp_Quence Group By AvgScore) A
Set QuenceTwo=A.MinQuence
Where Temp_Quence.AvgScore=A.AvgScore;
end;
//
delimiter;
call P_GetQuence();
