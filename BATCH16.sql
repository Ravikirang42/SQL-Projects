SHOW DATABASES;
CREATE DATABASE MYCLASS1;
USE MYCLASS1;
USE EXL;

CREATE TABLE STUDENTS(SID INT, SNAME CHAR(30),AGE INT,COURSE CHAR(30));
SELECT *FROM STUDENTS;  
  
INSERT INTO STUDENTS VALUES(1,"ABHI",21,"MYSQL");
select sid,sname from students;

#INDIVIDUAL RECORD
INSERT INTO STUDENTS VALUES(2,"AKASH",22,"BI");

#MULTI RECORDS
INSERT INTO STUDENTS VALUES(3,"SWETHA",23,"PBI"),(4,"RAMYA",23,"TAB"),(5,"TOM",21,"EXL");

#RECORDS FOR SPECIFIC COLUMNS
INSERT INTO STUDENTS(SID,SNAME) VALUES(6,"RAM");

#NULL-UNKNOWN,NOT 0,NOT A BLANK,BLANK IS A SPACE ACTS A CHAR

CREATE TABLE PATIENTS(PID INT,PNAME VARCHAR(80),DOB DATE,DOA DATETIME);
SELECT *FROM PATIENTS;

INSERT INTO PATIENTS VALUES(1,"ABHI","2000-02-22","2024-10-17 08:35:33"),
						    (2,"AKASH","2001-02-22","2023-10-17 09:35:33"),
                            (3,"TOM","2002-02-22","2022-10-17 10:34:33"),
                            (4,"RAMYA","2003-03-22","2021-10-17 06:35:33");
                            
 INSERT INTO PATIENTS(PID,PNAME) VALUES(5,"RAM"); 
 INSERT INTO PATIENTS VALUES(6,"DANY","2002-04-17",NOW());
 
 #ALTER-----STRUCTURE OF THE TABLE
 
 SELECT *FROM STUDENTS;
 ALTER TABLE STUDENTS ADD COLUMN MARKS INT;
 ALTER TABLE STUDENTS DROP COLUMN AGE;
 ALTER TABLE STUDENTS CHANGE COLUMN SID ST_ID INT;
  #DESC---IT WILL SHOW THE DATA TYPES,NULL,KEYS
DESC STUDENTS;
ALTER TABLE STUDENTS MODIFY COLUMN SNAME VARCHAR(40);

#RENBAME----CLASS
RENAME TABLE STUDENTS TO CLASS;
SELECT *FROM STUDENTS;
SELECT *FROM CLASS;
 
 #UPDATE#delete----------update<table name>set<columnname>where<columnname>
   SET SQL_SAFE_UPDATES=0;
update class set marks=77 where st_id=1;
update class set marks=66 where st_id=2;
update class set marks=55 where st_id=3 or st_id=4;
update class set marks=44 where marks is null;
update class set course="ds" where st_id=6;
update class set sname="ab",course="excel" where st_id=4;


 #DELETE,TRUNCATE,DROP
 #delete----specific record can delete byh using where clause
 #truncate------only table structure remains means column names
 #drop---------permanently table is dropped
 
 select *from patients;
 
 #delete
 delete from patients where pid=3;
 delete from patients where pid=5;
 
delete from patients;
truncate table patients;
drop table patients; 
 
 
  #OPERATORS
-- LIMIT,OFFSET
-- DISTINCT,
 -- WHERE ,BETWEEN
-- AND,
-- OR,
-- IN, 
-- NOT IN,
-- BETWEEN, 
-- Wild Cards,
-- ORDER BY 
-- Group By, 
-- Having Clause.
-- CASE
-- AGGREGATE FUNCTIONS

#DISPLY RECORD FOR EMPOLYEE ID 104
select *from myemp;
select emp_id,first_name,salary from myemp;
select count(distinct(dep_id)) from myemp order by dep_id asc;
select count(distinct(job_id)) from myemp;
select count(distinct(mgr_id)) from myemp;

