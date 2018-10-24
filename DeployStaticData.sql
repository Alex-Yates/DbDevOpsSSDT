-- Updates all static data tables by executing stored procedures

PRINT 'Updating Sales.Currency data'
EXEC dlm.uspStaticData_SalesCurrency
