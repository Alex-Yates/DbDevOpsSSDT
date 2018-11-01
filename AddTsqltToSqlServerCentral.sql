-- Create test class
EXEC tsqlt.NewTestClass @ClassName = N'VerifyTsqlt' -- nvarchar(max)
GO

-- Create first test
CREATE PROCEDURE [verifyTsqlt].[Test IsTsqltWorking]
AS
EXEC tSQLt.AssertEquals @Expected =True, -- sql_variant
                        @Actual = True,   -- sql_variant
                        @Message = N''    -- nvarchar(max)
GO

-- Run first test
EXEC tsqlt.RunAll
GO

-- Create real test
EXEC tsqlt.NewTestClass @ClassName = N'AddStopWord' -- nvarchar(max)
GO

CREATE PROCEDURE [AddStopWord].[Test TheStopWordIWanted]
AS
BEGIN

-- Create a fake table
EXEC tSQLt.FakeTable 'dbo.SearchAnalyzerConfig';
 
-- Populate a record using the procedure I'm testing
EXEC dbo.AddStopWord @Word = N'TheStopWordIWanted'

-- Specify the actual results
DECLARE @ActualWord CHAR(50);
SET @ActualWord = (SELECT Word FROM dbo.SearchAnalyzerConfig);
 
-- Verify that the actual results corresponds to the expected results
EXEC tSQLt.AssertEquals @Expected = 'TheStopWordIWanted', @Actual = @ActualWord;

END;
GO

-- Run all tests
EXEC tsqlt.RunAll
GO