select *from myemp where emp_id=104;
# FETCH THE RECORDS FOR DEP_ID 50
select *from myemp where dep_id=50;
#>,<,>=,<=,BETWEEN
#FETCH THE RECORDS WHERE DEPARTMENT IS NOT EQUAL TO 60
select *from myemp where dep_id<>60;
select *from myemp where dep_id!=60;
-- FETCH THE RECORDS WHERE SALARY IS LESS THAN 20000
select *from myemp where salary<20000;
-- FETCH THE RECORDS WHERE SALARY IS GREATER THAN 20000
select *from myemp where salary>20000;
-- FETCH THE RECORDS WHERE SALARY BETWEEN 2000 and 5000
select *from myemp where salary between 2000 and 5000;
-- IN ,NOT IN-30,50,60------50,70,80
select *from myemp where dep_id in(30,50,60);
select *from myemp where dep_id not in(50,70,80);

# DISPLAY EMPLOYEES WHO HAS HIRED ABOVE 2000
select *from myemp where year(hire_date)>2000;

# DISPLAY EMPLOYEES WHO HAS HIRED BETWEEN 2000 and 2010
select *from myemp where year(hire_date) between 2000 and 2010;

# LIKE A%,%A,%A%,__

select *from myemp where first_name like "A%";
select *from myemp where first_name like "%A";
select *from myemp where first_name like "%A%";
select *from myemp where first_name like "A%A";
select *from myemp where first_name like "ALE%";
select *from myemp where first_name like "RA%";
select *from myemp where first_name like "%EA%";

select *from myemp where first_name like "A____";
select *from myemp where first_name like "____A";
select *from myemp where first_name like "____A____";

SELECT *FROM MYEMP WHERE EMP_ID LIKE "2%";



-- AGGREGATE FUNCTIONS
SELECT EMP_ID,SUM(SALARY) FROM MYEMP;
SELECT MAX(SALARY) FROM MYEMP;
SELECT MIN(SALARY) FROM MYEMP;
SELECT AVG(SALARY) FROM MYEMP;
SELECT COUNT(*) FROM MYEMP;

SELECT MIN(SALARY) AS MIN_SAL,
	   MAX(SALARY) AS MAX_SAL,
	   AVG(SALARY) AS AVG_SAL,
       SUM(SALARY) AS TOTAL_SAL          
	   FROM 
       MYEMP;

  SELECT EMP_ID AS ID FROM MYEMP;
  
  #CASE
  SELECT *FROM MYEMP;
  
  
  SELECT EMP_ID,FIRST_NAME,SALARY,
  CASE WHEN SALARY>20000 THEN "SENIOR"
       WHEN SALARY<3000 THEN "TRAINEE"
       ELSE "JUNIOR"
       END AS CATEGORY
       FROM MYEMP;
       
  SELECT EMP_ID,FIRST_NAME,SALARY,
  CASE WHEN SALARY>=15000 AND SALARY<=20000 THEN "SENIOR"
       WHEN SALARY>=8000 AND SALARY<15000 THEN "JUNIOR"
       ELSE "TRAINEE"
       END AS STATUS
       FROM MYEMP;
       
       SELECT *FROM MYEMP;
       
     SELECT EMP_ID,FIRST_NAME,SALARY,
     CASE WHEN EMP_ID=105 THEN ROUND(SALARY*0.3+SALARY,2)
        WHEN FIRST_NAME="BRUCE" THEN ROUND(SALARY*0.2+SALARY,2)
        WHEN JOB_ID="IT_PROG" THEN ROUND(SALARY*0.1+SALARY,2)
        ELSE SALARY
        END AS UPDATED_SAL
        FROM MYEMP
        WHERE EMP_ID=105 or FIRST_NAME="BRUCE" OR JOB_ID="IT_PROG";
        
  #COALESCE      
CREATE TABLE NAMES(ID INT,FN VARCHAR(2),LN VARCHAR(2));     
SELECT *FROM NAMES;
     
INSERT INTO NAMES VALUES(1,NULL,"A"),(2,"B",NULL);
SELECT ID,coalesce(FN,LN) AS NAMES FROM NAMES;

#CONTRAINTS
CREATE TABLE STUDENTS(ID INT UNIQUE,SNAME VARCHAR(30) NOT NULL,AGE INT CHECK(AGE>25),
COURSE VARCHAR(30) DEFAULT "MYSQL");

