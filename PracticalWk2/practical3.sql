-- Section A
-- Q1
INSERT INTO public.course
VALUES
('DBA', 'Diploma in Business Administration', 'SB', 500.00, NULL), 
('DFI', 'Diploma in Financial Informatics', 'SB', 800.00, NULL); 

-- Q2
INSERT INTO public.course
VALUES
('DBIT', 'Diploma in Busineess and Information Technology', 'SOC', 700.00, 100.00), 
('DIT', 'Diploma in Information Technology', 'SOC', 650.00, 450.00), 
('DCS', 'Diploma in Cybersecurity', 'SOC', 900.00, 300.00), 
('DAAA', 'Diploma in Applied AI and Analytics', 'SOC', 1000.00, 900.00);

-- Section B
INSERT INTO public.department
VALUES
('SOC', 'School of Computing', 'S001', 82, 92, 90000.00, 45000.00, '2009-04-01'),
('DPO', 'Deputy Principal''s Office', 'T002', 3, 3, 6000.00, NULL, NULL),
('PO', 'Principal''s Office', 'T001', 4, 4, 7500.00, NULL, '2008-01-01'),
('SB', 'School of Business', 'S006', 86, 0, 80000.00, 88000.00, '1996-10-01');

-- Section D
SELECT * INTO public.staff_backup
FROM public.staff;

-- Section E
-- Q1
UPDATE public.staff
SET pay = pay * 1.05;

-- Q2
UPDATE public.staff
SET 
	pay = pay - 50.00,
	allowance = allowance * 1.10;

-- Q3
UPDATE public.staff
SET
	pay = pay + 100.00
WHERE
	gender = 'M' AND
	join_yr < 1996 AND
	type_of_employment = 'FT';

-- Section F
-- Q1
DELETE FROM public.staff
WHERE staff_no = 'T001';

-- Q2
DELETE FROM public.staff;

INSERT INTO public.staff
SELECT * FROM public.staff_backup;