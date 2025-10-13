/*
=========================================================
create Database and schemas
 Description  : This script initializes the Data Warehouse 
                environment by:
                 1. Dropping the existing DataWarehouse (if any)
                 2. Creating a new DataWarehouse database
                 3. Creating schema layers for ETL processing:
                    - Bronze : Raw/Staging layer (raw data)
                    - Silver : Cleansed/Transformed layer
                    - Gold   : Curated/Reporting layer

 Usage        : Run in SQL Server Management Studio (SSMS)
                or Azure Synapse / SQL Data Warehouse environment.
                Make sure you have admin privileges on 'master'.
*/

use master;

go

if exists (select 1 from sys.databases where name = 'DataWarehouse')
begin
	alter database DataWarehouse set single_user with rollback immediate;
	drop database DataWarehouse;
end;
go

create database datawarehouse
go

use datawarehouse
go

create schema bronze;
go

create schema silver;
go

create schema gold;
go