INSERT INTO STUDENTS(ID,SNAME,AGE) VALUES(1,"AB",26);
SELECT *FROM STUDENTS;
INSERT INTO STUDENTS(ID,SNAME,AGE) VALUES(2,"CD",27);

INSERT INTO STUDENTS(ID,SNAME,AGE) VALUES(1,"AB",26);
INSERT INTO STUDENTS(ID,SNAME,AGE) VALUES(3,NULL,26);
INSERT INTO STUDENTS(ID,SNAME,AGE) VALUES(4,"AB",22);
INSERT INTO STUDENTS(ID,SNAME,AGE,COURSE) VALUES(3,"AB",26,"BI");
   
 
  #group by,having
  
  select *from myemp;

select *from sales;

#DEP WISE TOTAL SALARY

SELECT DEP_ID,SUM(SALARY) AS TOTAL_SAL FROM MYEMP
GROUP BY DEP_ID
ORDER BY DEP_ID ;

#DEP WISE AVG SAL

SELECT DEP_ID,AVG(SALARY) AS AVG_SAL FROM MYEMP
GROUP BY DEP_ID
ORDER BY DEP_ID;

#DEP WISE AVG SAL AND SHOW THE EMP COUNT
SELECT DEP_ID,ROUND(AVG(SALARY),2) AS AVG_SAL,COUNT(*) AS EMP_CNT FROM MYEMP
GROUP BY DEP_ID
ORDER BY DEP_ID ASC;

#HAVING--IT WILL WORK AFTER GROUP BY,WITHOUT GROUP BY HAVING WILL NOT WORK
SELECT DEP_ID,AVG(SALARY) AS AVG_SAL,COUNT(*) AS EMP_CNT FROM MYEMP
GROUP BY DEP_ID
HAVING DEP_ID IN(30,50,70)
ORDER BY DEP_ID ASC;

SELECT DEP_ID,AVG(SALARY) AS AVG_SAL,COUNT(*) AS EMP_CNT FROM MYEMP
GROUP BY DEP_ID
HAVING COUNT(*)>5
ORDER BY DEP_ID ASC;

SELECT DEP_ID,AVG(SALARY) AS AVG_SAL,COUNT(*) AS EMP_CNT FROM MYEMP
GROUP BY DEP_ID
HAVING AVG(SALARY)>10000
ORDER BY DEP_ID ASC;

SELECT DEP_ID,ROUND(AVG(SALARY),2) AS AVG_SAL,COUNT(*) AS EMP_CNT FROM MYEMP
GROUP BY DEP_ID
HAVING AVG(SALARY)>10000
ORDER BY DEP_ID ASC;

#GROUP BY ,HAVING,WHERE
SELECT DEP_ID,ROUND(AVG(SALARY),2) AS AVG_SAL,COUNT(*) AS EMP_CNT 
FROM MYEMP
WHERE DEP_ID IN (30,40,50,60)
GROUP BY DEP_ID
HAVING AVG(SALARY)>1000
ORDER BY DEP_ID ASC
LIMIT 2
OFFSET 1;

#MULTI GROUPBY COLUMNS

SELECT DEP_ID,MGR_ID,SUM(SALARY) AS TOTAL_SAL,COUNT(*)
FROM MYEMP
GROUP BY DEP_ID,MGR_ID
ORDER BY DEP_ID,MGR_ID;

SELECT *FROM MYEMP WHERE MGR_ID=114;


#JOINS
SELECT *FROM AUTHORS;
SELECT *FROM BOOKS;

SELECT *FROM MOVIES;
SELECT *FROM MEMBERS;

#INNER JOIN
SELECT *FROM MOVIES INNER JOIN MEMBERS ON MOVIES.ID=MEMBERS.MOVIEID;
SELECT ID,TITLE,FIRST_NAME FROM MOVIES JOIN MEMBERS ON MOVIES.ID=MEMBERS.MOVIEID;

