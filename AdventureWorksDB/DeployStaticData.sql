-- Updates all static data tables by executing stored procedures

PRINT 'Updating Sales.Currency data'
EXEC data.uspSales_Currency
