-- Routine sql clauses 
SELECT * FROM cci_lift.health_assessment;
SELECT COUNT(*) FROM cci_lift.health_assessment;

-- Copy the schema and content from an old database to a new one
CREATE TABLE cci_lift.health_testing LIKE cci_lift.health_assessment;
INSERT cci_lift.health_testing SELECT * FROM cci_lift.health_assessment; 

-- add auto id as a primary key into an existing database
-- reference: https://stackoverflow.com/questions/14753321/add-auto-increment-id-to-existing-table 
ALTER TABLE cci_lift.health_assessment ADD `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE cci_lift.health_testing ADD `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Check the duplicate rows in the databases 
-- reference: https://www.mysqltutorial.org/mysql-delete-duplicate-rows/ 
SELECT 
			id,
			ROW_NUMBER() OVER (
				PARTITION BY Datetime
				ORDER BY Datetime) AS row_num
		FROM 
			cci_lift.health_testing;

-- Delete duplicates rows in an existing database (auto id needed) 
DELETE FROM cci_lift.health_assessment
WHERE 
	id IN (
	SELECT 
		id 
	FROM (
		SELECT 
			id,
			ROW_NUMBER() OVER (
				PARTITION BY Datetime
				ORDER BY Datetime) AS row_num
		FROM 
			cci_lift.health_assessment
	) t
    WHERE row_num > 1
);
