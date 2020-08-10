-- Routine sql clauses 
SELECT * FROM cci_lift.health_assessment;
SELECT COUNT(*) FROM cci_lift.health_assessment;
-- DELETE FROM cci_lift.health_assessment WHERE MONTH(Datetime) = 7 AND DAY(Datetime) = 31 AND toolid = 'CCI-09C'; 
-- DELETE FROM cci_lift.health_assessment WHERE MONTH(Datetime) = 4;
-- DELETE FROM cci_lift.health_assessment WHERE Datetime IS NULL;
-- ALTER TABLE cci_lift.health_assessment ADD COLUMN RUL_byFaulty DOUBLE AFTER toolid;
-- ALTER TABLE cci_lift.health_assessment ADD COLUMN RUL_byHealthy DOUBLE AFTER RUL_byFaulty;

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
				PARTITION BY Datetime, Healthy
				ORDER BY Datetime) AS row_num
		FROM 
			cci_lift.health_assessment;

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
				PARTITION BY Datetime, Healthy
				ORDER BY Datetime) AS row_num
		FROM 
			cci_lift.health_assessment
	) t
    WHERE row_num > 1
);
