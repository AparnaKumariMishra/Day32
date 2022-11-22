--UC1
CREATE DATABASE Payroll_Servicesss;
use Payroll_Servicesss;

--UC2
CREATE TABLE Employee_Payroll
(
EmployeeId INT IDENTITY(1,1),
EmployeeName VARCHAR(20),
Salary MONEY,
StartDate DATE
);
SELECT * from Employee_Payroll;

--UC3
INSERT INTO Employee_Payroll(EmployeeName,Salary,StartDate) VALUES
('Aparna',900000,'2022/12/18'),
('jon',800000,'2023/01/25'),
('Terrisa',700000,'2021/03/16');

--UC4
SELECT * from Employee_Payroll;

--UC5
SELECT Salary FROM Employee_Payroll WHERE EmployeeName = 'Aparna';
SELECT * from Employee_Payroll WHERE StartDate BETWEEN CAST('2019/01/24' AS DATE) AND GETDATE();

--UC6
ALTER TABLE Employee_Payroll ADD Gender CHAR(1);
UPDATE Employee_Payroll SET Gender='F' WHERE EmployeeName='Zara';
UPDATE Employee_Payroll SET Gender='F' WHERE EmployeeName='Terrisa';
UPDATE Employee_Payroll SET Gender='M' WHERE EmployeeName='jon';

--UC7
SELECT SUM(Salary) FROM Employee_Payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT AVG(Salary) FROM Employee_Payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT MIN(Salary) FROM Employee_Payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT MAX(Salary) FROM Employee_Payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT COUNT(Salary) FROM Employee_Payroll WHERE Gender = 'F' GROUP BY Gender;


--UC8
ALTER TABLE Employee_Payroll ADD EmployeePhoneNumber varchar(255)
ALTER TABLE Employee_Payroll ADD EmployeeAddress varchar(255) Not Null Default 'Banglore'
ALTER TABLE Employee_Payroll ADD Department varchar(255)

--UC9
ALTER TABLE Employee_Payroll ADD BasicPay float
ALTER TABLE Employee_Payroll ADD Deductions float
ALTER TABLE Employee_Payroll ADD TaxablePay float
ALTER TABLE Employee_Payroll ADD Tax float
ALTER TABLE Employee_Payroll ADD NetPay float

UPDATE Employee_Payroll SET EmployeePhoneNumber='123456789',Department='Sales',BasicPay=200,Deductions=100,TaxablePay=250,Tax=50,NetPay=1000 WHERE EmployeeId=1
UPDATE Employee_Payroll SET EmployeePhoneNumber='987654321',Department='HR',BasicPay=300,Deductions=200,TaxablePay=350,Tax=50,NetPay=2000 WHERE EmployeeId=2
UPDATE Employee_Payroll SET EmployeePhoneNumber='741852963',Department='Marketing',BasicPay=400,Deductions=300,TaxablePay=450,Tax=50,NetPay=3000 WHERE EmployeeId=3
UPDATE Employee_Payroll SET EmployeePhoneNumber='987654321',Department='HR',BasicPay=300,Deductions=200,TaxablePay=350,Tax=50,NetPay=2000 WHERE EmployeeId=4
UPDATE Employee_Payroll SET EmployeePhoneNumber='741852963',Department='Marketing',BasicPay=400,Deductions=300,TaxablePay=450,Tax=50,NetPay=3000 WHERE EmployeeId=5
UPDATE Employee_Payroll SET EmployeeAddress='Noida' WHERE EmployeeId=1
UPDATE Employee_Payroll SET EmployeeAddress='Pune' WHERE EmployeeId=2
SELECT * from Employee_Payroll;

--UC10
INSERT INTO Employee_Payroll VALUES('Joey',850000,'2022/08/12','M','963852741','Deccan','Finance',200,100,250,50,1000)
INSERT INTO Employee_Payroll VALUES('Terrisa',900000,'2021/03/10','F','789654123','Hyderabad','Sales',300,200,350,50,2000)

