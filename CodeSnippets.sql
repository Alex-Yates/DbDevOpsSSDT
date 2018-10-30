-- LAB 6 - Dealing with conflicts 

-- (Add after BEGIN TRY)
IF LEN(@JobTitle) < 50
		  THROW 99950, 'JobTitle too short', 1;


-- LAB 9 - Branching

-- (On hotfix branch)
ALTER TABLE Person.Person ADD TwitterHandle NVARCHAR(50)
GO
CREATE PROC GetAllTwitterHandles
AS
	SELECT TwitterHandle FROM Person.Person
GO


-- LAB 10 - Merging

-- (On master branch)
ALTER TABLE Person.Person ADD TwitterHandle NVARCHAR(30)
ALTER TABLE Person.Person ADD FacebookId NVARCHAR(30)