-- Q1
SELECT s.staff_name, sd.dependent_name, sd.relationship
FROM staff s JOIN staff_dependent sd
ON s.staff_no = sd.staff_no;

-- Q2
SELECT 
	d.dept_name, 
	c.crse_name as "Course Name",
	c.crse_fee + COALESCE(c.lab_fee, 0) as "Total Semester Fee"
FROM department d JOIN course c
ON d.dept_code = c.offered_by
ORDER BY dept_name ASC, "Total Semester Fee" DESC;

-- Q3
SELECT 
	m.mod_name as "Module Name",
	prm.mod_name as "Pre-Requisite ModuleName"
FROM module m 
JOIN pre_requisite pr ON m.mod_code = pr.mod_code
JOIN module prm ON pr.requisite = prm.mod_code
ORDER BY "Module Name" ASC, "Pre-Requisite ModuleName" ASC;

-- Q4
SELECT
	d.dept_name, c.crse_name, s.stud_name,
	EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM dob) as "Age of Student"
FROM department d
JOIN course c ON d.dept_code = c.offered_by
JOIN student s ON s.crse_code = c.crse_code
ORDER BY dept_name ASC, crse_name ASC,"Age of Student" DESC;

-- Q5
SELECT s.staff_name, su.staff_name as "Supervisor"
FROM staff s
JOIN staff su ON s.supervisor_staff_no = su.staff_no
ORDER BY "Supervisor" ASC;

-- Q6
SELECT d.dept_name, COUNT(*) as "number of staff"
FROM department d
JOIN staff s ON d.dept_code = s.dept_code
GROUP BY d.dept_name
ORDER BY "number of staff" DESC;


	
















