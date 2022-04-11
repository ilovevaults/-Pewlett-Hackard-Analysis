-SELECT employees.emp_no,employees.first_name,
employees.last_name,
titles.to_date,titles.from_date,titles.title
INTO retirement_titles
FROM employees
Left JOIN titles
On employees.emp_no=titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC;
select *from retirement_titles

Select Distinct rt.emp_no,rt.first_name,rt.last_name,
rt.title
Into Unique_Titles
From retirement_titles as rt
Where (to_date= '9999-01-01')
ORDER BY rt.emp_no ASC
select * from Unique_Titles

Select Count (UT.title),UT.title
Into Retiring_Titles
From Unique_Titles as UT
Group By title
ORDER BY Count(UT.title) DESC
select * from Retiring_Titles
-- Mentor Membership eligibilty 
Select Distinct On(employees.emp_no)employees.first_name,
employees.last_name, employees.birth_date,dept_emp.from_date,
titles.title,dept_emp.to_date
Into Membership_Eligibility
From employees
Left Join dept_emp
On employees.emp_no=dept_emp.emp_no
Left Join titles
On employees.emp_no=titles.emp_no
Where (dept_emp.to_date='9999-01-01')
AND (birth_date Between '1965-01-01'AND '1965-12-31')
select * from Membership_Eligibility
