-- =====================================
-- SELECT QUERIES
-- =====================================

-- 1. Display all employee details
SELECT * FROM Employees;

-- 2. Display only employee names and salaries
SELECT emp_name, salary FROM Employees;

-- 3. Display employee names and departments
SELECT emp_name, department FROM Employees;

-- 4. Display all employees from IT department
SELECT * FROM Employees
WHERE department = 'IT';

-- 5. Display employee names and experience
SELECT emp_name, experience FROM Employees;


-- =====================================
-- WHERE QUERIES
-- =====================================

-- 6. Employees with salary greater than 70000
SELECT * FROM Employees
WHERE salary > 70000;

-- 7. Employees working in Hyderabad
SELECT * FROM Employees
WHERE city = 'Hyderabad';

-- 8. Employees with experience less than 4 years
SELECT * FROM Employees
WHERE experience < 4;

-- 9. Employees from Finance department
SELECT * FROM Employees
WHERE department = 'Finance';

-- 10. Employees with salary equal to 52000
SELECT * FROM Employees
WHERE salary = 52000;


-- =====================================
-- GROUP BY QUERIES
-- =====================================

-- 11. Total salary department-wise
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

-- 12. Average salary in each department
SELECT department,
       AVG(salary) AS average_salary
FROM Employees
GROUP BY department;

-- 13. Count employees in each city
SELECT city,
       COUNT(*) AS employee_count
FROM Employees
GROUP BY city;

-- 14. Maximum salary in each department
SELECT department,
       MAX(salary) AS max_salary
FROM Employees
GROUP BY department;

-- 15. Minimum experience department-wise
SELECT department,
       MIN(experience) AS min_experience
FROM Employees
GROUP BY department;


-- =====================================
-- HAVING QUERIES
-- =====================================

-- 16. Departments having more than 3 employees
SELECT department,
       COUNT(*) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(*) > 3;

-- 17. Departments where average salary > 60000
SELECT department,
       AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 18. Cities having more than 2 employees
SELECT city,
       COUNT(*) AS employee_count
FROM Employees
GROUP BY city
HAVING COUNT(*) > 2;

-- 19. Departments where total salary > 200000
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;

-- 20. Departments where maximum salary > 90000
SELECT department,
       MAX(salary) AS max_salary
FROM Employees
GROUP BY department
HAVING MAX(salary) > 90000;


-- =====================================
-- TOP QUERIES
-- =====================================

-- 21. Top 5 highest paid employees
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- 22. Top 3 employees with highest experience
SELECT * FROM Employees
ORDER BY experience DESC
LIMIT 3;

-- 23. Top 2 salaries from Finance department
SELECT * FROM Employees
WHERE department = 'Finance'
ORDER BY salary DESC
LIMIT 2;

-- 24. Top 4 employees from Hyderabad
SELECT * FROM Employees
WHERE city = 'Hyderabad'
LIMIT 4;

-- 25. Top 1 highest salary employee
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 1;


-- =====================================
-- DISTINCT QUERIES
-- =====================================

-- 26. Distinct department names
SELECT DISTINCT department
FROM Employees;

-- 27. Distinct city names
SELECT DISTINCT city
FROM Employees;

-- 28. Distinct salary values
SELECT DISTINCT salary
FROM Employees;

-- 29. Distinct department and city combinations
SELECT DISTINCT department, city
FROM Employees;

-- 30. Distinct experience values
SELECT DISTINCT experience
FROM Employees;


-- =====================================
-- COMPARISON OPERATORS
-- =====================================

-- 31. Employees with salary >= 80000
SELECT * FROM Employees
WHERE salary >= 80000;

-- 32. Employees with experience <= 3
SELECT * FROM Employees
WHERE experience <= 3;

-- 33. Employees whose salary is not equal to 45000
SELECT * FROM Employees
WHERE salary <> 45000;

-- 34. Employees with salary < 50000
SELECT * FROM Employees
WHERE salary < 50000;

-- 35. Employees with experience > 5
SELECT * FROM Employees
WHERE experience > 5;


-- =====================================
-- LOGICAL OPERATORS
-- =====================================

-- 36. Employees from IT and salary > 70000
SELECT * FROM Employees
WHERE department = 'IT'
AND salary > 70000;

-- 37. Employees from Hyderabad or Bangalore
SELECT * FROM Employees
WHERE city = 'Hyderabad'
OR city = 'Bangalore';

-- 38. Employees from HR and experience < 3
SELECT * FROM Employees
WHERE department = 'HR'
AND experience < 3;

-- 39. Employees with salary > 60000 or experience > 6
SELECT * FROM Employees
WHERE salary > 60000
OR experience > 6;

-- 40. Employees not from Sales department
SELECT * FROM Employees
WHERE department <> 'Sales';


-- =====================================
-- IN AND NOT IN
-- =====================================

-- 41. Employees working in Hyderabad or Mumbai
SELECT * FROM Employees
WHERE city IN ('Hyderabad', 'Mumbai');

-- 42. Employees whose department is IT or Finance
SELECT * FROM Employees
WHERE department IN ('IT', 'Finance');

-- 43. Employees whose city is not Chennai or Pune
SELECT * FROM Employees
WHERE city NOT IN ('Chennai', 'Pune');

-- 44. Employees whose salary is 45000, 75000, or 91000
SELECT * FROM Employees
WHERE salary IN (45000, 75000, 91000);

-- 45. Employees whose department is not HR or Sales
SELECT * FROM Employees
WHERE department NOT IN ('HR', 'Sales');


-- =====================================
-- BETWEEN QUERIES
-- =====================================

-- 46. Employees with salary between 50000 and 80000
SELECT * FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

-- 47. Employees with experience between 3 and 6
SELECT * FROM Employees
WHERE experience BETWEEN 3 AND 6;

-- 48. Employees whose emp_id is between 105 and 112
SELECT * FROM Employees
WHERE emp_id BETWEEN 105 AND 112;

-- 49. Employees with salary not between 40000 and 60000
SELECT * FROM Employees
WHERE salary NOT BETWEEN 40000 AND 60000;

-- 50. Employees with experience between 2 and 4
SELECT * FROM Employees
WHERE experience BETWEEN 2 AND 4;


-- =====================================
-- LIKE OPERATOR QUERIES
-- =====================================

-- 51. Employees whose names start with 'R'
SELECT * FROM Employees
WHERE emp_name LIKE 'R%';

-- 52. Employees whose names end with 'a'
SELECT * FROM Employees
WHERE emp_name LIKE '%a';

-- 53. Employees whose names contain 'v'
SELECT * FROM Employees
WHERE emp_name LIKE '%v%';

-- 54. Employees whose city starts with 'B'
SELECT * FROM Employees
WHERE city LIKE 'B%';

-- 55. Employees whose department ends with 's'
SELECT * FROM Employees
WHERE department LIKE '%s';
