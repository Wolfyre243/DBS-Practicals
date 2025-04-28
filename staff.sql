-- Insert statements to populate Staff Relation.

INSERT INTO staff
VALUES 
   ('S001', 'Anita', 'T002', '1950-01-21', 'L1', 'M', 7070, 1000, NULL, 'F', 'Singapore', '1996', 'SOC', 'FT', 'Phd', 'Director'),
   ('S002', 'Apple', 'S001', '1952-08-30', 'L1', 'S', 6660, 700, NULL, 'F', 'Korea', '1980', 'SOC', 'FT', 'BSc', 'Deputy Director'),
   ('S003', 'Charles', 'S001', '1954-11-05', 'L2', 'M', 5890, 600, NULL, 'M', 'Malaysia', '1990', 'SOC', 'FT', 'BComp', 'Deputy Director'),
   ('S004', 'Dawn', 'S002', '1956-02-21', 'L2', 'S', 5200, 200, NULL, 'F', 'Singapore', '1982', 'SOC', 'FT', 'MTech', 'Section Head'),
   ('S005', 'Edison', 'S002', '1958-08-06', 'L3', 'W', 4970, 100, NULL, 'M', 'Taiwan', '1988', 'SOC', 'FT', 'MBA', 'Section Head'),
   ('S006', 'Fann', 'T002', '1960-09-18', 'L1', 'M', 7600, 900, NULL, 'F', 'Malaysia', '1978', 'SB', 'FT', 'ACA', 'Director'),
   ('S007', 'Gideon', 'S006', '1962-10-10', 'L2', 'M', 6000, 600, NULL, 'M', 'Malaysia', '1995', 'SB', 'FT', 'MPA', 'Deputy Director'),
   ('S008', 'Lionel', 'S007', '1968-01-19', 'L3', 'M', 5100, 100, NULL, 'M', 'Singapore', '1989', 'SB', 'FT', 'CFA', 'Section Head'),
   ('S009', 'Lee', 'S008', '1965-01-26', 'L5A', 'S', NULL, NULL, 120, 'F', 'India', '1997', 'SB', 'PT', 'CPA', 'Lecturer'),
   ('S010', 'Jason', 'S008', '1968-11-30', 'L5', 'M', NULL, NULL, 100, 'M', 'China', '1999', 'SB', 'PT', 'BBA', 'Lecturer'),
   ('S011', 'Andy', 'S007', '1970-11-08', 'L3', 'M', 5340, 150, NULL, 'M', 'Thailand', '2000', 'SB', 'FT', 'BA', 'Section Head'),
   ('S012', 'Edwin', 'S011', '1975-09-09', 'L4', 'M', 4950, NULL, NULL, 'M', 'Hong Kong', '2001', 'SB', 'FT', 'MA', 'Lecturer'),
   ('S017', 'Titus', 'S004', '1960-03-19', 'L4A', 'S', 2000, NULL, NULL, 'M', 'Singapore', '1985', 'SOC', 'FT', 'MBIT', 'Lecturer'),
   ('S018', 'Derrick', 'S005', '1971-09-05', 'L5A', 'S', 3000, NULL, NULL, 'M', 'Singapore', '2007', 'SOC', 'FT', 'MCM', 'Senior Lecturer'),
   ('S019', 'Eleanor', 'S004', '1965-01-01', 'L4', 'S', NULL, NULL, 120, 'F', 'China', '2008', 'SOC', 'PT', 'BSE', 'Lecturer'),
   ('S020', 'Florence', 'S005', '1968-01-01', 'L4', 'S', NULL, NULL, 100, 'F', 'China', '2008', 'SOC', 'PT', 'BDM', 'Lecturer'),
   ('T001', 'Bruce', NULL, '1960-05-15', 'SSD', 'S', 9000, 2000, NULL, 'M', 'Singapore', '2008', 'PO', 'FT', 'BComp', 'Principal'),
   ('T002', 'Ruth', 'T001', '1949-07-25', 'SSE', 'M', 8500, 1500, NULL, 'F', 'Singapore', '1974', 'DPO', 'FT', 'BSc', 'Deputy Principal');
