-- Reference: https://www.mysqltutorial.org/mysql-revoke.aspx

-- show all privileges of a certain user 
SHOW GRANTS FOR 'cardo'@'%';

-- revoke all privileges
REVOKE ALL, GRANT OPTION FROM cardo;
-- revoke specific privilege
REVOKE ALL ON cardo_main.* FROM ntume;
REVOKE INSERT, UPDATE ON classicmodels.* FROM rfc@localhost;

-- grant privileges
GRANT SELECT, INSERT, DELETE, UPDATE, CREATE ON cardo_history.* TO `line`@'%';

