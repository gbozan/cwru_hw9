--1. List the employee number, last name, first name, sex, and salary of each employeeEmployee Number, last, first, Sex, Salary
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , employees.sex
    , salaries.salary
FROM employees
INNER JOIN salaries ON
    employees.emp_no = salaries.emp_no;
   

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name
    , last_name
    , hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;
    


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no
    , departments.dept_name
    , dept_manager.emp_no
    , employees.first_name
    , employees.last_name
FROM dept_manager
INNER JOIN departments ON
    dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
    dept_manager.emp_no = employees.emp_no;
    -- 24 results

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no
    , dept_emp.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM dept_emp
INNER JOIN employees ON
    dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
    dept_emp.dept_no = departments.dept_no;
   

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name
    , last_name
    , sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names
SELECT last_name
    , count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;