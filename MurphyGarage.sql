/*create database for Murphy & Son car servicing dept*/
create database if not exists CarService;

use CarService;

/*create table for customers*/
create table if not exists Customer (
customerId int auto_increment not null,
fName varchar (15) not null,
lName varchar (30) not null,
street varchar (25) not null,
town varchar (20) not null,
county varchar (20),
email varchar (30),
primary key (customerId)
);

/* create table for customer phone number, multi-value attribute*/
create table if not exists CustomerPhoneNo (
mobile int not null,
home int,
work int,
customerId int auto_increment not null,
primary key (mobile),
foreign key (customerId) references Customer (customerId)
on update cascade
on delete cascade
);

/*create table for payment*/
create table if not exists Payment (
paymentId int auto_increment not null,
paymentDate date,
amount float (7,2) not null,
paymentMethod enum ('cash', 'card', 'cheque', 'other') not null,
customerId int not null,
primary key (paymentId),
foreign key (customerId) references Customer (customerId)
on update cascade
on delete cascade
);



/*create table for Car*/
create table if not exists Car (
carReg varchar (15) not null,
make varchar (15),
model varchar (20),
year int,
fuelType enum ('petrol', 'diesel', 'electric', 'hybrid'),
engineSize int,
mileage int,
customerId int auto_increment not null,
primary key (carReg),
foreign key (customerId) references Customer (customerId) 
on update cascade
on delete cascade
);


/*create table for service*/
create table if not exists Service (
serviceType varchar (20),
serviceDate date,
serviceTime time,
carReg varchar (15) not null,
primary key (carReg, serviceDate),
foreign key (carReg) references Car (carReg)
on update cascade
on delete cascade
);

/*create table for part, can have multiple parts used in service*/
create table if not exists Part (
serialNo varchar (30) not null,
description varchar (30) not null,
supplier varchar (30),
make varchar (20),
model varchar (20),
carReg varchar (15) not null,
serviceDate date,
primary key (serialNo),
foreign key (carReg, serviceDate) references Service (carReg, serviceDate)
on update cascade
on delete cascade
);

/*create table for Staff*/
create table if not exists Staff (
employeeId int not null,
fName varchar (15) not null,
lName varchar (30) not null,
street varchar (25) not null,
town varchar (20) not null,
county varchar (15),
email varchar (30),
DOB date,
PPSN varchar (20) not null,
salary float (7,2),
qualification varchar (30),
supervisorId int,
primary key (employeeId),
foreign key (supervisorId) references Staff (employeeId)
on update cascade
on delete cascade
);
drop table Staff;


/*create table for staff phone numbers, multi-value attribute*/
create table if not exists StaffPhoneNo (
mobile int not null,
home int,
workExt int,
employeeId int not null,
primary key (mobile),
foreign key (employeeId) references Staff (employeeId)
on update cascade
on delete cascade
);
drop table StaffPhoneNo;

/*create table for assignment, resolve many to many association between staff and service*/
create table if not exists Assignment (
hours int not null,
task varchar (30) not null,
carReg varchar (15) not null,
serviceDate date,
employeeId int auto_increment not null,
primary key (carReg, serviceDate),
foreign key (employeeId) references Staff (employeeId)
on update cascade
on delete cascade
);
drop table Assignment;

