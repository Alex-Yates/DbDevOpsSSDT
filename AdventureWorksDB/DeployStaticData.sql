-- Updates static data tables by executing corresponding stored procedures

PRINT 'Updating Sales.Currency data'
EXEC data.uspSales_Currency
