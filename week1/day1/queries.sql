-- Day 1 SQL Practice

-- 1. Select all columns from Employee
SELECT * FROM Employee;

-- 2. Select name and salary
SELECT name, salary FROM Employee;

-- 3. Employees older than 30
SELECT * FROM Employee WHERE age > 30;

-- 4. Department names
SELECT name FROM Department;

-- 5. Employees in IT department
SELECT e.name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.name = 'IT';

-- 6. Names starting with J
SELECT * FROM Employee WHERE name LIKE 'J%';

-- ===============================
-- STRING MATCHING QUERIES (7–10)
-- ===============================

-- 7. Employees whose names end with 'e'
SELECT * 
FROM Employee 
WHERE name LIKE '%e';

-- 8. Employees whose names contain 'a'
SELECT * 
FROM Employee 
WHERE name LIKE '%a%';

-- 9. Employees whose names are exactly 9 characters long
SELECT * 
FROM Employee 
WHERE LENGTH(name) = 9;

-- 10. Employees whose names have 'o' as the second character
SELECT * 
FROM Employee 
WHERE name LIKE '_o%';


-- ===============================
-- DATE QUERIES (11–15)
-- ===============================

-- 11. Employees hired in the year 2020
SELECT * 
FROM Employee 
WHERE YEAR(hire_date) = 2020;

-- 12. Employees hired in January (any year)
SELECT * 
FROM Employee 
WHERE MONTH(hire_date) = 1;

-- 13. Employees hired before 2019
SELECT * 
FROM Employee 
WHERE hire_date < '2019-01-01';

-- 14. Employees hired on or after March 1, 2021
SELECT * 
FROM Employee 
WHERE hire_date >= '2021-03-01';

-- 15. Employees hired in the last 2 years
SELECT * 
FROM Employee 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);


-- 16. Find the total salary of all employees
SELECT SUM(salary) AS total_salary
FROM Employee;

-- 17. Find the average salary of employees
SELECT AVG(salary) AS average_salary
FROM Employee;

-- 18. Find the minimum salary
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- 19. Count the number of employees in each department
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- 20. Find the average salary in each department
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- ===============================
-- GROUP BY QUERIES (21–25)
-- ===============================

-- 21. Find total salary department-wise
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- 22. Find departments having more than 2 employees
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 23. Find maximum salary in each department
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id;

-- 24. Find minimum age in each department
SELECT department_id, MIN(age) AS minimum_age
FROM Employee
GROUP BY department_id;

-- 25. Find departments with average salary greater than 55000
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;
