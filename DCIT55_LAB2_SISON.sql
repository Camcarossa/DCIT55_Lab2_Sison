USE sisondb;

CREATE TABLE tblStudent(
	studentNumber INT (11) AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR (100),
    lastName VARCHAR (100) NOT NULL,
    middleName VARCHAR (100),
    birthdate VARCHAR (20),
    citizenship VARCHAR (50) COMMENT "Example: Filipino, Nigerian, Korean",
    gender VARCHAR (100) COMMENT "Male or Female"
);

SHOW FULL COLUMNS FROM tblStudent;

INSERT INTO tblStudent VALUES
	(202014912, 'Steven',		 'Espedido',	 'Rosaldo',	 '2000-01-01', 'FILIPINO', 'MALE'),
    (202014165, 'Nina Klarisse', 'Ulangkaya',	 'Ambrosio', '2000-01-02', 'FILIPINO', 'FEMALE'),
    (202011535, 'Adrian',		 'Carranza',	 'Rubia',	 '2000-01-03', 'FILIPINO', 'MALE'),
    (202011818, 'Jean',			 'Dacles',		 'Rico',	 '2000-01-04', 'FILIPINO', 'FEMALE'),
    (202012336, 'Gillian Kyle',	 'Catahan',		 'Dimaala',	 '2000-01-05', 'FILIPINO', 'MALE');
    

ALTER TABLE tblStudent
    CHANGE gender sex VARCHAR(6),
    MODIFY birthdate DATE,
	MODIFY citizenship VARCHAR(20),
    ADD age INT(3) AFTER birthdate,
    RENAME studentInfo;

UPDATE studentInfo
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

-- Displays the first, last, and middle name into upper-case
SELECT 
	UPPER(firstName)	 AS 'First name',
    UPPER(lastName)		 AS 'Last name',
    UPPER(middleName)	 AS 'Middle name'
FROM studentInfo;

-- Displays all records, replacing "Filipino" to "Pinoy"
SELECT 
	studentNumber,
    firstName,
    lastName,
    middleName,
    birthdate,
    age,
	REPLACE(citizenship, 'FILIPINO', 'PINOY') AS citizenship,
    sex
FROM studentInfo;

-- Display two columns which includes Student Number and the Full Name
SELECT 
	studentNumber,
    CONCAT(firstName, ' ', middleName, ' ', lastName) AS 'Full Name'
FROM studentInfo;

-- Display the last name that is repeated five times
SELECT 
	REPEAT(lastName, 5) as 'Last name * 5'
FROM studentInfo;

-- Display the average age of the student using a numeric function
SELECT 
	AVG(age) AS 'Average Age'
FROM studentInfo;

-- Display all records and change the format for the birthdate using a date function 
SELECT 
	studentNumber,
    firstName,
    lastName,
    middleName,
    DATE_FORMAT(birthdate, '%d %M %Y'),
    citizenship,
    sex,
    age
FROM studentInfo;

-- Display the total number of male and femae using GROUP BY
SELECT
	sex,
    COUNT(*) AS Total
FROM studentInfo
GROUP BY sex;

-- Display all records alphabetically arranged by last name using ORDER BY
SELECT * FROM studentInfo
ORDER BY lastName ASC;