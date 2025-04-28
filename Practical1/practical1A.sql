-- Section A
CREATE TYPE gender AS ENUM ('M', 'F');
CREATE TYPE marital_status AS ENUM ('M', 'S');
CREATE TYPE employment_type AS ENUM ('FT', 'PT');

CREATE TABLE staff (
    staff_no VARCHAR(4) PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    supervisor_staff_no VARCHAR(4),
    dept_code VARCHAR(5) NOT NULL,
    designation VARCHAR(20) NOT NULL,
    gender gender NOT NULL,
    marital_status marital_status NOT NULL,
    dob DATE NOT NULL,
    employment_type employment_type NOT NULL,
    highest_qln TEXT NOT NULL,
    citizenship VARCHAR(10) NOT NULL,
    grade VARCHAR(5) NOT NULL,
    year_joined INTEGER NOT NULL,
    pay DECIMAL(7, 2) NOT NULL,
    allowance DECIMAL(7, 2) NOT NULL,
    hourly_rate DECIMAL(7, 2) NOT NULL
)

CREATE TABLE course (
    crse_code VARCHAR(5) NOT NULL,
    crse_name VARCHAR(100) NOT NULL
    offered_by VARCHAR(5) NOT NULL,
    crse_fee DECIMAL(7,2) NOT NULL,
    lab_fee DECIMAL(7,2) NULL,
)

CREATE TABLE department (
    dept_code VARCHAR(5) NOT NULL,
    dept_name VARCHAR(100) NOT NULL,
    hod char(4) NOT NULL,
    no_of_staff INT,
    max_staff_strength INT,
    budget DECIMAL(9,2),
    expenditure DECIMAL(9,2),
    hod_appt_date DATE
)

CREATE TABLE class (
    location_id SERIAL PRIMARY KEY,
    building_name VARCHAR(100) NOT NULL,
    room_label VARCHAR(10) NOT NULL,
    floor_no int NOT NULL,
    capacity int NOT NULL,
    description TEXT
)

DROP TABLE class;