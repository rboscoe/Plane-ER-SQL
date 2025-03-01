CREATE TABLE Employees (
ssn CHAR(11),
union_mem_no INT,
PRIMARY KEY (ssn));

CREATE TABLE Model (
model_no CHAR(11),
capacity INT,
weight REAL,
PRIMARY KEY (model_no));

-- Technician ISA subclass of Employees
CREATE TABLE Technician (
ssn CHAR(11),
name CHAR(20),
address CHAR(30),
phone_num CHAR(14),
PRIMARY KEY (ssn),
FOREIGN KEY (ssn) REFERENCES Employees ON DELETE CASCADE);



-- Traffic_control ISA subclass of Employees
CREATE TABLE Traffic_control (
	ssn CHAR(11),
	exam_date DATE,
	PRIMARY KEY (ssn),
	FOREIGN KEY (ssn) REFERENCES Employees ON DELETE CASCADE);

CREATE TABLE Test (
	FAA_no CHAR(11),
	name CHAR(20),
	score REAL,
	PRIMARY KEY (FAA_no));

CREATE TABLE Plane (
	reg_no CHAR(11),
	PRIMARY KEY(reg_no));

-- Expert is a relationship class (Technician/Model) many-to-many
CREATE TABLE Expert (
	ssn CHAR(11),
	model_no CHAR(11),
	PRIMARY KEY (ssn, model_no),
FOREIGN KEY (ssn) REFERENCES Technician ON DELETE CASCADE,
FOREIGN KEY (model_no) REFERENCES Model ON DELETE CASCADE);


-- Test_info is a relationship class (Test/Plane/Technician) many-to-many
CREATE TABLE Test_info (
	FAA_no CHAR(11),
	reg_no CHAR(11),
ssn CHAR(11),
	hours REAL,
	date DATE,
	score REAL,
	PRIMARY KEY (FAA_no, reg_no, ssn),
FOREIGN KEY (FAA_no) REFERENCES Test ON DELETE CASCADE,
FOREIGN KEY (reg_no) REFERENCES Plane ON DELETE CASCADE,
FOREIGN KEY (ssn) REFERENCES Technician ON DELETE CASCADE);

-- Plane_type is a relationship class (Plane/Model) one-to-many
CREATE TABLE Plane_type (
	reg_no CHAR(11),
	model_no CHAR(11),
	PRIMARY KEY (reg_no),
FOREIGN KEY (reg_no) REFERENCES Plane ON DELETE CASCADE,
FOREIGN KEY (model_no) REFERENCES Model ON DELETE CASCADE);
