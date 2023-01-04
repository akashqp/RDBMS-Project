CREATE TABLE reservation_status (
  id INT,
  status_value VARCHAR (50),
  CONSTRAINT pk_res_status PRIMARY KEY (id)
);

CREATE TABLE category (
  id INT,
  category_name VARCHAR (100),
  CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE book (
  id INT,
  title VARCHAR (500),
  category_id INT,
  publication_date DATE,
  copies_owned INT,
  CONSTRAINT pk_book PRIMARY KEY (id),
  CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE author (
  id INT,
  first_name VARCHAR (300),
  last_name VARCHAR (300),
  CONSTRAINT pk_author PRIMARY KEY (id)
);

CREATE TABLE book_author (
  book_id INT,
  author_id INT,
  CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE member_status (
  id INT,
  status_value VARCHAR (50),
  CONSTRAINT pk_memberstatus PRIMARY KEY (id),
);

CREATE TABLE member (
  id INT,
  first_name VARCHAR (300),
  last_name VARCHAR (300),
  joined_date DATE,
  active_status_id INT,
  CONSTRAINT pk_member PRIMARY KEY (id),
  CONSTRAINT fk_member_status FOREIGN KEY (active_status_id) REFERENCES member_status(id)
);

CREATE TABLE reservation (
  id INT,
  book_id INT,
  member_id INT,
  reservation_date DATE,
  reservation_status_id INT,
  CONSTRAINT pk_reservation PRIMARY KEY (id),
  CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_res_member FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE fine_payment (
  id INT,
  member_id INT,
  payment_date DATE,
  payment_amount INT,
  CONSTRAINT pk_fine_payment PRIMARY KEY (id),
  CONSTRAINT fk_finepay_member FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE loan (
  id INT,
  book_id INT,
  member_id INT,
  loan_date DATE,
  returned_date DATE,
  CONSTRAINT pk_loan PRIMARY KEY (id),
  CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE fine (
  id INT,
  book_id INT,
  loan_id INT,
  fine_date DATE,
  fine_amount INT,
  CONSTRAINT pk_fine PRIMARY KEY (id),
  CONSTRAINT fk_fine_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES loan(id)
);






CREATE TABLE Employee(
Emp_ID INT(6),
Emp_Name Varchar(20),
Designation Varchar(20),
Department Varchar(20),
Salary INT,
CONSTRAINT pk_employee Primary Key (Emp_ID));

Insert into Employee Values(

);

CREATE TABLE Location(
Emp_ID INT(6),
Emp_Location Varchar(20),
DOJ Date,
CONSTRAINT fk_location_employee Foreign Key(Emp_ID) References Employee(Emp_ID));

CREATE TABLE Branch(
Emp_ID INT(6),
Branch Varchar(20),
Years_Of_Exp Decimal(3,1),
CONSTRAINT fk_branch_employee Foreign Key(Emp_ID) References Employee(Emp_ID));


CREATE TABLE Emp_Details as
Select Employee.Emp_ID, Emp_Name, Designation, Department, Emp_Location, Branch, Salary from 
Employee INNER JOIN Location ON Employee.Emp_ID = Location.Emp_ID
INNER JOIN Branch ON Employee.Emp_ID = Branch.Emp_ID
GROUP BY Employee.Emp_ID;

Select * from Emp_Details 
where Department = "Analytics" and
Emp_Location = "Bangalore" and 
Salary > 550000;