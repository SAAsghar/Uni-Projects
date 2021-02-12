#SECTION 1
#Task 1
Create table VillaType(
VillaTypeID char(4),
VillaTypeName varchar(50),
Primary key (VillaTypeID)
);

Create table Villa(
VillaID char(4),
VillaName varchar (32),
VillaCostPerDay decimal(5, 2),
VillaTypeID char (4),
Primary key (VillaID),
foreign key(VillaTypeID) references VillaType(VillaTypeID));

Create table Customer(
CustomerID char(4),
CustomerName varchar(50),
CustomerPhNum char (10),
Primary key (CustomerID)
);

Create table Reservation(
ReservationID char(4),
ReservationDate date,
CustomerID char (4),
Primary key (ReservationID),
Foreign key (CustomerID) references Customer(CustomerID)
);

Create table VillaReservation(
ReservationID char(4),
DateFrom date,
DateTo date,
VillaID char (4),
Primary key (ReservationID, VillaID),
Foreign key (VillaID) references Villa(VillaID),
Foreign key (ReservationID) references Reservation(ReservationID)
);

Create table Payment(
PaymentID char(4),
PaymentDate date,
PaymentAmount decimal (6,2),
ReservationID char (4),
Primary key (PaymentID),
Foreign key (ReservationID) references Reservation(ReservationID)
);

Insert into VillaType values ('B1', 'Beachside');
Insert into VillaType values ('L21', 'Luxury');
Insert into VillaType values ('B16', 'two-bedroom');
insert into VillaType values ('B39', 'two-bedroom');
Insert into VillaType values ('B43', 'three-bedroom');
Insert into VillaType values ('B26', 'one-bedroom');

Insert into Villa values ('V82', 'Beachside Room 23', '464.00', 'B1');
Insert into Villa values ('S31', 'Luxury Suite 3', '2495.00', 'L21');
Insert into Villa values ('R76', 'Motel Room 38', '156.00', 'B16');
Insert into Villa Values ('M82', 'Motel Room 29', '196.00', 'B39');
Insert into Villa values ('C3', 'Water Cabin 24', '1160.00', 'B43');
Insert into Villa values ('B5', 'Bungalow 26', '319.00', 'B26');

Insert into Customer values('C380', 'Jonathon Doe', '0429323783'),
							('C198', 'Samantha Bucket', '0424738582'),
							('C940', 'Benjamin Ho', '0424738659'), 
							('C300', 'Felix Cupid', '0423856749'), 
							('C420', 'Kevin Bento', '0424736547'),
                            ('C870', 'Bob Marley', '0423474585');
                            
Insert into Reservation values ('R84', '2021-03-04', 'C380');
Insert into Reservation values ('R98', '2021-04-28', 'C198');
Insert into Reservation values ('R80', '2021-08-12', 'C940');
Insert into Reservation values ('R28', '2020-11-05', 'C300');
Insert into Reservation values ('R36', '2021-06-16', 'C420');
Insert into Reservation values ('R37', '202-04-12', 'C870');

Insert into VillaReservation values ('R84', '2021-03-04', '2021-03-08', 'V82');
Insert into VillaReservation values ('R98', '2021-04-28', '2021-05-02', 'S31');
Insert into VillaReservation values ('R80', '2021-08-12', '2021-08-22', 'R76');
Insert into VillaReservation values ('R28', '2020-11-05', '2020-11-30', 'M82');
Insert into VillaReservation values ('R36', '2021-06-16', '2021-06-19', 'C3');
insert into VillaReservation values ('R37', '2020-04-12', '2020-04-25', 'B5');

Insert into Payment values ('P89', '2021-03-09', '393.38', 'R84'),
						   ('P48', '2021-05-03', '219.34', 'R98'),
						   ('P83', '2021-11-28', '2738.89', 'R80'),
						   ('P37', '2021-02-18', '1933.83', 'R28'), 
						   ('P29', '2021-06-20', '189.83', 'R36');

#Task 2
select VillaID, VillaName, concat('$', VillaCostPerDay) from Villa
order by VillaCostPerDay desc;

#Task 3
select VillaID, DateFrom, DateTo, datediff(DateTo, DateFrom) 'Number of days reserved for'
from VillaReservation;

#Task 4
Select Name, Cost from Villa
Where VillaTypeName = 'two-bedroom';

#Task 5
Select distinct ReservationID, ReservationDate, PaymentDate from Reservation, Payment
Where datediff (ReservationDate,PaymentDate) <= 5;

#Task 6
select CustomerID, CustomerName, CustomerPhNum from Customer
where CustomerID > 2 and 
(select ReservationDate from Reservation
	where datediff(currdate, ReservationDate) <= 180
order by ReservationDate);

#Task 7
Select c.CustomerID, c.CustomerName, c.CustomerPhNum, r.ReservationDate from Customer c, Reservation r
Where datediff (2020-10-11, ReservationDate) <= 180;

#Task 8
Select distinct CustomerName, VillaCostPerDay from Customer, Villa
where VillaCostPerDay < 1000;

#Task 9
Select PaymentAmount from Payment
Order by PaymentAmount desc;

#Task 10
select DateFrom, count(VillaID), ReservationID from VillaReservation
where count(VillaID) >= 1
group by ReservationID;

#Task 11
select * from VillaReservation
where count(VillaID) = 0
group by ReservationID;

