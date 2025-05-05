-- Create the country table
CREATE TABLE country
(
  country_name VARCHAR(30) PRIMARY KEY,
  language VARCHAR(30) NOT NULL,
  region VARCHAR(30) NOT NULL
);

-- Insert data into the country table
-- 8 records
INSERT INTO country (country_name, language, region)
VALUES
  ('China', 'Chinese', 'Asia'),
  ('Hong Kong', 'Cantonese', 'Asia'),
  ('India', 'Tamil', 'Asia'),
  ('Korea', 'Korean', 'Asia'),
  ('Malaysia', 'Malay', 'Asia'),
  ('Singapore', 'English', 'Asia'),
  ('Taiwan', 'Chinese', 'Asia'),
  ('Thailand', 'Thai', 'Asia');