/*data for customer table*/
insert into Customer (customerId, fName, lName, street, town, county, email) values (1, 'Mary', 'Ryan', 'Lismore Park', 'Waterford', 'Waterford', 'bobispo0@businesswire.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (2, 'John', 'Murphy', 'Lismore Lawn', 'Waterford', 'Waterford', 'ntennewell1@google.pl');
insert into Customer (customerId, fName, lName, street, town, county, email) values (3, 'Ann', 'Nealon', 'Oak Road', 'Ferrybank', 'Kilkenny', 'hnealon2@t.co');
insert into Customer (customerId, fName, lName, street, town, county, email) values (4, 'Jack', 'Power', 'Oakley St', 'Slieverue', 'Kilkenny', 'kpickover3@epa.gov');
insert into Customer (customerId, fName, lName, street, town, county, email) values (5, 'Michael', 'Mc Ilory', 'Forrest Lane', 'Mooncoin', 'Kilkennuy', 'cmcilory4@latimes.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (6, 'Finola', 'Buckly', 'Beech Lawns', 'Waterford', 'Waterford', 'gbuckleigh5@wired.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (7, 'Sean', 'Edwards', 'Riverwalk', 'Waterford', 'Waterford', 'kedwards6@zdnet.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (8, 'Josephine', 'Ryan', 'Riverside', 'Waterford', 'Waterford', 'cgiampietro7@prweb.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (9, 'Rory', 'Marshall', 'Lake View', 'Ferrybank', 'Kilkenny', 'bsaltmarsh8@ucsd.edu');
insert into Customer (customerId, fName, lName, street, town, county, email) values (10, 'Sinead', 'Thomas', 'Hillside', 'Dunmore East', 'Waterford', 'ctacon9@nytimes.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (11, 'Thomas', 'Bryant', 'Hillview', 'Slieverue', 'Kilkenny', 'cbrassingtona@digg.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (12, 'Francis', 'Dumbrall', 'River View', 'Mooincoin', 'Kilkenny', 'rdumbrallb@disqus.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (13, 'Mary', 'Nolan', 'Hazelcrest', 'Waterford', 'Waterford', 'oashfoldc@taobao.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (14, 'Niamh', 'Connelly', 'Butlerstown Lane', 'Waterford', 'Waterford', 'gdionsettid@163.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (15, 'Deirdre', 'Mundford', 'School Road', 'Carrickphierish', 'Waterford', 'amundforde@cnn.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (16, 'Brian', 'Callan', 'Kings Channel', 'Waterford', 'Waterford', 'scrallanf@so-net.ne.jp');
insert into Customer (customerId, fName, lName, street, town, county, email) values (17, 'Adam', 'Scanlon', 'Castle Rock', 'Mooncoin', 'Kilkenny', 'vscandrootg@cbsnews.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (18, 'Cillian', 'Tiernan', 'College Road', 'Waterford', 'Waterford', 'wseamenh@wunderground.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (19, 'Callum', 'Ryan', 'Pine view', 'Ferrybank', 'Kilkenny', 'hrandlei@delicious.com');
insert into Customer (customerId, fName, lName, street, town, county, email) values (20, 'Eve', 'Murphy', 'Hazel Grove', 'Slieverue', 'Kilkenny', 'hvynollj@thetimes.co.uk');
select * from Customer;

/*insert data into customer phone number table*/
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('085341297', '051337747', '051660687', 1);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('086303379', '051183155', '051748976', 2);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('087845914', '051407541', '051200879', 3);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('088812431', '051665458', '051259342', 4);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('089639253', '051362087', '051805981', 5);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('085646156', '051522197', '051753182', 6);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('086969269', '051977309', '051835649', 7);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('087182747', '051231291', '051214181', 8);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('088484202', '051211737', '051515385', 9);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('089260177', '051317069', '051659290', 10);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('085503169', '051887949', '051608451', 11);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('086323065', '051730679', '051872706', 12);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('087811368', '051448391', '051792180', 13);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('088211636', '051141587', '051986632', 14);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('089949523', '051332736', '051405471', 15);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('085537146', '051278551', '051743628', 16);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('086179174', '051292225', '051330333', 17);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('087745367', '051608932', '051494469', 18);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('088643985', '051513951', '051702722', 19);
insert into CustomerPhoneNo (mobile, home, work, customerId) values ('089507895', '051571203', '051194352', 20);
select * from CustomerPhoneNo;

/* data for payment table*/
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (1, '20221010', '339.31', 'cash', 1);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (2, '20221111', '209.03', 'card', 2);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (3, '20221016', '443.86', 'cheque', 3);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (4, '20220219', '132.87', 'other', 4);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (5, '20211225', '492.82', 'cash', 5);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (6, '20220216', '357.33', 'card', 6);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (7, '20221005', '247.60', 'cheque', 7);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (8, '20220920', '258.83', 'other', 8);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (9, '20211108', '403.99', 'cash', 9);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (10, '20220317', '248.80', 'card', 10);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (11, '20210817', '287.29', 'cheque', 11);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (12, '20220113', '546.03', 'other', 12);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (13, '20220108', '237.63', 'cash', 13);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (14, '20220212', '563.87', 'card', 14);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (15, '20211003', '268.87', 'cheque', 15);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (16, '20210706', '221.99', 'other', 16);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (17, '20220323', '177.06', 'cash', 17);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (18, '20210110', '355.59', 'card', 18);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (19, '20220103', '560.08', 'cheque', 19);
insert into Payment (paymentId, paymentDate, amount, paymentMethod, customerId) values (20, '20220509', '392.34', 'other', 20);
select * from payment;


/*data for Car table*/
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('161D26098', 'Chevrolet', 'Tahoe', 'petrol', '63743', 1);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('172W33821', 'Mazda', 'MX-6', 'diesel', '724', 2);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('181KK3257', 'Toyota', 'Hilux', 'electric', '28931', 3);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('192W19054', 'Honda', 'Accord', 'hybrid', '7103', 4);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('201W2267', 'Volkswagen', 'Eurovan', 'petrol', '47044', 5);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('212KK4862', 'Lexus', 'LFA', 'diesel', '12587', 6);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('221W9876', 'Lexus', 'ES', 'electric', '576784', 7);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('162C2865', 'Ford', 'Sierra 1500', 'hybrid', '34809', 8);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('171OY6258', 'Honda', 'Civic', 'petrol', '79009', 9);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('182C28214', 'Lexus', 'ES', 'electric', '45005', 10);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('191W22763', 'BMW', '600', 'hybrid', '66836', 11);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('202W11864', 'Mercedes', 'E-Class', 'petrol', '91378', 12);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('211KK9078', 'Jaguar', 'S-Type', 'diesel', '86492', 13);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('221D48662', 'Nissan', 'Juke', 'electric', '8446', 14);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('162KK7927', 'Ford', 'Fiesta', 'hybrid', '930', 15);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('171W214', 'Toyota', 'Corolla', 'petrol', '5700', 16);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('182KK579', 'Mazda', 'MX-3', 'diesel', '7256', 17);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('191C4408', 'Volkswagen', 'Passat', 'electric', '68856', 18);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('202D52193', 'Dodge', 'Neon', 'hybrid', '6636', 19);
insert into Car (CarReg, make, model, fuelType, mileage, customerId) values ('211W10629', 'Mercedes', 'A-Class', 'diesel', '79456', 20);

select * from Car;

/*data for Service*/
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-10-17', '10:00:00', '161D26098');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-10-13', '12:00:00', '172W33821');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-10-03', '14:00:00', '181KK3257');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-10-06', '10:00:00', '192W19054');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-06-28', '10:00:00', '201W2267');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-09-15', '12:00:00', '212KK4862');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-08-26', '14:00:00', '221W9876');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-06-08', '16:00:00', '162C2865');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-09-21', '16:00:00', '171OY6258');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-07-06', '10:00:00', '182C28214');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-10-10', '08:00:00', '191W22763');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-08-11', '16:00:00', '202W11864');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-08-08', '08:00:00', '211KK9078');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-10-01', '14:00:00', '221D48662');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-09-01', '10:00:00', '162KK7927');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-07-24', '10:00:00', '171W214');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-11-22', '14:00:00', '182KK579');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-06-19', '08:00:00', '191C4408');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-11-25', '08:00:00', '202D52193');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-09-01', '16:00:00', '211W10629');
select * from Service;

insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('WAUEH78E27A746877', 'anti-freeze', 'Firestone', '20-502-9184', '161D26098', '2022-10-17');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('WP0AB2A89CS253552', 'tyre', 'Firestone', '86-370-6826', '172W33821', '2022-10-13');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('1G6AA5RAXF0634762', 'filter', 'Bohringer', '28-832-9882', '181KK3257', '2022-10-03');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('1GYS4NKJ7FR331950', 'brake pads', 'Bohringer', '70-945-3951', '192W19054', '2022-10-06');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('1FTEW1C84FF281704', 'brake pads', 'Musgraves', '91-738-2679', '201W2267', '2022-06-28');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('1N6AF0KY3FN003831', 'anti-freeze', 'Cantwells', '74-620-7970', '212KK4862', '2022-09-15');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('1YVHZ8BH4C5117396', 'tyre', 'Bohringer', '18-049-5681', '221W9876', '2022-08-26');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('JN8AF5MR7DT358956', 'brake pads', 'Cantwells', '14-626-5210', '162C2865', '2022-06-08');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('1YVHZ8BH2C5746204', 'anti-freeze', 'Firestone', '14-575-4000', '171OY6258', '2022-09-21');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('5LMJJ2H5XCE504570', 'tyre', 'Bohringer', '39-346-2066', '182C28214', '2022-07-06');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('3C3CFFER9ET414107', 'oil', 'Bohringer', '89-873-6409', '191W22763', '2022-10-10');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('WAUAH98E78A020945', 'anti-freeze', 'Musgraves', '64-694-2019', '202W11864', '2022-08-11');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('3GYFK66N26G944178', 'tyre', 'Bohringer', '32-322-1988', '211KK9078', '2022-08-08');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('3GYFNBEY6AS154528', 'brake pads', 'Cantwells', '77-224-4603', '221D48662', '2022-10-01');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('SCBGT3ZA7FC618977', 'anti-freeze', 'Bohringer', '21-128-4478', '162KK7927', '2022-09-01');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('WBA3N3C53EF855767', 'filter', 'Cantwells', '64-847-9761', '171W214', '2022-07-24');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('WAUCFAFR2BA506401', 'anti-freeze', 'Bohringer', '46-695-9532', '182KK579', '2022-11-22');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('WP0AA2A93BS732754', 'oil', 'Musgraves', '21-935-3265', '191C4408', '2022-06-19');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('JN8AZ2NC5E9291529', 'oil', 'Cantwells', '94-333-7747', '202D52193', '2022-11-25');
insert into Part (serialNo, description, supplier, model, carReg, serviceDate) values ('JM1NC2LF8D0581942', 'tyre', 'Musgraves', '27-090-9746', '211W10629', '2022-09-01');
select * from Part;

