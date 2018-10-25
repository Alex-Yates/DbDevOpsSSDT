/*
 Pre-Deployment Script Template							
-------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
-------------------------------------------------------------------------------------
*/

/*
-------------------------------------------------------------------------------------
Setting TRUSTWORTHY to ON is the simplest way to get tSQLt working on SQL 2017.
This is not required on older versions of SQL, but it is required on SQL 2017
due to the new Trusted Assemblies feature.
For more info:
https://github.com/tSQLt-org/tSQLt/issues/25
https://sqlquantumleap.com/2017/08/28/sqlclr-vs-sql-server-2017-part-4-trusted-assemblies-the-disappointment/

Test databases should only be created to run tests and then immediately deleted again
-------------------------------------------------------------------------------------
*/
declare @sql varchar(MAX)
SET @sql='ALTER DATABASE '+quotename(db_name())+' SET TRUSTWORTHY ON';
exec(@sql)
GO

-- CLR must be enabled in order to run tSQLt
EXEC sp_configure 'clr enabled', 1;
RECONFIGURE;
GO
--DECLARE @cmd NVARCHAR(MAX);
--SET @cmd='ALTER DATABASE ' + QUOTENAME(DB_NAME()) + ' SET TRUSTWORTHY ON;';
--EXEC(@cmd);
GO