-- Create the pre_requisite table
CREATE TABLE pre_requisite
(
  mod_code VARCHAR(10),
  requisite VARCHAR(10),
  PRIMARY KEY (mod_code, requisite),
  CONSTRAINT pre_requisite_mod_code_fk FOREIGN KEY (mod_code) REFERENCES module (mod_code),
  CONSTRAINT pre_requisite_requisite_fk FOREIGN KEY (requisite) REFERENCES module (mod_code)
);

-- Insert data into the pre_requisite table
-- 11 records
INSERT INTO pre_requisite (mod_code, requisite)
VALUES 
('AIP', 'AIS'),
('AIS', 'DBMS'),
('AIS', 'JPRG'),
('AIS', 'SDT'),
('CRM', 'DBMS'),
('DM', 'DBMS'),
('SAD', 'JPRG'),
('SAD', 'NETF'),
('SAD', 'SDT'),
('SAD', 'WCD'),
('SDT', 'DBMS');