#LEFT JOIN
SELECT *FROM MOVIES LEFT JOIN MEMBERS ON MOVIES.ID=MEMBERS.MOVIEID;
SELECT ID,TITLE,IFNULL(FIRST_NAME,'-') AS FIRST_NAME,IFNULL(LAST_NAME,'-') AS LAST_NAME
FROM MOVIES LEFT JOIN MEMBERS ON MOVIES.ID=MEMBERS.MOVIEID;

SELECT ID,TITLE,IFNULL(FIRST_NAME,'-') AS FIRST_NAME,IFNULL(LAST_NAME,'-') AS LAST_NAME
FROM MOVIES LEFT JOIN MEMBERS ON MOVIES.ID=MEMBERS.MOVIEID
WHERE ID IN(1,2,5,8,10) AND FIRST_NAME IN("ALICIA","LIZZIE");

#RIGHT JOIN
SELECT ID,TITLE,IFNULL(FIRST_NAME,'-') AS FIRST_NAME,IFNULL(LAST_NAME,'-') AS LAST_NAME
FROM MOVIES RIGHT JOIN MEMBERS ON MOVIES.ID=MEMBERS.MOVIEID;

SELECT ID,TITLE,IFNULL(FIRST_NAME,'-') AS FIRST_NAME,IFNULL(LAST_NAME,'-') AS LAST_NAME
FROM MEMBERS LEFT JOIN MOVIES ON MEMBERS.MOVIEID=MOVIES.ID;

#CROSS JOIN
SELECT *FROM MEALS;
SELECT *FROM DRINKS;

SELECT *FROM MEALS CROSS JOIN DRINKS;
SELECT MEALNAME,DRINKNAME,A.RATE+B.RATE AS TOTAL_PRICE FROM MEALS AS A CROSS JOIN DRINKS AS B;



#SELF JOIN
SELECT *FROM MYEMP;


SELECT EMP.EMP_ID,EMP.FIRST_NAME,EMP.LAST_NAME,MGR.FIRST_NAME,MGR.LAST_NAME 
FROM MYEMP AS EMP JOIN MYEMP AS MGR
ON EMP.MGR_ID=MGR.EMP_ID
WHERE MGR.FIRST_NAME="ALEXANDER";

SELECT DEP_ID,SUM(SALARY) FROM MYEMP GROUP BY DEP_ID;

#WINDOW FUNCTIONS
#FIND THE TOTAL SALARY OF EACH DEPT and DISPLAY EMP ID,FIRST NAME,LAST NAME ALSO

SELECT EMP_ID,FIRST_NAME,LAST_NAME,DEP_ID,
SUM(SALARY) OVER(PARTITION BY DEP_ID) AS TOTAL_SAL
FROM MYEMP;

#FIND AVG SALARY OF EACH DEP ALONG WITH OTHER COLUMNS

SELECT EMP_ID,FIRST_NAME,DEP_ID,
AVG(SALARY) OVER(PARTITION BY DEP_ID) AS AVG_SAL FROM MYEMP;


CREATE TABLE RANK_ST(ID INT,MARKS INT);
INSERT INTO RANK_ST VALUES(1,97),
                           (2,98),
                           (3,97),
                           (4,96),
                           (5,95);
                           
 SELECT *FROM RANK_ST;
 
 SELECT ID,MARKS,RANK() OVER(ORDER BY MARKS DESC) AS RNK FROM RANK_ST;
 SELECT ID,MARKS,DENSE_RANK() OVER(ORDER BY MARKS DESC) AS DNS_RNK FROM RANK_ST;
 
  SELECT ID,MARKS,RANK() OVER(ORDER BY MARKS DESC) AS RNK,
  DENSE_RANK() OVER(ORDER BY MARKS DESC) AS DNS_RNK FROM RANK_ST;
  
  SELECT *FROM SALES;
  SELECT *,DENSE_RANK() OVER(PARTITION BY FISCAL_YEAR ORDER BY SALE DESC) AS RNK FROM SALES;
  
  SELECT *,DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK FROM MYEMP;
  SELECT *,DENSE_RANK() OVER(PARTITION BY DEP_ID ORDER BY SALARY DESC) AS RNK FROM MYEMP;
  
  
  #FIND THE 2ND HIGHEST SLARY
  #FIND THE 5TH HIGHEST SALARY
  #FIND THE 3,5,7,9 HIGHEST SALARY
  #FIND THE DEP WISE 3RD HIGHEST SALRY
  
   #FIND THE 2ND HIGHEST SALARY
  WITH S AS(SELECT EMP_ID,FIRST_NAME,SALARY,DEP_ID,
  DENSE_RANK() OVER(PARTITION BY DEP_ID ORDER BY SALARY DESC) AS RNK
  FROM MYEMP) SELECT *FROM S WHERE RNK=2;
  
