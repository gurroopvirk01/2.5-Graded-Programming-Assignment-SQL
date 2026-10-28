-- Exercise 1: Mastering the SQL SELECT Statement
-- Schema used by the UtilityBase playground:
-- employees(id, name, department, salary, hire_date, manager_id)
-- departments(id, name, budget)

-- Basic query explicitly requested in the exercise:
SELECT id, name, department
FROM employees
LIMIT 10;

-- Q1. Employees and Department Budgets
SELECT
    e.id AS employee_id,
    e.name AS employee_name,
    e.department,
    d.budget AS department_budget
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department = d.name
ORDER BY e.id;

-- Q2. Employees and Their Managers
SELECT
    e.id AS employee_id,
    e.name AS employee_name,
    m.name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.id
ORDER BY e.id;

-- Q3. Employee Count by Department
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY department;

-- Q4. Average Salary by Department
SELECT
    department,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY department;

-- Q5. Salary Summary by Department
SELECT
    department,
    COUNT(*) AS employee_count,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY department;
