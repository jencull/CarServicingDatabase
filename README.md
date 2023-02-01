# CarServicingDatabase

Database outline – Car Servicing Dept.
Murphy & Sons is a medium sized family owned. The company sells second hand cars and has a large servicing department. The owner, Michael Murphy, wishes to implement a database to store customer information and their car servicing history.

Entity types and attributes.

Customer – customers is Customer I.D. (primary key), name (first and last), address (street, town and county) email address and telephone number.
Payment – payment I.D., date, amount, method of payment.
Car – Car registration, car details (colour, model, year, fuel type, engine size), mileage. Appointment – date, time.
Staff – employee I.D, name (first and last), address (street, town and county), phone, email, date of birth, PPSN, salary, qualification and speciality.
Service – carReg, employeeId, service type, parts (1, 2, 3 & 4)

Associations.

A customer can own one or many cars but each car can only have one owner.
A customer can make many payments but each payment can only be made by one customer.
A car can have many appointments but each appointment can only have one car. A car can be serviced by many staff and staff can service many cars.
Staff members are supervised by a staff member.
Staff can carry out many services and services can be carried out by many staff.
A car can have many services but a service will have one car.


Customer – a person who uses the services of the company.
Payment – money received to discharge the cost of services rendered.
Car – vehicle used/owned by customer that needs maintenance or repair work. Appointment – a time slot allocated to the customer during which the repair/maintenance work will be carried out.
Staff – the mechanics that will carry out the repair/maintenance work on the car.
Service – the name given to the yearly maintenance work carried out on a car.



 
