 /*-1-Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label.--*/
select concat(upper(substr(last_name,2,1)),lower(substr(last_name,3,4))),last_name
from employees;
select concat(upper(left(substr(last_name,2,5),1)),lower(substr(substr(last_name,2,5),2))) from employees;

  /*---2. Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined.--*/
select concat_ws(" : ","first name",first_name) as "first name" ,concat_ws(" : ","last name",last_name) as "last name"
, month(hire_date) as "employee has joined "from employees;

/*----3. Write a query to display the employee's last name and if half of the salary is greater than
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
1500 each. Provide each column an appropriate label.---*/
select last_name,salary ,
case
when salary/2>10000 then salary*0.10 + salary
else salary*1.15 + 1500 + salary
end as new_salary
from employees;


/*---4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$!---*/
select  employee_id,concat_ws("",substr(employee_id,1,2),0,0,substr(employee_id,3,1),"E") as employee_id ,
department_id,salary,concat_ws(" ",first_name,last_name)as empoyee_name,job_title from employees left join jobs
on employees.job_id=jobs.job_id where job_title like "%Manager%" and concat_ws(" ",first_name,last_name) like "%z%";


select  employee_id,concat_ws("",substr(employee_id,1,2),0,0,substr(employee_id,3,1),"E")  
 /*--5. Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names--*/
select last_name,char_length(last_name) as lenght_of_names from employees
where last_name like "J%" or
last_name like "A%" or 
last_name like "m%"
order by last_name;


/*---6. Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY---*/
select last_name,salary ,lpad(salary,15,"$") as salary from employees;


/*---7. Display the employee's name if it is a palindrome--*/
select first_name from employees where first_name=reverse(first_name);


/*--8. Display First names of all employees with initcaps.--*/
select upper(first_name) from employees;


/*---9. From LOCATIONS table, extract the word between first and second space from the
STREET ADDRESS column.---*/
select concat("_","_", street_address) as street_address ,street_address from locations;


/*--10. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name.--*/
select concat(first_name,last_name,"@systechusa.com")as "email address"from employees;
select concat(substr(first_name,1,1),last_name,"@systechusa.com") from employees;


/*---11. Display the names and job titles of all employees with the same job as Trenna.---*/
select concat_ws(" ",first_name,last_name) as name ,job_title as "trenna" from employees left join jobs
on employees.job_id=jobs.job_id
and jobs.job_title="sales Representative";


/*---12. Display the names and department name of all employees working in the same city as
Trenna.---*/
/*select concat_ws(" ",first_name,last_name),department_id from employees 999999;---*/
select e.first_name,d.department_name,l.city as "Terenna" from employees as e join departments as d 
on e.department_id=d.department_id join locations as l on d.location_id=l.location_id where l.city="Toronto";


/*---13. Display the name of the employee whose salary is the lowest.---*/
select concat_ws(" ",first_name,last_name)as name,employee_id , min(salary) as lowest from employees;
select *from employees order by salary asc limit 1;

select * from employees where salary=(select min(salary) from employees);

/*---14. Display the names of all employees except the lowest paid.--*/
select concat_ws(" ",first_name,last_name) as name , max(salary) as salary from employees group by name;