#Task 12
select * from Payment
where PaymentAmount >= 1500 and PaymentDate between '2018' and '2020'
order by PaymentAmount desc;

#Task 13
select *, VillaTypeName, CustomerName from Payment, Villa, Customer
where VillaTypeName = 'one-bedroom' and CustomerName = '_J%';

create table Activity (
ActivityID char(3),
ActivityName varchar(50),
ActivityCost decimal (5, 2),
ActivityType char (1),
Primary Key (ActivityID)
);

create table Staff (
StaffID char(3),
StaffName varchar(50),
ManagerID char(3),
Primary key (StaffID),
foreign key (ManagerID) references Staff(StaffID)
);

create table ActivityBooking(
ActivityTime TIME,
NumPeople varchar(1),
ActivityID char(3),
ReservationID char(4),
GuideID char(3),
primary key (ActivityID, ReservationID, ActivityTime),
foreign key (activityID) references Activity(ActivityID),
foreign key (ReservationID) references Reservation(ReservationID),
foreign key (GuideID) references Staff(StaffID)
);

insert into Activity values ('A45', 'Rock climbing', '250.00', 'B');
insert into Activity values ('A78', 'Kayaking', '420.00', 'O');
insert into Activity values ('A34', 'Fencing', '120.00', 'I');
insert into Activity values ('A35', 'Dancing', '60.00', 'B');
insert into Activity values ('A36', 'Skydiving', '350.00', 'O');

insert into Staff values ('02', 'Vanessa Hodge', '02');
insert into Staff values('45', 'Ben Club', '43');
insert into Staff values('43', 'Kevin Spencer', '43');
insert into Staff values('86', 'Fido Fib', '02');
insert into Staff values ('39', 'Liam Lockswell', '02');

insert into ActivityBooking values ('12:30:00', '4', 'A45', 'R84', '02');
insert into ActivityBooking values ('13:00:00', '6', 'A78', 'R98', '45');
insert into ActivityBooking values ('12:45:00', '4', 'A34', 'R80', '43');
insert into ActivityBooking values ('20:00:00', '5', 'A35', 'R28', '86');
insert into ActivityBooking values ('15:05:00', '6', 'A36', 'R36', '39');

#assuming guides are support staff

#SECTION 2
#Task 14
select ReservationID, DateFrom, DateTo, VillaCostPerDay from VillaReservation, Villa
where (Day(DateFrom) - Day(DateTo) * VillaCostPerDay) >= '10000'
order by VillaCostPerDay desc;

#Task 15
select CustomerName, ActivityType, ActivityCost from Activity, Customer
where ActivityType = 'O' or ActivityType = 'B' and ActivityCost <= sum(ActivityCost)/5;

create table SupportStaff (
RosterID char(3),
HoursNeeded char (3),
ActivityID char (4),
ReservationID char (4), 
ActivityTime Time,
StaffID char (3),
primary key (RosterID),
foreign key (StaffID) references Staff(StaffID),
foreign key (ActivityID, ReservationID, ActivityTime) references ActivityBooking(ActivityID, ReservationID, ActivityTime)
);

#assuming support staff are also guides

insert into SupportStaff values ('02', '12', 'A45', 'R84', '12:30:00', '02');
insert into SupportStaff values ('02', '20', 'A78', 'R98', '13:00:00', '45');
insert into SupportStaff values ('05', '25', 'A34', 'R80', '12:45:00', '43');
insert into SupportStaff values ('06', '32', 'A35', 'R28', '20:00:00', '86');
insert into SupportStaff values ('05', '20', 'A46', 'R36', '15:05:00', '39');

#SECTION 3
#Task 16
select ReservationID, CustomerName, ActivityTime, GuideID, StaffName, StaffID, ManagerID from ActivityBooking, Customer, Staff
where ActivityTime between '12:00:00' and '16:00:00'
and StaffID = ManagerID;

#Task 17
select StaffName, StaffID, ManagerID from Staff
where StaffID = ManagerID
group by ManagerID having count(*) >= 2;

Create Table Package (
PackageActvitiyID char (3),
ChildActivityID char(3),
primary key (PackageActivityID, ChildActivityID),
foreign key (PackageActivityID, ChildActivityID) references Activity(ActivityID)
); 

insert into Package values ('P07', 'A45');
insert into Package values ('P08', 'A78');
insert into Package values ('P09', 'A34');
insert into Package values ('P10', 'A35');
insert into Package values ('P11', 'A36');

#SECTION 4
#Task 18
select ActivityID, ReservationID, ActivityTime, ActivityName, StaffID, GuideID, StaffName RosterID from ActivityBooking, Activity, Staff, SupportStaff
where StaffID = RosterID and StaffID = GuideID;

#Task 19
select PackageActivityID, Child ActivityID, ActivityID, ActivityCost, ActivityName from Package, Activity
order by ActivityCost;

#Task 20
select ReservationID, NumPeople, ActivityCost 'Activity Cost' from ActivityBooking
where NumPeople * ActivityCost and (
	select VillaID, VillaCostPerDay ' Villa Cost', DateFrom, DateTo, datediff(DateTo, DateFrom) 'Number of days reserved for' from VillaReservation, Villa
	where VillaCostPerDay * datediff(DateTo, DateFrom) is not null);