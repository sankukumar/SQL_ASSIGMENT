/*1. Create new database & employee table (based on give sample data),  create employee table with primary key (EmployeeID)*/                   
use amazon_db
CREATE TABLE EMP_DETAIL_TB(EMP_ID INT PRIMARY KEY, FIRST_NAME VARCHAR(20), LAST_NAME VARCHAR(20), SALARY INT, JOINING_DATE DATE,
                               DEPARTMENT VARCHAR(20),GENDER VARCHAR(20), JOB_TITLE VARCHAR(20));
-- 3. Write a query to create a clone of an existing table using Create Command.
CREATE TABLE NEW_EMP_DETAILS_TB AS SELECT * FROM EMP_DETAIL_TB;
SELECT * FROM NEW_EMP_DETAILS_TB;
/* 4. Write a query to get all employee detail from "employee" table*/
select * from EMP_DETAIL_TB1;
-- 5. Select only top 1 record from employee table
select * from emp_detail_tb limit 1;
-- 6. Select only bottom 1 record from employee table
select * from emp_detail_tb order by emp_id desc limit 1;
-- 7. How to select a random record from a table?  
select * from emp_detail_tb order by rand() limit 1 ;
/* 8. Write a query to get
 “first_name” in upper case as "first_name_upper"
 ‘first_name’ in lower case as ‘first_name_lower”
 Create a new column “full_name” by combining “first_name” & “last_name” with space as a separator.
 Add 'Hello ' to first_name and display result.*/
 select upper(first_name) as first_name_upper from emp_detail_tb;
 SELECT LOWER(FIRST_NAME) AS FIRST_NAME_LOWER FROM EMP_DETAIL_TB;
 SELECT FIRST_NAME, LAST_NAME, concat(FIRST_NAME,' ',LAST_NAME) FULL_NAME FROM EMP_DETAIL_TB;
 /*9. Select the employee details of
 Whose “first_name” is ‘Malli’
 Whose “first_name” present in ("Malli","Meena", "Anjali")
 Whose “first_name” not present in ("Malli","Meena", "Anjali")
 Whose “first_name” starts with “v”
 Whose “first_name” ends with “i”
 Whose “first_name” contains “o”
 Whose "first_name" start with any single character between 'm-v'
 Whose "first_name" not start with any single character between 'm-v'
 Whose "first_name" start with 'M' and contain 5 letters*/
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME = 'MALLI';
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME IN ('MALLI','MEENA','ANJALI');
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME NOT IN ('MALLI','MEENA','ANJALI');
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME LIKE 'V%';
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME LIKE '%I';
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME LIKE '%O%';
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME BETWEEN 'M' AND 'W';
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME NOT BETWEEN 'M' AND 'W';
SELECT * FROM EMP_DETAIL_TB WHERE FIRST_NAME LIKE 'M%' AND length(FIRST_NAME)=5;
-- 10. Write a query to get all unique values of"department" from the employee table.
SELECT DISTINCT DEPARTMENT FROM EMP_DETAIL_TB;
-- 11. Query to check the total records present in a table.
SELECT COUNT(*) FROM EMP_DETAIL_TB;
/* 14. Query to get the below values of "salary" from employee table
 Lowest salary
 Highest salary
 Average salary
 Highest salary - Lowest salary as diff_salary
 % of difference between Highest salary and lowest salary. (sample output
 format: 10.5%)*/ 
SELECT MIN(SALARY) LOWEST_SALARY, MAX(SALARY) HIGHEST_SALARY, AVG(SALARY) AVERAGE_SALARY, MAX(SALARY)-MIN(SALARY) DIFF_SALARY,
                          (MAX(SALARY)-MIN(SALARY))/MAX(SALARY)*100 PER_DIFF  FROM EMP_DETAIL_TB;
--  16. Query to check no.of records present in a table where employees having 50k salary.
SELECT COUNT(*) FROM EMP_DETAIL_TB WHERE SALARY >=50000;
-- 17. Find the most recently hired employee in each department.

                   #Case When Then End Statement Queries
-- 1.Display first_name and gender as M/F.(if male then M, if Female then F)
SELECT FIRST_NAME, 
CASE
WHEN GENDER = 'MALE' THEN 'M'
ELSE 'F'
END AS GENDER
FROM EMP_DETAIL_TB;
/* 2. Display first_name, salary, and a salary category. (If salary is below 50,000, categorize as 'Low'; between 50,000 and 60,000 as 'Medium';
                       above 60,000 as 'High') */
SELECT FIRST_NAME, SALARY,
CASE
WHEN SALARY <50000 THEN 'LOW'
WHEN SALARY >60000 THEN 'HIGH'
ELSE 'MEDIUM'
END AS SALARY_CATEGORY
FROM EMP_DETAIL_TB;
/*Display first_name, department, and a department classification. (If department is
 'IT', display 'Technical'; if 'HR', display 'Human Resources'; if 'Finance', display
 'Accounting'; otherwise, display 'Other')*/
