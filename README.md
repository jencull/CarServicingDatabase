MURPHY & SONS CAR SERVICING DEPT.

Murphy & Sons is a medium sized family owned. The company sells second hand cars and has a large servicing department. The owner, Michael Murphy, wishes to implement a database to store customer information, their car servicing details and history.

CONCEPTUAL DESIGN - ENTITY TYPES AND ATTRIBUTES.
i. Customer – customers is Customer I.D. name (first and last), address (street, town and county) email address, phone number (mobile, home, work).

ii. Payment – payment I.D., date, amount, method of payment.

iii. Car – Car registration, car details (colour, model, year, fuel type, engine size),
mileage.

iv. Staff – employee I.D, name (first and last), address (street, town and county),
email, date of birth, PPSN, salary, qualification, speciality, phone number
(mobile, home, emergency).

v. Assignment – Car registration, employee ID, hours, task

vi. Part – serial number, description, supplier, date purchased, make, model

ASSOCIATIONS.

i. A customer can own one or many cars but each car can only have one owner.

ii. A customer can make many payments but each payment can only be made by
one customer.

iii. Staff members are supervised by a staff member.

iv. Staff can have many assignments and each assignment will have one staff member.

v. A car can have one or many services but each service has one car.

vi. A car can have or many parts but each part will have one car.

vii. A service can have one or many assignments but each assignment will have one
service.

DATA DICTIONARY.

i. Customer – a person who uses the services of the company.

ii. Payment – money received to discharge the cost of services rendered.

iii. Car – vehicle used/owned by customer that needs maintenance or repair work.

iv. Part – new parts to replace old/damaged parts in cars during service/repair.

v. Staff – the mechanics that will carry out the repair/maintenance work on the car.

vi. Assignment – the unit of work an employee undertakes. Units can vary in
size/length.

vii. Service – the name given to the yearly maintenance work carried out on a car.

CONCEPTUAL MODEL.

<img width="1105" alt="Screenshot 2022-11-07 at 20 18 13" src="https://user-images.githubusercontent.com/113446385/216115616-4ab127dc-7987-4fdf-a83f-15b96443d3b6.png">
 
LOGICAL DESIGN.

i. Customer (customerId, fName, lName, street, town, county, email) Primary key customerId.

ii. Phone (mobile, home, work, customerId). Primary key – mobile.
Foreign key customerId references Customer (customerId).

iii. Payment (paymentId, date, amount, method, customerId). Primary key paymentId.
Foreign key customerId references Customer (customerId).

iv. Car (carReg, make, model, colour, year, fuelType, engineSize, mileage, customerId).
Primary key carReg.
Foreign key customerId references Customer (customerId).

v. Service (serviceType, date, time, carReg). Primary key carReg, date.
Foreign key carReg references Car (carReg).

vi. Part (serialNo, description, supplier, datePurchased, make, model, carRegDate). Primary key serialNo.
Foreign key carRegDate references Service (carRegDate).

vii. Assignment (hours, task, carRegDate, employeeId). Primary key carRegDate, employeeId.
Foreign key carRegDate references Service (carRegDate). Foreign key employeeId references Staff (employeeId).

viii. Staff (employeeId, fName, lName, street, town, county, email, DOB, PPSN, salary, qualification, supervisorId).
Primary key employeeId.
Foreign key supervisorId references Staff (supervisorId).

ix. Phone (mobile, home, emergency, employeeId) Primary key mobile.
Foreign key employeeId references Staff (employeeId).



 
