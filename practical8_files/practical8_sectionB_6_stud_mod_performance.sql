CREATE TABLE stud_mod_performance
(
  adm_no           char(4),
  mod_registered   varchar(10),
  mark             integer,
  grade            char(2),
  PRIMARY KEY (adm_no, mod_registered),
  FOREIGN KEY (adm_no) REFERENCES student (adm_no),
  FOREIGN KEY (mod_registered) REFERENCES module (mod_code)
);

-- insert
-- 41 records

-- DFI
INSERT INTO stud_mod_performance VALUES
('A012', 'AIP', 70, 'C+'),
('A012', 'AIS', 81, 'A'),
('A012', 'BUAE', 66, 'C+');

INSERT INTO stud_mod_performance VALUES
('A011', 'AIP', 60, 'C'),
('A011', 'AIS', 41, 'F'),
('A011', 'BUAE', 36, 'F');

INSERT INTO stud_mod_performance VALUES
('A010', 'AIP', 86, 'A'),
('A010', 'AIS', 81, 'A'),
('A010', 'BUAE', 96, 'AD');

-- DCS
INSERT INTO stud_mod_performance VALUES
('A009', 'SDT', 81, 'A'),
('A009', 'NETF', 68, 'C+'),
('A009', 'SAD', 74, 'B');

INSERT INTO stud_mod_performance VALUES
('A008', 'SDT', 11, 'F'),
('A008', 'NETF', 58, 'D+'),
('A008', 'SAD', 64, 'C');

-- DIT
INSERT INTO stud_mod_performance VALUES
('A007', 'PM', 77, 'B+'),
('A007', 'WCD', 78, 'F'),
('A007', 'DBMS', 88, 'A'),
('A007', 'JPRG', 84, 'A'),
('A006', 'PM', 57, 'D+'),
('A006', 'WCD', 61, 'C'),
('A006', 'DBMS', 60, 'C'),
('A006', 'JPRG', 70, 'B'),
('A005', 'PM', 58, 'D+'),
('A005', 'WCD', 64, 'C'),
('A005', 'DBMS', 64, 'C'),
('A005', 'JPRG', 73, 'B'),
('A004', 'DBMS', 80, 'A'),
('A004', 'JPRG', 88, 'A'),
('A004', 'NETF', 73, 'B'),
('A001', 'DBMS', 72, 'B'),
('A001', 'JPRG', 78, 'B+'),
('A001', 'NETF', 87, 'A'),

-- DBIT
('A002', 'DBMS', 72, 'B'),
('A002', 'JPRG', 78, 'B+'),
('A002', 'WCD', 83, 'A'),
('A002', 'SAD', 87, 'A');

SELECT * FROM stud_mod_performance;
