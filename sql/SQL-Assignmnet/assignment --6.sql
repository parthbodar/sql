-- 1 Write a query to display the last name and hire date of any employee in the same
-- department as SALES.
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'SALES')
ORDER BY hire_date DESC;

-- 2. Create a query to display the employee numbers and last names of all employees who
-- earn more than the average salary. Sort the results in ascending order of salary.
 SELECT employee_id, last_name ,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;

-- 3. Write a query that displays the employee numbers and last names of all employees who
-- work in a department with any employee whose last name contains a' u
select last_name,employee_id, department_name from employees 
join departments on employees .department_id=departments.department_id where last_name like "%a";
-- 4. Display the last name, department number, and job ID of all employees whose
-- department location is ATLANTA.
select e.last_name,d.department_id,e.job_id,l.city from employees e left join departments d
on e.department_id=d.department_id join locations l on l.location_id=d.location_id
where l.city="Toronto";

 -- 5. Display the last name and salary of every employee who reports to FILLMORE.
-- 6. Display the department number, last name, and job ID for every employee in the
-- OPERATIONS department.
select d.department_id,e.last_name,d.department_name from employees e left join departments d
on e.department_id=d.department_id
where d.department_name='Operations';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all
-- employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name.
 SELECT employee_id, last_name ,salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) and last_name like "U%";


-- 8. Display the names of all employees whose job title is the same as anyone in the sales
-- dept.
 -- 9. Write a compound query to produce a list of employees showing raise percentages,
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last
-- names and salaries
select last_name,salary from employees order by salary desc limit 3;


-- 11. Display the names of all employees with their salary and commission earned. Employees
-- with a null commission should have O in the commission column
select concat_ws(" ",first_name,last_name) as "employees name",salary,commission_pct,
case
when commission_pct is null then "0"
else commission_pct
end ascommission
from employees;


-- 12. Display the Managers (name) with top three salaries along with their salaries and
-- department information.
select e.first_name,
 e.salary,m.first_name "manager name" ,d.department_name from employees  e left join employees m 
on e.manager_id=m.employee_id join departments d on d.department_id=e.department_id order by salary desc limit 2,3;

select concat(first_name, last_name) as fullname from employees
where department_id = (
select department_id from departments where department_name = "Sales");