SELECT FIRST_NAME, DEPARTMENT,
 CASE
 WHEN DEPARTMENT = 'IT' THEN 'TECHNICAL'
 WHEN DEPARTMENT = 'HR' THEN 'HUMAN RESOURCES'
 WHEN DEPARTMENT = 'FINANCE' THEN 'ACCOUNTING'
 ELSE 'OTHER'
 END AS DEP_CLASSIFICATION
 FROM EMP_DETAIL_TB;
 /* Display first_name, salary, and eligibility for a salary raise. (If salary is less than
 50,000, mark as 'Eligible for Raise'; otherwise, 'Not Eligible') */
 SELECT FIRST_NAME,SALARY,
 CASE 
 WHEN SALARY <50000 THEN 'ELIGIBLE FOR RAISE'
 ELSE 'NOT ELIGIBLE'
 END AS ELIGIBILITY
 FROM EMP_DETAIL_TB;
 
/* 5. Display first_name, joining_date, and employment status. (If joining date is before
 '2022-01-01', mark as 'Experienced'; otherwise, 'New Hire') */
 SELECT * FROM EMP_DETAIL_TB LIMIT 1;
 SELECT FIRST_NAME, JOINING_DATE,
 CASE 
 WHEN JOINING_DATE > '2022-01-01' THEN 'EXPERIENCED'
 ELSE 'NEW HIRE'
 END AS 'EMP_STATUS'
 FROM EMP_DETAIL_TB;
 /* 6.Display first_name, salary, and bonus amount. (If salary is above 60,000, add10%
 bonus; if between 50,000 and 60,000, add 7%; otherwise, 5%)*/
 SELECT FIRST_NAME, SALARY,
 CASE
 WHEN SALARY >60000 THEN SALARY*10/100
 WHEN SALARY BETWEEN 50000 AND 60000 THEN SALARY*7/100
 ELSE SALARY *3/100
 END AS BONUS_AMOUNT
 FROM emp_detail_tb;
 /*11. Display first_name, department, and job level for IT employees. (If department is 'IT'
       and salary is greater than 55,000, mark as 'Senior IT Employee'; otherwise, 'Other').*/
SELECT FIRST_NAME, DEPARTMENT,
CASE 
WHEN SALARY>55000 THEN 'SENIOR IT EMPLOYEE'
ELSE 'OTHER'
END AS JOB_LEVEL
FROM emp_detail_tb where department ='it';

                    ## GROUP BY
#1. Write the query to get the department and department wise total(sum) salary, display it in ascending and descending order according to salary.;
SELECT DEPARTMENT, sum(salary) as total_sal FROM EMP_DETAIL_TB Group BY DEPARTMENT order by department,total_sal desc;
-- 2.Write down the query to fetch project name assign to more than one Employee
SELECT * FROM project_details_tb;
SELECT PROJECT_NAME,COUNT(emp_id_NO) FROM project_details_tb group by project_name having COUNT(emp_id_no)>1;
-- 3.write the query to get the department, total no. of departments, total(sum) salary  with respect to department from "employee table" table.
select department, count(department), sum(salary) from emp_detail_tb group by department;
/* 4.Get the department-wise salary details from the "employee table" table:
 What is the average salary? (Order by salary ascending)
 What is the maximum salary? (Order by salary ascending)*/
 select department, avg(salary) from emp_detail_tb group by department order by avg(salary);
 select department, max(salary) from emp_detail_tb group by department order by max(salary);
 /* 5. Display department-wise employee count and categorize based on size. (If a department
     has more than 5 employees, label it as 'Large'; between 3 and 5 as 'Medium'; otherwise,'Small')*/
SELECT DEPARTMENT, COUNT(*),
CASE
WHEN COUNT(*) >5 THEN 'LARGE'
WHEN COUNT(*) BETWEEN 3 AND 5 THEN 'MEDIUM'
ELSE 'SMALL'
END AS SIZE 
FROM emp_detail_tb group by DEPARTMENT;
/* 6. Display department-wise average salary and classify pay levels. (If the average salary in a
    department is above 60,000, label it as 'High Pay'; between 50,000 and 60,000 
    as 'Medium Pay'; otherwise, 'Low Pay').*/
SELECT DEPARTMENT, AVG(SALARY),
CASE 
WHEN AVG(SALARY) >60000 THEN 'HIGH PAY'
WHEN AVG(SALARY) BETWEEN 50000 AND 60000 THEN 'MEDIUM PAY'
ELSE 'LOW PAY'
END AS PAY_LEVEL
FROM emp_detail_tb group by department;
 /* 7. Display department, gender, and count of employees in each category. (Group by
    department and gender, showing total employees in each combination)*/
