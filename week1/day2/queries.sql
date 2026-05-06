

-- ===============================
-- ORDER BY QUERIES (26–30)
-- ===============================

-- 26. Display employees ordered by salary in ascending order
SELECT *
FROM Employee
ORDER BY salary ASC;

-- 27. Display employees ordered by age in descending order
SELECT *
FROM Employee
ORDER BY age DESC;

-- 28. Display employees ordered by hire date
SELECT *
FROM Employee
ORDER BY hire_date ASC;

-- 29. Display employees ordered by department and salary
SELECT *
FROM Employee
ORDER BY department_id ASC, salary DESC;

-- 30. Display top 3 highest paid employees
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;


-- ===============================
-- JOIN QUERIES (31–40)
-- ===============================

-- 31. Display employee names with their department names
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- 32. Display employees and their projects
SELECT e.name AS employee_name,
       p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 33. Display employees working in IT department
SELECT e.*
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';

-- 34. Display departments with their projects
SELECT d.name AS department_name,
       p.name AS project_name
FROM Department d
JOIN Project p
ON d.department_id = p.department_id;

-- 35. Display all employees and their departments using LEFT JOIN
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- 36. Display all departments even if they have no employees
SELECT d.name AS department_name,
       e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 37. Display employees without departments
SELECT *
FROM Employee
WHERE department_id IS NULL;

-- 38. Display projects without departments
SELECT *
FROM Project
WHERE department_id IS NULL;

-- 39. Display employee names and project names department-wise
SELECT e.name AS employee_name,
       p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 40. Count employees in each department with department names
SELECT d.name AS department_name,
       COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name;


-- ===============================
-- SUBQUERY / NESTED QUERIES (41–50)
-- ===============================

-- 41. Find employees earning more than average salary
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- 42. Find employees with maximum salary
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- 43. Find employees working in HR department
SELECT *
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Department
    WHERE name = 'HR'
);

-- 44. Find departments with no employees
SELECT *
FROM Department
WHERE department_id NOT IN (
    SELECT department_id
    FROM Employee
    WHERE department_id IS NOT NULL
);

-- 45. Find employees hired before average hire date
SELECT *
FROM Employee
WHERE hire_date < (
    SELECT AVG(hire_date)
    FROM Employee
);

-- 46. Find second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- 47. Find employees having duplicate salaries
SELECT *
FROM Employee
WHERE salary IN (
    SELECT salary
    FROM Employee
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- 48. Find employees in departments having more than 2 employees
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 2
);

-- 49. Find highest salary in each department
SELECT department_id,
       MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- 50. Find employees not assigned to any department
SELECT *
FROM Employee
WHERE department_id IS NULL;


-- ===============================
-- ADVANCED QUERIES (51–65)
-- ===============================

-- 51. Find duplicate salaries
SELECT salary,
       COUNT(*) AS salary_count
FROM Employee
GROUP BY salary
HAVING COUNT(*) > 1;

-- 52. Find employees older than average age
SELECT *
FROM Employee
WHERE age > (
    SELECT AVG(age)
    FROM Employee
);

-- 53. Find youngest employee
SELECT *
FROM Employee
WHERE age = (
    SELECT MIN(age)
    FROM Employee
);

-- 54. Find employees whose names start with 'A'
SELECT *
FROM Employee
WHERE name LIKE 'A%';

-- 55. Find employees whose names contain 'o'
SELECT *
FROM Employee
WHERE name LIKE '%o%';

-- 56. Find employees hired after 2020
SELECT *
FROM Employee
WHERE hire_date > '2020-12-31';

-- 57. Find employees with salary between 50000 and 70000
SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 70000;

-- 58. Find departments having projects
SELECT DISTINCT d.name
FROM Department d
JOIN Project p
ON d.department_id = p.department_id;

-- 59. Count projects in each department
SELECT department_id,
       COUNT(*) AS project_count
FROM Project
GROUP BY department_id;

-- 60. Find department with highest average salary
SELECT department_id,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 1;

-- 61. Find employee experience in years
SELECT name,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS experience_years
FROM Employee;

-- 62. Find employees hired in the same year
SELECT e.*
FROM Employee e
JOIN (
    SELECT YEAR(hire_date) AS hire_year
    FROM Employee
    GROUP BY YEAR(hire_date)
    HAVING COUNT(*) > 1
) y
ON YEAR(e.hire_date) = y.hire_year;

-- 63. Find total number of employees
SELECT COUNT(*) AS total_employees
FROM Employee;

-- 64. Find total number of departments
SELECT COUNT(*) AS total_departments
FROM Department;

-- 65. Find total number of projects
SELECT COUNT(*) AS total_projects
FROM Project;
