-- Create the staff_dependent table
CREATE TABLE staff_dependent
(
  staff_no CHAR(4),
  dependent_Name VARCHAR(30),
  relationship VARCHAR(20) NOT NULL,
  PRIMARY KEY (staff_no, dependent_name),
  CONSTRAINT staff_dependent_staff_no_fk FOREIGN KEY (staff_no) REFERENCES staff (staff_no)
);


-- Insert data into the staff_dependent table
-- 19 records
INSERT INTO staff_dependent (staff_no, dependent_name, relationship)
VALUES
  ('S003', 'Yan Chin', 'Daughter'),
  ('S003', 'Xiu Mei', 'Wife'),
  ('S003', 'Yang Xi', 'Son'),
  ('S004', 'Min Li', 'Wife'),
  ('S005', 'Candice', 'Wife'),
  ('S005', 'Mei Mei', 'Daughter'),
  ('S005', 'Pamela', 'Daughter'),
  ('S007', 'Judith', 'Wife'),
  ('S008', 'Nelson', 'Son'),
  ('S010', 'Felicia', 'Wife'),
  ('S010', 'Jamie', 'Daughter'),
  ('S010', 'Janet', 'Daughter'),
  ('S010', 'Janny', 'Daughter'),
  ('S010', 'Jerome', 'Son'),
  ('S010', 'Judith', 'Daughter'),
  ('S011', 'Jamie', 'Wife'),
  ('S012', 'Mark', 'Son'),
  ('S012', 'Shyna', 'Wife'),
  ('T002', 'Mike', 'Husband');
