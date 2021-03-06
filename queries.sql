-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT salaries.salary, employees.emp_no,employees.first_name, employees.last_name, employees.gender
FROM salaries
INNER JOIN employees ON
salaries.emp_no = employees.emp_no;

--Homework Question #2 employees hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '19860101'
AND   hire_date < '19861231';

--Homework Question #3  List the manager of each department with the following information: department number, department name, 
--the manager's employee number,last name, first name, and start and end employment dates.
Select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments

INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no

INNER JOIN employees on 
 dept_manager.emp_no  = employees.emp_no;

 --Question #4  List the department of each employee with the following information: employee number, last name, first name, and department name.
Select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name 
FROM departments

INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no

INNER JOIN employees on 
dept_emp.emp_no  = employees.emp_no;

--Question #5 List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
FROM Employees
WHERE
	first_name = 'Hercules'
	AND last_name like '%B%';

-- Question #6  List all employees in the Sales department, including their employee number, last name, first name, and department name.


Select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name, dept_emp.from_date, dept_emp.to_date
FROM departments

INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no

INNER JOIN employees on 
 dept_emp.emp_no  = employees.emp_no WHERE departments.dept_name = 'Sales'
 
--Question #7 List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

Select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name, dept_emp.from_date, dept_emp.to_date
FROM departments

INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no

INNER JOIN employees on 
 dept_emp.emp_no  = employees.emp_no WHERE departments.dept_name IN ('Sales', 'Development')
 
 --8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

-- Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

SELECT * FROM employees WHERE emp_no = '499942';