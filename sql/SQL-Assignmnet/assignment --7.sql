-- 1) Find the date difference between the hire date and resignation_date for all the
-- employees. Display in no. of days, months and year(1 year 3 months 5 days).
-- Emp_ID Hire Date Resignation_Date
-- 1 1/1/2000 7/10/2013
-- 2 4/12/2003 3/8/2017
-- 3 22/9/2012 21/6/2015
-- 4 13/4/2015 NULL
-- 5 03/06/2016 NULL
-- 6 08/08/2017 NULL
-- 7 13/11/2016 NULL
create table customer(
id int primary key auto_increment,
hire_date date,
resignation_Date date);

insert into customer(hire_date,resignation_Date) values("2000/1/01" ,"2013/10/07");
insert into customer(hire_date,resignation_Date) values("2003/12/04","2017/8/03");
insert into customer(hire_date,resignation_Date) values("2012/9/22", "2015/6/21");
insert into customer(hire_date) values("2015/4/13");
insert into customer(hire_date)values("2016/06/03");
insert into customer(hire_date) values("2017/08/08");
insert into customer(hire_date)values("2016/11/13");

-- drop table customer;
select*from customer;


select  date(DATEDIFF(month,resignation_Date,hire_date),'%m/%d/%Y')from customer;
select datediff(resignation_Date,hire_date), floor(datediff(resignation_Date,hire_date)/365) as years ,
floor((datediff(resignation_Date,hire_date)%365) /30) as  months,
(datediff(resignation_Date,hire_date)%365)%30 as days from customer;


-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)
 select date_format(hire_date,"%m/%d/%Y") as hire_date,ifnull(date_format(resignation_Date,"%b %D %Y"),"DEC 01th 1900")as resignation_Date 
 from customer;
 -- 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3
-- months)
-- Use Getdate() as input date for the below three questions.
SELECT
     FLOOR(DATEDIFF(resignation_Date, hire_date) / 365) AS years,
    FLOOR((DATEDIFF(resignation_Date, hire_date) % 365) / 30) AS months
FROM
    customer;
-- 4) Display the count of days in the previous quarter
SELECT DATEDIFF(27-05-2023, 01-02-2023) AS days_in_previous_quarter
FROM (
    SELECT
        LAST_DAY(DATE_SUB(NOW(), INTERVAL QUARTER(NOW()) - 1 QUARTER)) + INTERVAL 1 DAY AS quarter_start,
        LAST_DAY(DATE_SUB(NOW(), INTERVAL QUARTER(NOW()) - 1 QUARTER)) AS quarter_end
) AS customer;


-- 5) Fetch the previous Quarter's second week's first day's date
-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)
-- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with
-- clause.
-- Use Airport database for the below two question:
-- 8) Find the number of days elapsed between first and last flights of a passenger.
-- 9) Find the total duration in minutes and in seconds of the flight from Rostov to Moscow