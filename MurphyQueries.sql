use carservice;

/* select first and surnames of all customers living in Waterford*/
select fName as 'First Name', lName as 'Last Name', county as 'County'
from customer
where county = 'Waterford';

/*select the first name and email address of all customers living in Waterford county*/
select fname as 'First Name', email as 'email address', county as 'county'
from customer
where county in ('Waterford');

/*select all customers from Kilkenny and display their mobile phone numbers*/
select fname as 'First Name', lname as 'Surname', county as 'County', mobile as'Mobile'
from customer join CustomerPhoneNo
on customer.customerId = customerPhoneNo.customerId
where county like 'kilkenny';

/*select all customers with a car that has a hybrid engine*/
select fname as 'First Name', lname as 'Surname', county as 'County', carReg as 'Registration', fuelType as 'hyprid'
from customer join car
on customer.customerId = car.customerId
where fuelType like 'hybrid';

/*select all customers, the county, car reg & fuel type for customers who paid by cheque and the date of the payment*/ 
select concat(fname, ' ', lname) as 'Name', county as 'County', carReg as 'Registration', fuelType as 'Engine', paymentDate as 'date'
from customer join car
on customer.customerId = car.customerId
join payment
on customer.customerId = payment.customerId
where paymentMethod like 'cheque';

/* select customers with info on name, county and engine type who have had a repair done at the garage */
select concat(fname, ' ', lname) as 'Name', county as 'County', fuelType as 'Engine', serviceType as 'service'
from customer join car
on customer.customerId = car.customerId
join service
on service.carReg = car.carReg
where serviceType like 'repair';

/* select customers by name, county and car reg for cars registered from 2017 to 2020*/
select concat(fname, ' ', lname) as 'Name', county as 'County', carReg as 'Registration'
from customer join car
on customer.customerId = car.customerId
where carReg between '171%' and '202%'; 

/*select all staff, type of task and hours used by date of service. list in descending order*/
select concat(fname, ' ', lname) as 'Name', task as 'job', hours as 'hours worked', serviceDate as 'date'
from staff join assignment
on staff.employeeId = assignment.employeeId
order by hours desc;

/*list employees by name in dob order with salary and job title info with phone mobile number added on right */
select concat(fname, ' ', lname) as 'Name', salary as 'salary', dob as 'Birthday', 
qualification as 'job description', mobile as 'phone'
from staff right join staffphoneno
on staff.employeeId = staffphoneno.employeeId 
order by dob;

/* find the number of staff in each job role*/
select qualification, count(qualification) as 'job description'
from staff
group by qualification;

/* find lowest and higest staff salary*/
select max(salary), min(salary)
from staff;

/*find the average cost for a car service/repair for calendar year 2022*/
select round (avg (amount), 2)
from payment
where paymentDate between 20220101 and 20220131;

/*find departments with a salary cost of over 100k*/
select qualification, sum(salary)
from staff
group by qualification
having sum(salary) > 100000;

/*find makes of car and the number of services for each make*/
select make as 'Manufacturer', count(serviceType) as 'total services'
from car join service
on car.carReg = service.carReg
group by make;

select *
from car right join part
on car.carReg = part.carReg
left join service
on car.carReg = service.carReg
where description like 'anti-%';

/* select the number of cars by a particular manufacturer with average mileage greater than 50,000*/
select make as 'Manufacturer', round (avg(mileage), 2)
from car join service
on car.carReg = service.carReg
group by make
having avg(mileage) >= 50000;

/*return the car with the lowest mileage for each county. Spelling mistake in one county name. Left it in to show 
this select working as only 2 counties detailed in the db. Normally this would be fixed with 'update'*/
select county as 'County', min(mileage) as 'Mileage'
from customer join car
on customer.customerId = car.customerId
group by county
having min(mileage);

/*match all the staff for assignments on cars, office staff and manager will be null */
select * 
from staff left join assignment
on staff.employeeId = assignment.employeeId;

/* same query with a right join doesn't show the null fields as office and manager staff not included in car service assignments*/
select * 
from staff right join assignment
on staff.employeeId = assignment.employeeId;

/*select all cars and car service info from cars who had anti-freeze used*/
select *
from car right join part
on car.carReg = part.carReg
left join service
on car.carReg = service.carReg
where description like 'anti-%';









