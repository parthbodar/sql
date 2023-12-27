/*-----1. Display all information in the tables EMP and DEPT.---*/
 select *from employees inner join departments on employees.department_id =departments.department_id;

/*---2. Display only the hire date and employee name for each employee.*/
select hire_date, concat_ws(" ",first_name,last_name)as "employee_name" from employees;

/*---3. Display the ename concatenated with the job ID, separated by a comma and space, and
name the column Employee and Title---*/
select concat_ws(" , ",first_name,last_name,job_id)as "Employee and Title" from employees;

/*---4. Display the hire date, name and department number for all clerks.---*/
select concat_ws(" ",first_name,last_name) as "name", hire_date, department_id from employees where job_id like "%CLERK%";

/*---5. Create a query to display all the data from the EMP table. Separate each column by a
comma. Name the column THE OUTPUT--*/
select concat_ws(", ",employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
as "THE OUTPUT" from employees;

/*---6. Display the names and salaries of all employees with a salary greater than 2000.---*/
select concat_ws(" ",first_name,last_name) as name ,salary from employees where salary >2000;

/*---7. Display the names and dates of employees with the column headers "Name" and "Start
Date"--*/
select concat_ws(" ",first_name,last_name)as Name,hire_date as "Start_date" from employees;

/*----8. Display the names and hire dates of all employees in the order they were hired.---*/
select concat_ws(" ",first_name,last_name) as names, hire_date from employees order by hire_date;

/*---9. Display the names and salaries of all employees in reverse salary order.---*/
select concat_ws(" ",first_name,last_name)as "names", reverse(salary) as salaries from employees;
/*10. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order.---*/
select concat_ws(" ",first_name,last_name)as "ename", department_id as "deptno", 
reverse(salary) from employees;

/*--11. Display the last name and job title of all employees who do not have a manager---*/
select last_name,job_title from employees left join jobs on employees.job_id=jobs.job_id 
where job_title not like "%Manager%";

/*---12. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000---*/
select last_name,job_title,salary from employees left join jobs on employees.job_id=jobs.job_id 
where job_title="sales representative" or job_title="stock clerk" and salary not in (2500,3500,5000);
