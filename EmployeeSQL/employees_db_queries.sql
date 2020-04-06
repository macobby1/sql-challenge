--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employee as e
inner join "salary" as s on
e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.
select * from employee 
where hire_date between '01/01/1986' and '01/01/1987'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, dm.emp_no, dm.from_date, dm.to_date, e.last_name, e.first_name
from departments d
inner join departmentmanager dm on
d.dept_no=dm.dept_no
inner join employee e on 
e.emp_no = dm.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select ed.emp_no, e.last_name, e.first_name, d.dept_name
from employeedepartment ed 
inner join employee e on e.emp_no = ed.emp_no
inner join departments d on d.dept_no = ed.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name 
from employee
where first_name = 'Hercules'
and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select ed.emp_no, e.last_name, e.first_name, d.dept_name
from employeedepartment ed 
inner join employee e on e.emp_no = ed.emp_no
inner join departments d on d.dept_no = ed.dept_no
where dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select ed.emp_no, e.last_name, e.first_name, d.dept_name
from employeedepartment ed 
inner join employee e on e.emp_no = ed.emp_no
inner join departments d on d.dept_no = ed.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;