select department, gender, count(*) from emp_detail_tb group by department, gender order by department;
/*8. Display the number of employees who joined each year and categorize hiring trends. (If a
    year had more than 5 hires, mark as 'High Hiring'; 3 to 5 as 'Moderate Hiring'; otherwise,'Low Hiring')*/
    SELECT * FROM amazon_db.emp_detail_tb;
SELECT YEAR, count(year),
 CASE
 WHEN COUNT(YEAR) >5 THEN 'HIGH HIRING'
 WHEN COUNT(YEAR) BETWEEN 3 AND 5 THEN 'MODERATE HIRING'
 ELSE 'LOW HIRING'
 END AS TREND
 FROM (SELECT *, year(JOINING_DATE) YEAR FROM emp_detail_tb) A group by YEAR order by YEAR;
/* 9. Display department-wise highest salary and classify senior roles. (If the highest salary in a
    department is above 70,000, label as 'Senior Leadership'; otherwise, 'Mid-Level')*/
select department, max(salary),
CASE
WHEN MAX(SALARY) >70000 THEN 'SENIOR EADERSHIP'
ELSE 'MID LEVEL'
END AS ROLE
from emp_detail_tb group by department;
 /*--10. Display department-wise count of employees earning more than 60,000. (Group
      employees by department and count those earning above 60,000, labeling departments
     with more than 2 such employees as 'High-Paying Team')*/
select * from emp_detail_tb limit 5 ;
select department, count(*),
CASE 
WHEN COUNT(*) >2 THEN 'HIGH PAYING TEAM'
END AS LABEL from emp_detail_tb where salary >60000 group by department;


             #JOINS RELATED QUERIES
/* 1.Get the employee name and project name from the "employee table" and
 "ProjectDetail" for employees who have been assigned a project, sorted by first name*/
SELECT * FROM EMP_DETAIL_TB LIMIT 2;
SELECT * FROM PROJECT_DETAILS_TB LIMIT 2;
select e.first_name, p.project_name from emp_detail_tb e inner join project_details_tb p on e.emp_id = p.emp_id_no order by first_name;
/*2. Get the employee name and project name from the "employee table" and
 "ProjectDetail" for all employees, including those who have not been assigned a project,
 sorted by first name.*/
 select e.first_name, p.project_name from emp_detail_tb e left join project_details_tb p on e.emp_id = p.emp_id_no order by first_name;
 /* 3.Get the employee name and project name from the "employee table" and
 "ProjectDetail" for all employees. If an employee has no assigned project, display "-No
 Project Assigned," sorted by first name.*/
 SELECT e.FIRST_NAME, COALESCE(p.PROJECT_NAME, 'NO PROJECT ASSIGNED') PROJECT_NAME FROM emp_detail_tb e LEFT JOIN PROJECT_DETAILS_tb p on e.emp_id = p.emp_id_no order by first_name;
/* 4.Get all project names from the "ProjectDetail" table, even if they are not linked to any
 employee, sorted by first name from the "employee table" and "ProjectDetail" table.*/
 SELECT E.first_name, P.PROJECT_NAME FROM emp_detail_tb E RIGHT JOIN project_details_tb P ON e.emp_id = p.emp_id_no order by E.first_name;
 /* 5.Find the project names from the "ProjectDetail" table that have not been assigned to
 any employee using the "employee table" and "ProjectDetail" table.*/
 SELECT P.PROJECT_NAME FROM emp_detail_tb E RIGHT JOIN project_details_tb P ON e.emp_id = p.emp_id_no WHERE E.FIRST_NAME IS NULL;
/* 6.Get the employee name and project name for employees who are assigned to more than
 one project.*/
 SELECT E.FIRST_NAME,p.project_name FROM emp_detail_tb E JOIN project_details_tb P ON E.emp_id = P.emp_id_no 
 where p.emp_id_no in (SELECT emp_id_no FROM project_details_tb GROUP BY emp_id_no HAVING COUNT(*) > 1);
 
/* 7. Get the project name and the employee names of employees working on projects that
 have more than one employee assigned.*/
SELECT P.project_name, E.FIRST_NAME FROM EMP_DETAIL_TB E JOIN PROJECT_DETAILS_TB P ON E.EMP_ID = P.EMP_ID_NO
WHERE P.PROJECT_NAME IN (SELECT PROJECT_NAME FROM project_details_tb group by PROJECT_NAME HAVING COUNT(*)>1) ORDER BY P.PROJECT_NAME;
 
 /*8. Get records from the "ProjectDetail" table where the corresponding employee ID does
 not exist in the "employee table."*/
select p.project_name from project_details_tb p left join emp_detail_tb e on e.emp_id = p.emp_id_no where e.first_name is null ;
