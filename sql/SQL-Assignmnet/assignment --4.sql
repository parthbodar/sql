/*--1. Write a query to display the last name, department number, department name for all
employees.---*/
select last_name,department_name from employees left join departments 
on employees.department_id=departments.department_id;

/*--2. Create a unique list of all jobs that are in department 4. Include the location of the
department in the output.---*/
select first_name,job_title ,department_id from employees left join jobs on employees.job_id=jobs.job_id
where department_id=50;

select job_id from employees, departments
where employees.department_id=departments.department_id
and employees.department_id=4;


/*--3. Write a query to display the employee last name,department name,location id and city of
all employees who earn commission.--*/
select e.last_name,d.department_name,l.city,e.commission_pct,l.location_id from employees as e 
join departments as d on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id
where commission_pct is not null;

/*--4. Display the employee last name and department name of all employees who have an 'a'
in their last name--*/
select last_name,department_name from employees as e join departments as d on e.department_id=d.department_id
where last_name like "%a";


/*---5. Write a query to display the last name,job,department number and department name for
all employees who work in ATLANTA.--*/
select e.last_name,e.job_id,e.department_id,d.department_name,l.city,j.job_title from employees as e 
join departments as d on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id
join jobs as j on e.job_id=j.job_id
where l.city="Toronto";



/*---6. Display the employee last name and employee number along with their manager's last
name and manager number.--*/
-- select employee_id,last_name,manager_id from employees;
-- select e.last_name,e.employee_id,m.last_name ,m. employee_id from employees e 
-- join employees m
-- on e.manager_id=m.employee_id;


/*---7. Display the employee last name and employee number along with their manager's last
name and manager number (including the employees who have no manager).--*/

/*---8. Create a query that displays employees last name,department number,and all the
employees who work in the same department as a given employee.--*/
select e.department_id,e.last_name employees,c.last_name from employees e join employees c
on e.department_id=c.department_id
where e.employee_id<>c.employee_id;
select e.last_name,e.department_id,department_name from employees e join departments d
on e.department_id=d.department_id;
 /*--9. Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)--*/
select concat_ws(" ",first_name,last_name) as name,department_name,job_id ,salary,
case
when salary>=5000 then "A"
when salary>=3000 then "B"
else "c"
end as "grade based on salary"
from employees  join departments
on employees.department_id=departments.department_id;




/*--10. Display the names and hire date for all employees who were hired before their
managers along withe their manager names and hire date. Label the columns as Employee
name, emp_hire_date,manager name,man_hire_date--*/
