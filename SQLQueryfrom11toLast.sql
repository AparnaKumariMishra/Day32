--UC11
CREATE DATABASE Payroll_Servicesss2
USE Payroll_Servicesss2

--CompanyTable--
Create Table Company
(
CompanyId int primary key identity(1,1),
CompanyName varchar(255)
)
Insert Into Company Values('TCS')
Insert Into Company Values('Wipro')
Insert Into Company Values('Infosys')
select * from Company

--EmployeeTable--
Create Table Employee
(
EmployeeId int primary key identity(101,1),
CompanyId int references Company(CompanyId),
EmployeeName varchar(255),
Gender char(1),
PhoneNo bigint,
EmployeeAddress varchar(255),
StartDate DATE,
)
Insert Into Employee values(1,'Oggy','M',987654321,'Delhi','2021/12/08')
Insert Into Employee values(2,'Terrisa','F',123456789,'Noida','2021/08/12')
Insert Into Employee values(3,'Jack','M',741852963,'Banglore','2021/03/10')
select * from Employee

--DepartmentTable--
Create Table Department
(
DeptId int primary key identity(1001,1),
DeptName varchar(255)
)
Insert Into Department values('Sales')
Insert Into Department values('HR')
Insert Into Department values('Finance')
select * from Department

--PayrollTable--
Create Table Payroll
(
EmployeeId int references Employee(EmployeeId),
BasicPay float,
Deductions float,
TaxablePay float,
IncomeTax float,
NetPay float,
)
Insert Into Payroll values(101,100,10,120,10,1000)
Insert Into Payroll values(102,200,20,220,20,2000)
Insert Into Payroll values(103,300,30,320,30,3000)
select * from Payroll

--ThirdTableFromEmployeeAndDepartment--
Create Table EmployeeDepartment
(
EmployeeId int references Employee(EmployeeId),
DeptId int references Department(DeptId),
)
Insert Into EmployeeDepartment values(101,1001)
Insert Into EmployeeDepartment values(102,1002)
Insert Into EmployeeDepartment values(103,1003)
select * from EmployeeDepartment

select CompanyName,EmployeeName,Gender,PhoneNo,EmployeeAddress,StartDate,DeptName,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay 
from Company
INNER Join Employee ON Company.CompanyId=Employee.CompanyId
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId
INNER Join EmployeeDepartment ON EmployeeDepartment.EmployeeId=Employee.EmployeeId
INNER Join Department ON Department.DeptId=EmployeeDepartment.DeptId

--UC12--
--UC4_Redo--
select * from Company
INNER Join Employee ON Company.CompanyId=Employee.CompanyId
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId
INNER Join EmployeeDepartment ON EmployeeDepartment.EmployeeId=Employee.EmployeeId
INNER Join Department ON Department.DeptId=EmployeeDepartment.DeptId

--UC5_Redo--
SELECT CompanyName,EmployeeName,Gender,PhoneNo,EmployeeAddress,StartDate,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay 
From Company
INNER Join Employee ON Company.CompanyId=Employee.CompanyId AND StartDate BETWEEN CAST('2019/01/24' AS DATE) AND GETDATE()
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId

--UC7_Redo--
SELECT SUM(BasicPay) From Employee
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId GROUP BY Gender
SELECT AVG(BasicPay) From Employee
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId GROUP BY Gender
SELECT MIN(BasicPay) From Employee
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId GROUP BY Gender
SELECT MAX(BasicPay) From Employee
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId GROUP BY Gender
SELECT Count(BasicPay) From Employee
INNER Join Payroll ON Payroll.EmployeeId=Employee.EmployeeId GROUP BY Gender