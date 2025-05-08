-- Create the module table
CREATE TABLE module
(
  mod_code VARCHAR(10) PRIMARY KEY,
  mod_name VARCHAR(100) NOT NULL,
  credit_unit INTEGER NOT NULL,
  mod_coord CHAR(4) NULL,
  CONSTRAINT mod_mod_coord_fk FOREIGN KEY (mod_coord) REFERENCES staff (staff_no)
);

-- Insert data into the module table
-- There are 14 records, but the last one cannot be inserted. Why?
-- The constraint references the nonexistent staff with staff_no S016

-- Remove the last line so you will only insert the first 13 records.
INSERT INTO module (mod_code, mod_name, credit_unit, mod_coord)
VALUES
  ('AIP', 'Accounting Informatics Project', 4, 'S018'),
  ('AIS', 'Accounting Information System', 4, 'S019'),
  ('BUAE', 'Business Analysis Using Excel', 3, 'S019'),
  ('CRM', 'Customer Relationship Management', 3, 'S019'),
  ('DBMS', 'Database Management System', 5, 'S020'),
  ('DM', 'Data Mining', 4, 'S018'),
  ('ITOS', 'IT and Office Software', 4, 'S018'),
  ('JPRG', 'Java Programming', 8, 'S017'),
  ('NETF', 'Network Fundamentals', 3, 'S017'),
  ('PM', 'Project Management', 3, 'S018'),
  ('SAD', 'Software Application Development', 8, 'S020'),
  ('SDT', 'Software Development Technique', 5, 'S019'),
  ('WCD', 'Web Client Development', 4, 'S018');
  -- ('FOC', 'Fundamentals of Computing', 4, 'S016');
  