/*data for staff table*/
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (25, 'Helen', 'Dillon', 'Hill View', 'Dunmore East', 'Waterford', 'mtandey4@artisteer.com', '1988-09-28', '5322', '43476.42', 'manager', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (21, 'Frances', 'Cullen', 'River Walk', 'Waterford', 'Waterford', 'ngutridge0@dailymail.co.uk', '1990-07-11', '9466', '49041.39', 'mechanic', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (22, 'Jack', 'Murphy', 'Pine View', 'Waterford', 'Waterford', 'zdohmer1@hc360.com', '1987-01-11', '888', '43879.60', 'mechanic', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (23, 'Rose', 'Murphy', 'Lismore park', 'Waterford', 'Waterford', 'ndemoreno2@jigsy.com', '1986-09-26', '0', '45203.25', 'mechanic', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (24, 'Frances', 'Vaughan', 'River Walk', 'Waterford', 'Waterford', 'mgrimley3@china.com.cn', '1995-05-26', '52', '49719.37', 'office', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (26, 'Jake', 'Cullen', 'Lismore park', 'Waterford', 'Waterford', 'hsnary5@nytimes.com', '1977-01-09', '1', '38334.02', 'mechanic', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (27, 'Andy', 'Dillon', 'Pine View', 'Ferrbyank', 'Kilkenny', 'nriche6@desdev.cn', '1981-10-21', '5217', '43236.82', 'mechanic', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (28, 'John', 'Cunningham', 'River Walk', 'Ferrbyank', 'Kilkenny', 'moakwood7@altervista.org', '1998-11-05', '54093', '32847.46', 'office', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (29, 'Jake', 'Conroy', 'Fairfield Drive', 'Mooncoin', 'Kilkenny', 'kgowans8@phpbb.com', '1997-04-04', '5', '36063.63', 'mechanic', '25');
insert into Staff (employeeId, fname, lname, street, town, county, email, dob, ppsn, salary, qualification, supervisorId) values (30, 'Jack', 'Ryan', 'Hillside', 'Waterford', 'Waterford', 'rmatterdace9@wikipedia.org', '1985-01-15', '6121', '38145.93', 'mechanic', '25');

/*data for Staff Phone numbers NOT INPUT*/
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('089341297', '051337746', '66', 21);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('088303379', '051183154', '67', 22);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('086845914', '051407542', '51', 23);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('087812431', '051665457', '41', 24);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('085639253', '051362086', '83', 25);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('088646156', '051522196', '81', 26);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('087969269', '051977308', '48', 27);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('085182747', '051231292', '89', 28);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('086484202', '051211736', '84', 29);
insert into StaffPhoneNo (mobile, home, workExt, employeeId) values ('087260177', '051317068', '62', 30);

/*data for Assignment*/
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '161D26098', '2022-10-17', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '172W33821', '2022-10-13','23');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '181KK3257', '2022-10-03', '26');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'full', '192W19054', '2022-10-06', '27');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'mid-year', '201W2267', '2022-06-28', '29');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'mid-year', '212KK4862', '2022-09-15', '30');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'repair', '221W9876', '2022-08-26', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'mid-year', '162C2865', '2022-06-08', '23');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'mid-year', '171OY6258', '2022-09-21', '26');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (1, 'mid-year', '182C28214', '2022-07-06', '27');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'repair', '191W22763', '2022-10-10', '29');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full', '202W11864', '2022-08-11', '30');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'repair',  '211KK9078', '2022-08-08', '23');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'repair',  '221D48662', '2022-10-01', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'repair', '162KK7927', '2022-09-01', '27');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'repair', '171W214',  '2022-07-24', '26');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (1, 'repair', '182KK579', '2022-11-22', '29');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full', '191C4408', '2022-06-19', '30');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (1, 'full', '202D52193', '2022-11-25', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (1, 'mid-year', '211W10629', '2022-09-01', '23');
select * from assignment;

insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full', '161D26098', '2022-06-17', '30');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full', '172W33821', '2022-04-13','29');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full', '181KK3257', '2022-05-03', '27');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'repair', '192W19054', '2022-07-06', '26');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full', '201W2267', '2022-01-28', '23');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full', '212KK4862', '2022-03-15', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '221W9876', '2022-11-26', '30');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full', '162C2865', '2022-02-08', '29');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full', '171OY6258', '2022-03-21', '27');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full', '182C28214', '2022-02-06', '26');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'mid-year', '191W22763', '2022-04-10', '23');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '202W11864', '2022-02-11', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'full',  '211KK9078', '2022-05-08', '30');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full',  '221D48662', '2022-05-01', '29');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full', '162KK7927', '2022-11-01', '27');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (4, 'full', '171W214',  '2022-02-24', '26');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '182KK579', '2022-05-22', '23');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (3, 'mid-year', '191C4408', '2022-01-19', '22');
insert into assignment (hours, task, carReg, serviceDate, employeeId) values (2, 'mid-year', '202D52193', '2022-05-25', '23');
select * from assignment;

insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-06-17', '10:00:00', '161D26098');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-04-13', '12:00:00', '172W33821');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-05-03', '14:00:00', '181KK3257');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('repair', '2022-07-06', '10:00:00', '192W19054');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-01-28', '10:00:00', '201W2267');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-03-15', '12:00:00', '212KK4862');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-11-26', '14:00:00', '221W9876');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-02-08', '16:00:00', '162C2865');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-03-21', '16:00:00', '171OY6258');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-02-06', '10:00:00', '182C28214');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-04-10', '08:00:00', '191W22763');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-02-11', '16:00:00', '202W11864');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-05-08', '08:00:00', '211KK9078');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-05-01', '14:00:00', '221D48662');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-11-01', '10:00:00', '162KK7927');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-02-24', '10:00:00', '171W214');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-05-22', '14:00:00', '182KK579');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('full', '2022-01-19', '08:00:00', '191C4408');
insert into Service (serviceType, serviceDate, serviceTime, carReg) values ('mid-year', '2022-05-25', '08:00:00', '202D52193');