WITH S AS(SELECT EMP_ID,FIRST_NAME,SALARY,DEP_ID,
  DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
  FROM MYEMP) SELECT *FROM S WHERE RNK=2;
  
  #FIND THE 5TH HIGHEST SALARY
  WITH S AS(SELECT EMP_ID,FIRST_NAME,SALARY,DEP_ID,
  DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
  FROM MYEMP) SELECT *FROM S WHERE RNK=5;
  
  WITH S AS(SELECT EMP_ID,FIRST_NAME,SALARY,DEP_ID,
  DENSE_RANK() OVER(PARTITION BY DEP_ID ORDER BY SALARY DESC) AS RNK
  FROM MYEMP) SELECT *FROM S WHERE RNK=5;
  
  SELECT DEP_ID,COUNT(*) AS EMP_CNT FROM MYEMP GROUP BY DEP_ID ORDER BY DEP_ID ASC;
  
  #FIND THE 3RD,5TH,7TH AND 8TH HIGHEST SALARIES
  WITH S AS(SELECT EMP_ID,FIRST_NAME,SALARY,DEP_ID,
  DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
  FROM MYEMP) SELECT *FROM S WHERE RNK IN(3,5,7,9);
  
  WITH S AS(SELECT EMP_ID,FIRST_NAME,SALARY,DEP_ID,
  DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RNK
  FROM MYEMP) SELECT *FROM S WHERE RNK=3;
  
#FIND 3RD HIGHEST SALARY WITHOUT WINDOW FUNCTION
  SELECT DISTINCT SALARY
  FROM MYEMP 
  ORDER BY SALARY DESC
  LIMIT 1 OFFSET 2;
  
SELECT DISTINCT SALARY
  FROM MYEMP 
  ORDER BY SALARY DESC
  LIMIT 3,1;
  
  
  #ROW NUMBER
  SELECT *,ROW_NUMBER() OVER() AS SR_NO FROM MYEMP;
  SELECT *,ROW_NUMBER() OVER(PARTITION BY DEP_ID) AS SR_NO FROM MYEMP;
  
  #WITHOUT DUPLICATE DATA FIELDS,ALL THREE RANK,DENSE RANK,ROW NUMBER ARE SAME
  
  #LEAD IS USED TO FIND NEXT YEAR,NEXT MONTH,NEXT QUARTER,NEXT DAY
  #LAG IS USED TO FIND PREVIOUS YEAR,MONTH,QUART,DAY
  #LEAD AND LAG
  SELECT *FROM TRAINS;
  SELECT *,LAG(TIME,1) OVER(PARTITION BY TRAIN_ID ORDER BY TRAIN_ID) AS PREV_STN_TIME FROM TRAINS;
  SELECT *,LEAD(TIME,1) OVER(PARTITION BY TRAIN_ID ORDER BY TRAIN_ID) AS NXT_STN_TIME FROM TRAINS;
  
  SELECT *,LAG(TIME,1) OVER(PARTITION BY TRAIN_ID ORDER BY TRAIN_ID) AS PREV_STN_TIME,
		   LEAD(TIME,1) OVER(PARTITION BY TRAIN_ID ORDER BY TRAIN_ID) AS NXT_STN_TIME FROM TRAINS;
  
    
    create table SALES_ORDERS(
prod varchar(5),
SDate date,
Sales int,
primary key(prod,SDate,Sales) 
);

