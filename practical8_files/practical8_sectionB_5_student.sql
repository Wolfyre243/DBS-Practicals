-- Create the student table
-- Error: You will encounter an error due to the crse_code. Why?
-- Course code is VARCHAR(5) instead of 3 in the course table.

-- Amend the crse_code data type appropriately.
CREATE TABLE student
(
  adm_no char(4) PRIMARY KEY,
  stud_name varchar(30) NOT NULL,
  gender char(1) NOT NULL,
  address varchar(100) NOT NULL,
  mobile_phone char(8) NULL,
  home_phone char(8) NULL,
  dob date NOT NULL,
  nationality varchar(30) NOT NULL,
  crse_code varchar(5) NOT NULL,
  CONSTRAINT student_nationality_fk FOREIGN KEY (nationality) REFERENCES country(country_name),
  CONSTRAINT student_crse_code_fk FOREIGN KEY (crse_code) REFERENCES course(crse_code)
);

-- Insert data into the student table
-- 11 records
INSERT INTO student (adm_no, stud_name, gender, address, mobile_phone, home_phone, dob, nationality, crse_code)
VALUES
  ('A001', 'Janice', 'F', '127 Clementi Ave 4', NULL, '61112211', '2005-12-11', 'Singapore', 'DIT'),
  ('A002', 'Anita', 'F', '326-C Peck Sia Street', '91123321', '64785623', '2004-07-16', 'Malaysia', 'DBIT'),
  ('A004', 'Mike', 'M', '79 Clementi South', '95566003', '63355990', '2004-07-10', 'China', 'DIT'),
  ('A005', 'Heidi', 'F', '88-A Yi Soon Road', NULL, '65577111', '2005-02-26', 'Malaysia', 'DAAA'),
  ('A006', 'Keith', 'M', '239 South Bridge Road', NULL, '64689002', '2005-08-19', 'India', 'DAAA'),
  ('A007', 'Adeline', 'F', '114 Toa Payoh North', '95556600', '62221155', '2004-09-24', 'Singapore', 'DAAA'),
  ('A008', 'Peter', 'M', '66 Tanglin Ave 3', '96343477', '65432122', '2004-10-30', 'Singapore', 'DCS'),
  ('A009', 'Peter', 'M', '53 Dover West', NULL, '66312254', '2004-09-20', 'Malaysia', 'DCS'),
  ('A010', 'Derrick', 'M', '4 Boon Lay Way', '89098889', '64457890', '2005-09-08', 'Korea', 'DFI'),
  ('A011', 'Joshua', 'M', '67 Yew Tee Road', NULL, '62089578', '2005-07-06', 'Hong Kong', 'DFI'),
  ('A012', 'Denise', 'F', '3 Sixth Avenue', '81897685', '67893467', '2005-12-11', 'Thailand', 'DFI');

