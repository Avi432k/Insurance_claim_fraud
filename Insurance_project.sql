SELECT *
FROM insurance_dataset;

CREATE TABLE insurance_dataset1
LIKE insurance_dataset;

SELECT *
FROM insurance_dataset1;

INSERT insurance_dataset1
SELECT * 
FROM insurance_dataset;

-- CHANGE ? TO N/A IN COLLISION_TYPE COLUMN

SELECT incident_type, collision_type
FROM insurance_dataset1
WHERE incident_type = "Vehicle Theft" OR incident_type = "Parked Car"; 

UPDATE insurance_dataset1
SET collision_type = "n/a"
WHERE collision_type = "?";

SELECT * 
FROM insurance_dataset1;

-- INVESTIGATE MISSING VALUES IN PROPERTY_DAMAGE COLUMM

SELECT incident_type, collision_type, incident_severity, property_damage
FROM insurance_dataset1;

-- COMBINE INCIDENT_STATE COLUMN WITH INCIDENT_CITY COLUMN

SELECT incident_state, incident_city
FROM insurance_dataset1;

ALTER TABLE insurance_dataset1
ADD COLUMN incident_city_state VARCHAR(255) AFTER incident_city;

SELECT *
FROM insurance_dataset1;

UPDATE insurance_dataset1
SET incident_city_state = CONCAT(incident_city, ', ', incident_state);

SELECT incident_state, incident_city, incident_city_state
FROM insurance_dataset1;

ALTER TABLE insurance_dataset1
MODIFY COLUMN incident_city_state TEXT;

-- MODIFY DATE COLUMNS TO CORRECT FORMAT 

SELECT incident_date, STR_TO_DATE(incident_date, '%d/%m/%Y')
FROM insurance_dataset1; 

UPDATE insurance_dataset1
SET incident_date = STR_TO_DATE(incident_date, "%d/%m/%Y"); 

ALTER TABLE insurance_dataset1
MODIFY COLUMN incident_date DATE;

SELECT policy_bind_date, STR_TO_DATE(policy_bind_date, '%d/%m/%Y')
FROM insurance_dataset1; 

UPDATE insurance_dataset1
SET policy_bind_date = STR_TO_DATE(policy_bind_date, "%d/%m/%Y"); 

ALTER TABLE insurance_dataset1
MODIFY COLUMN policy_bind_date DATE;

 