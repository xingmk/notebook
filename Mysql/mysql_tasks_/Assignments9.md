-- 1.创建一个简单的存储过程（ProcGetA_Z），要求结果输出 A 到 Z 之间的 26 个大写字母。
CREATE PROCEDURE ProcGetA_Z()
begin
declare i int default 65;
declare R varchar(100);
while i<65+26 do
if R is null then
set R=CHAR(i);
else 
set R=CONCAT_WS(',', R,char(i));
end if;
set i=i+1;
end while;
select R;
end;
call ProcGetA_Z();
-- 2. 创建一个简单的存储过程，求S=1!+3!+5!+7!+…+N，直到S 大于10000时N的值和S的值（注：阶乘可以写一个函数完成）
CREATE PROCEDURE get_jc_jisum()
begin
declare s bigint default 0;
declare i int default 1;
while s<10000 DO
if i mod 2=1 THEN
SET s = s+get_jc(i);
end if;
set i = i + 1;
end while;
select s,i-1 as N;
end;
call get_jc_jisum();

-- 3.创建一个带输入参数的存储过程，输入分数参数，执行存储过程得到平均分大于-- 该分数的学生统计成绩信息（包括学号，姓名，平均分，课程门数字段）

CREATE PROCEDURE pjf_cz(in n DOUBLE)
begin
SELECT s.StudNo,StudName,avg(StudScore),COUNT(*)
FROM studinfo s,studscoreinfo sc
WHERE s.StudNo=sc.StudNo
GROUP BY s.StudNo
HAVING avg(StudScore)>n;
end;
call pjf_cz(75);
-- 4.创建带两个输入参数和一个输出参数的存储过程，执行存储过程时，输入参数为
-- 分数段，输出参数为得到该分数段的人数
CREATE PROCEDURE fsd_rs(in min DOUBLE,in max DOUBLE,out n int)
BEGIN
SELECT COUNT(*)
FROM(
SELECT s.StudNo
FROM studinfo s,studscoreinfo sc
WHERE s.StudNo=sc.StudNo
GROUP BY s.StudNo
HAVING avg(StudScore) BETWEEN min and max) a;
set n=count(*);
end;
call fsd_rs(0,60,@n);
-- 5. 课程类别为 A、B、C，D11、D12 为基础课和专业课，请统计各学生 各类别 所通
-- 过的课程门数、获得的学分（成绩大于等于 60 即通过课程获得学分）
CREATE PROCEDURE gkc_xs_tg()
BEGIN
SELECT s.StudNo,c.CourseType 课程类别,s.StudName,COUNT(*) 通过课程门数,SUM(CourseCredit) 学分
FROM courseinfo c,studinfo s,studscoreinfo sc
WHERE sc.StudNo=s.StudNo AND c.CourseID=sc.CourseID
AND s.StudNo in(
SELECT StudNo
FROM studinfo) 
and c.CourseType in ('A','B','C','D11','D12')  
and sc.StudScore>60
GROUP BY s.StudNo
ORDER BY s.StudName,c.CourseType;
end;
call gkc_xs_tg();
-- 6. 在学生信息表（StudInfo）上建立删除触发器（名称为：TrigStudInfo_DELETE-- 实现删除学生信息时，则学生成绩表（StudScoreInfo）中的对应信息自动删除，并写出测试语句以查看结果。
INSERT INTO studinfo(StudNo,StudName,StudGender,StudBirthDay,ClassID)
VALUES
('20211152073','朱成','男','2003-01-10','20191152');
INSERT INTO studscoreinfo(StudNo,CourseID,StudScore)
VALUES
('20211152073','C++CXSX011',88.0),
('20211152073','DXYW002',77);
-- 删除触发器-- drop TRIGGER TrigStudInfo_DELETE

CREATE TRIGGER TrigStudInfo_DELETE
AFTER DELETE ON studinfo
FOR EACH ROW
BEGIN
DELETE FROM studscoreinfo
WHERE studscoreinfo.StudNo=old.studno;
end;

DELETE FROM studinfo
WHERE StudNo='20211152073';

SELECT * FROM studscoreinfo
WHERE StudNo='20211152073';

-- 7. 在学生信息表（StudInfo）上建立更新触发器（名称为：TrigStudInfo_UPDATE-- 实现更新学生学号时，则学生成绩表（StudScoreInfo）中对应的学号自动更新，并写出测试语句以查看结果。
INSERT INTO studinfo(StudNo,StudName,StudGender,StudBirthDay,ClassID)
VALUES
('20211152073','邢明锟','男','2003-01-10','20191172');

INSERT INTO studscoreinfo(StudNo,CourseID,StudScore)
VALUES
('20211152073','C++CXSX011',88.0),
('20211152073','DXYW002',77);

CREATE TRIGGER TrigStudInfo_UPDATE
BEFORE UPDATE ON studinfo
FOR EACH ROW
BEGIN
UPDATE studsco
