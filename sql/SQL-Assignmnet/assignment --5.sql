-- /*----1. Write a query to display employee numbers and employee name (first name, last name)
-- of all the sales employees who received an amount of 2000 in bonus.---*/
select employee_id, concat_ws(" ",first_name,last_name) as name , department_name,
case
when department_name='Sales' then 2000 
else 0
end as bonus
from employees join departments
on employees.department_id=departments.department_id ;


-- /*--2. Fetch address details of employees belonging to the state CA. If address is null, provide
-- default value N/A

select e.last_name,l.street_address from employees as e join departments as d on e.department_id=d.department_id right join locations as l on d.location_id =l.location_id where l.country_id="CA";
 
-- 3. Write a query that displays all the products along with the Sales OrderID even if an order
-- has never been placed for that product.
-- 4. Find the subcategories that have at least two different prices less than $15.
-- 5. A. Write a query to display employees and their manager details. Fetch employee id,
-- employee first name, and manager id, manager name.
/*--a--*/ SELECT E.first_name AS "Employee Name",
   M.first_name AS "Manager Name"
    FROM employees E 
      LEFT   JOIN employees M
       ON E.manager_id = M.employee_id;
       
/*--B--*/
SELECT e.first_name,
       e. job_id
FROM employees e
WHERE manager_id IS NULL;




-- 6. A. Display the names of all products of a particular subcategory 15 and the names of their
-- vendors.
-- B. Find the products that have more than one vendor.
-- 7. Find all the customers who do not belong to any store.
-- 8. Find sales prices of product 718 that are less than the list price recommended for that
-- product.
-- 9. Display product number, description and sales of each product in the year 2001.
-- 10. Build the logic on the above question to extract sales for each category by year. Fetch
-- Product Name, Sales_2001, Sales_2002, Sales_2003.
-- Hint: For questions 9 & 10 (From Sales.SalesOrderHeader, sales. SalesOrderDetail,
-- Production. Product. Use ShipDate of SalesOrderHeader to extract shipped year.
-- Calculate sales using QTY and unitprice from Sales OrderDetail.)
