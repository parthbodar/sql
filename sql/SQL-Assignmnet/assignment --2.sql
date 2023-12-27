 
/*--1) Display the maximum, minimum and average salary and commission earned.---*/
 select max(salary) as "maximum salary",min(salary)as "minimum salary",avg(salary)as "average salary",
 commission_pct from employees ;
 select max(salary),min(salary),avg(Salary),commission_pct from employees;
 
 
/*----2) Display the department number, total salary payout and total commission payout for
each department.--*/
select department_id,sum(salary)as "Total salary",sum(commission_pct) as "total commission" 
from employees group by department_id;
select department_id,sum(salary),sum(commission_pct) from employees group by department_id;


/*----3) Display the department number and number of employees in each department.--*/
select department_id,count(employee_id) from employees group by department_id;
select department_id,employee_id from employees group by department_id;


/*---4) Display the department number and total salary of employees in each department.--*/
select department_id, sum(salary)as "total salary" from employees group by department_id;
select department_id,sum(salary) from employees group by department_id;


/*---5) Display the employee's name who doesn't earn a commission. Order the result set
without using the column name--*/
select concat_ws(" ",first_name,last_name)as "" from employees 
where commission_pct is null;
select first_name from employees where commission_pct is null;


/*---6) Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately--*/
select concat_ws(" ",first_name,last_name)as "employees name",department_id,commission_pct,
case 
when commission_pct is null then "no commision"
else commission_pct
end as commision
from employees;
select first_name,department_id,commission_pct,
case 
when commission_pct is null then "no commission"
else commission_pct
end as commission
 from employees;
 



/*--7) Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriately--*/
SELECT first_name, salary,
CASE
    WHEN commission_pct is null THEN  'No Commission'
    ELSE commission_pct * 2
END 'Commission'
FROM employees;


/*--8) Display the employee's name, department id who have the first name same as another
employee in the same department--*/
select concat_ws("",first_name,last_name)as "employee's name",department_id from employees;


/*---9) Display the sum of salaries of the employees working under each Manager.---*/
 select sum(e.salary),m.first_name from employees e join employees m on e.manager_id=m.employee_id   group by m.first_name;
 
/*--10) Select the Managers name, the count of employees working under and the department
ID of the manager.--*/
 select m.first_name as "manager name",count(e.employee_id) as "Total employee" , e.department_id
 from employees e   join employees m on e.manager_id=m.employee_id group by m.first_name;
 
 select m.first_name,e.department_id, count(e.employee_id) from employees e join employees m
 on e.manager_id=m.employee_id group by m.first_name;
 
 
 
/*---11) Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a!--*/
select e .last_name as employee_name, e.department_id,e.salary,m.last_name as "manager name"  
from employees e left join employees m 
on e.manager_id=m.employee_id where e.last_name like "_a%" and m.last_name like "_a%";
 

/*--12) Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id.--*/
select sum(salary)/count(department_id) as avg ,department_id from employees group by department_id order by department_id;


/*--13) Select the maximum salary of each department along with the department id--*/
select max(salary) as "maximum salary",department_id from employees group by department_id;

/*--14) Display the commission, if not null display 10% of salary, if null display a default value 1--*/
select salary,commission_pct ,
case
when commission_pct  is null then  "1"
else salary*10/100
end  comision
from employees;