insert into SALES_ORDERS values
('A','2022-03-01',250),
('B','2021-10-17',550),
('A','2022-04-01',400),
('C','2021-02-15',850),
('A','2022-05-01',650),
('B','2021-09-17',500),
('A','2022-06-01',550),
('C','2021-03-15',1050),
('C','2021-04-15',900),
('A','2022-07-01',900),
('B','2021-11-17',750),
('C','2021-05-15',1000),
('B','2021-12-17',650);

SELECT *FROM SALES_ORDERS; 
SELECT*,LAG(SALES,1) OVER(PARTITION BY PROD) AS PREV_SALES FROM SALES_ORDERS;
SELECT*,LEAD(SALES,1) OVER(PARTITION BY PROD) AS PREV_SALES FROM SALES_ORDERS;

SELECT*,LAG(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES FROM SALES_ORDERS;
SELECT*,LEAD(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES FROM SALES_ORDERS;
      
SELECT*,LAG(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES,
SALES- LAG(SALES,1,0) OVER(PARTITION BY PROD) AS DIFF FROM SALES_ORDERS;

SELECT*,LEAD(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES,
SALES- LEAD(SALES,1,0) OVER(PARTITION BY PROD) AS DIFF FROM SALES_ORDERS;

SELECT *,LAG(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES,
 ROUND((SALES-LAG(SALES,1,0) OVER(PARTITION BY PROD))/
 LAG(SALES,1,0) OVER(PARTITION BY PROD) *100,2) AS PERC_DIFF FROM SALES_ORDERS;
 
 SELECT *,LAG(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES,
 FORMAT((SALES-LAG(SALES,1,0) OVER(PARTITION BY PROD))/
 LAG(SALES,1,0) OVER(PARTITION BY PROD) *100,2) AS PERC_DIFF FROM SALES_ORDERS;
 
  SELECT *,LAG(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES,
 FLOOR((SALES-LAG(SALES,1,0) OVER(PARTITION BY PROD))/
 LAG(SALES,1,0) OVER(PARTITION BY PROD) *100) AS PERC_DIFF FROM SALES_ORDERS;
 
 SELECT *,LAG(SALES,1,0) OVER(PARTITION BY PROD) AS PREV_SALES,
 CONCAT(ROUND((SALES-LAG(SALES,1,0) OVER(PARTITION BY PROD))/
 LAG(SALES,1,0) OVER(PARTITION BY PROD) *100,2),"%") AS PERC_DIFF FROM SALES_ORDERS;
 
 
 #SUB QUERIES
  #FIND THE MAX SALARY ALONG WITH EMPLY DETAILS
  #FIND THE EMPLOYEES WHOSE SALARY IS GREATER THAN AVERAGE SALARY
  #FIND THE DEPT WISE EMPL SALARY IS GREATER THAN AVG SALARY
  #FIND THE DEPT WISE HIGHEST PAID EMPLY
  #FIND THE EMPLY WHOSE SALARY IS HIGHER THAN THEIR MANAGERS
  #FIND THE THIRD HIGHEST SALARY BY USING SUB QUERY
   #FIND THE EMPLOYS WHO ARE WORKING FOR USA COUNTRY
   
 #VIEWS
 #AUTO INCREMENT
 
 
 
 
 






























SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME FROM MYEMP;
SELECT LOWER('EXCELR') AS RESULT;
SELECT LEFT('UNITED STATES OF AMERICA',13) AS RESULT;
SELECT SUBSTRING('FACEBOOK',5) AS RESULT;
SELECT NOW();
SELECT CURDATE();
SELECT CURRENT_TIME();
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT MONTH('2024-03-15');
SELECT MONTHNAME('2024-03-15');
SELECT QUARTER(NOW());
SELECT CONCAT('Q',QUARTER(NOW()));
SELECT WEEK(NOW());
SELECT HOUR(NOW());
SELECT DATEDIFF('2023-01-20','2022-01-15');
SELECT TIMESTAMPDIFF(YEAR,'2022-01-15','2023-01-20');
SELECT TIMESTAMPDIFF(MONTH,'2022-01-15','2023-01-20');
SELECT TIMESTAMPDIFF(DAY,'2022-01-15','2023-01-20');