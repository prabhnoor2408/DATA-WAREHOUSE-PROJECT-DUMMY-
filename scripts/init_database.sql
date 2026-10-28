--This is a reset script to drop complete database includiing all schemas and tables.
--Make sure to keep a backup of this in case needed.
/*IF EXISTS is used to make sure server doesn't give error when executed first when 
no database exist
WITH FORCE is used to disconnects any session which is connected to it and drops the 
database*/
DROP DATABASE IF EXISTS Datawarehouse WITH (FORCE);

--Create database
CREATE DATABASE Datawarehouse;

--Create schema
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
