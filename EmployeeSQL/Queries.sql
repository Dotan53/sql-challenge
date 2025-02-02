-- Queries for sql-challenge

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM employees as emp
    LEFT JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

 --List the first name, last name, and hire date for the employees who were hired in 1986
 
SELECT 
    first_name AS "First Name",
    last_name AS "Last Name",
    hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
    dm.dept_no AS "Department No.",
    d.dept_name AS "Department Name",
    dm.emp_no AS "Employee No.",
    e.last_name AS "Last Name",
    e.first_name AS "First Name"
FROM dept_manager AS dm
JOIN departments AS d 
    ON dm.dept_no = d.dept_no
JOIN employees AS e 
    ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no, e.last_name, e.first_name;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
de.dept_no AS "Department No.",
de.emp_no AS "Employee No.",
e.last_name AS "Last Name",
e.first_name AS "First_Name",
d.dept_name AS "Department Name"
FROM dept_emp de
JOIN employees e
ON de.emp_no = e.emp_no
Join departments d
ON de.dept_no = d.dept_no
;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
employees.first_name AS "First Name",
employees.last_name AS "Last Name",
employees.sex As "Sex"
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT 
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
    employees.last_name AS "Last Name", 
    COUNT(employees.last_name) AS "Frequency"
FROM employees
GROUP BY employees.last_name
ORDER BY "Frequency" DESC;
