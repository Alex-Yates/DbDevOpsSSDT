CREATE PROCEDURE [dlm].[uspStaticData_SalesCurrency]
AS
BEGIN

/*
Uses a MERGE statement to update the AdventureWorks.Sales.Currency
table with a specific set of values. Useful to reference from a 
post-deploy script in a SQL Server Database Project to get static
data into source control.

This script follows the template for including static data in a 
SQL Server Database Project provided by Gary Trinder on the official 
SSDT team blog here:
https://blogs.msdn.microsoft.com/ssdt/2012/02/02/including-data-in-a-sql-server-database-project/

If you need to generate merge statements like this for several tables,
check out this community sourced stored procedure which automates the 
process:
https://github.com/readyroll/generate-sql-merge/blob/master/master.dbo.sp_generate_merge.sql
*/

-- Reference Data for Sales.Currency
MERGE INTO Sales.Currency AS Target
USING (VALUES 
	(N'AED', N'Emirati Dirham', '2002-06-01 00:00:00.000') 
	,(N'AFA', N'Afghani', '2002-06-01 00:00:00.000')
	,(N'ALL', N'Lek', '2002-06-01 00:00:00.000')
	,(N'AMD', N'Armenian Dram', '2002-06-01 00:00:00.000')
	,(N'ANG', N'Netherlands Antillian Guilder', '2002-06-01 00:00:00.000')
	,(N'AOA', N'Kwanza', '2002-06-01 00:00:00.000')
	,(N'ARS', N'Argentine Peso', '2002-06-01 00:00:00.000')
	,(N'ATS', N'Shilling', '2002-06-01 00:00:00.000') 
	,(N'AUD', N'Australian Dollar', '2002-06-01 00:00:00.000') 
	,(N'AWG', N'Aruban Guilder', '2002-06-01 00:00:00.000') 
	,(N'AZM', N'Azerbaijanian Manat', '2002-06-01 00:00:00.000') 
	,(N'BBD', N'Barbados Dollar', '2002-06-01 00:00:00.000') 
	,(N'BDT', N'Taka', '2002-06-01 00:00:00.000')
	,(N'BEF', N'Belgian Franc', '2002-06-01 00:00:00.000')
	,(N'BGN', N'Bulgarian Lev', '2002-06-01 00:00:00.000')
	,(N'BHD', N'Bahraini Dinar', '2002-06-01 00:00:00.000')
	,(N'BND', N'Brunei Dollar', '2002-06-01 00:00:00.000')
	,(N'BOB', N'Boliviano', '2002-06-01 00:00:00.000')
	,(N'BRL', N'Brazilian Real', '2002-06-01 00:00:00.000')
	,(N'BSD', N'Bahamian Dollar', '2002-06-01 00:00:00.000')
	,(N'BTN', N'Ngultrum', '2002-06-01 00:00:00.000')
	,(N'CAD', N'Canadian Dollar', '2002-06-01 00:00:00.000')
	,(N'CHF', N'Swiss Franc', '2002-06-01 00:00:00.000')
	,(N'CLP', N'Chilean Peso', '2002-06-01 00:00:00.000')
	,(N'CNY', N'Yuan Renminbi', '2002-06-01 00:00:00.000')
	,(N'COP', N'Colombian Peso', '2002-06-01 00:00:00.000')
	,(N'CRC', N'Costa Rican Colon', '2002-06-01 00:00:00.000')
	,(N'CYP', N'Cyprus Pound', '2002-06-01 00:00:00.000')
	,(N'CZK', N'Czech Koruna', '2002-06-01 00:00:00.000')
	,(N'DEM', N'Deutsche Mark', '2002-06-01 00:00:00.000')
	,(N'DKK', N'Danish Krone', '2002-06-01 00:00:00.000')
	,(N'DOP', N'Dominican Peso', '2002-06-01 00:00:00.000')
	,(N'DZD', N'Algerian Dinar', '2002-06-01 00:00:00.000')
	,(N'EEK', N'Kroon', '2002-06-01 00:00:00.000')
	,(N'EGP', N'Egyptian Pound', '2002-06-01 00:00:00.000')
	,(N'ESP', N'Spanish Peseta', '2002-06-01 00:00:00.000')
	,(N'EUR', N'EURO', '2002-06-01 00:00:00.000')
	,(N'FIM', N'Markka', '2002-06-01 00:00:00.000')
	,(N'FJD', N'Fiji Dollar', '2002-06-01 00:00:00.000')
	,(N'FRF', N'French Franc', '2002-06-01 00:00:00.000')
	,(N'GBP', N'United Kingdom Pound', '2002-06-01 00:00:00.000')
	,(N'GHC', N'Cedi', '2002-06-01 00:00:00.000')
	,(N'GRD', N'Drachma', '2002-06-01 00:00:00.000')
	,(N'GTQ', N'Quetzal', '2002-06-01 00:00:00.000')
	,(N'HKD', N'Hong Kong Dollar', '2002-06-01 00:00:00.000')
	,(N'HRK', N'Croatian Kuna', '2002-06-01 00:00:00.000')
	,(N'HUF', N'Forint', '2002-06-01 00:00:00.000')
	,(N'IDR', N'Rupiah', '2002-06-01 00:00:00.000')
	,(N'IEP', N'Irish Pound', '2002-06-01 00:00:00.000')
	,(N'ILS', N'New Israeli Shekel', '2002-06-01 00:00:00.000')
	,(N'INR', N'Indian Rupee', '2002-06-01 00:00:00.000')
	,(N'ISK', N'Iceland Krona', '2002-06-01 00:00:00.000')
	,(N'ITL', N'Italian Lira', '2002-06-01 00:00:00.000')
	,(N'JMD', N'Jamaican Dollar', '2002-06-01 00:00:00.000')
	,(N'JOD', N'Jordanian Dinar', '2002-06-01 00:00:00.000')
	,(N'JPY', N'Yen', '2002-06-01 00:00:00.000')
	,(N'KES', N'Kenyan Shilling', '2002-06-01 00:00:00.000')
	,(N'KRW', N'Won', '2002-06-01 00:00:00.000')
	,(N'KWD', N'Kuwaiti Dinar', '2002-06-01 00:00:00.000')
	,(N'LBP', N'Lebanese Pound', '2002-06-01 00:00:00.000')
	,(N'LKR', N'Sri Lankan Rupee', '2002-06-01 00:00:00.000') 
	,(N'LTL', N'Lithuanian Litas', '2002-06-01 00:00:00.000') 
	,(N'LVL', N'Latvian Lats', '2002-06-01 00:00:00.000')
	,(N'MAD', N'Moroccan Dirham', '2002-06-01 00:00:00.000')
	,(N'MTL', N'Maltese Lira', '2002-06-01 00:00:00.000')
	,(N'MUR', N'Mauritius Rupee', '2002-06-01 00:00:00.000')
	,(N'MVR', N'Rufiyaa', '2002-06-01 00:00:00.000')
	,(N'MXN', N'Mexican Peso', '2002-06-01 00:00:00.000')
	,(N'MYR', N'Malaysian Ringgit', '2002-06-01 00:00:00.000')
	,(N'NAD', N'Namibia Dollar', '2002-06-01 00:00:00.000')
	,(N'NGN', N'Naira', '2002-06-01 00:00:00.000')
	,(N'NLG', N'Netherlands Guilder', '2002-06-01 00:00:00.000')
	,(N'NOK', N'Norwegian Krone', '2002-06-01 00:00:00.000')
	,(N'NPR', N'Nepalese Rupee', '2002-06-01 00:00:00.000')
	,(N'NZD', N'New Zealand Dollar', '2002-06-01 00:00:00.000')
	,(N'OMR', N'Omani Rial', '2002-06-01 00:00:00.000')
	,(N'PAB', N'Balboa', '2002-06-01 00:00:00.000')
	,(N'PEN', N'Nuevo Sol', '2002-06-01 00:00:00.000')
	,(N'PHP', N'Philippine Peso', '2002-06-01 00:00:00.000')
	,(N'PKR', N'Pakistan Rupee', '2002-06-01 00:00:00.000')
	,(N'PLN', N'Zloty', '2002-06-01 00:00:00.000')
	,(N'PLZ', N'Polish Zloty(old)', '2002-06-01 00:00:00.000')
	,(N'PTE', N'Portuguese Escudo', '2002-06-01 00:00:00.000')
	,(N'PYG', N'Guarani', '2002-06-01 00:00:00.000')
	,(N'ROL', N'Leu', '2002-06-01 00:00:00.000')
	,(N'RUB', N'Russian Ruble', '2002-06-01 00:00:00.000')
	,(N'RUR', N'Russian Ruble(old)', '2002-06-01 00:00:00.000')
	,(N'SAR', N'Saudi Riyal', '2002-06-01 00:00:00.000')
	,(N'SEK', N'Swedish Krona', '2002-06-01 00:00:00.000')
	,(N'SGD', N'Singapore Dollar', '2002-06-01 00:00:00.000')
	,(N'SIT', N'Tolar', '2002-06-01 00:00:00.000')
	,(N'SKK', N'Slovak Koruna', '2002-06-01 00:00:00.000')
	,(N'SVC', N'El Salvador Colon', '2002-06-01 00:00:00.000')
	,(N'THB', N'Baht', '2002-06-01 00:00:00.000')
	,(N'TND', N'Tunisian Dinar', '2002-06-01 00:00:00.000')
	,(N'TRL', N'Turkish Lira', '2002-06-01 00:00:00.000')
	,(N'TTD', N'Trinidad and Tobago Dollar', '2002-06-01 00:00:00.000')
	,(N'TWD', N'New Taiwan Dollar', '2002-06-01 00:00:00.000')
	,(N'USD', N'US Dollar', '2002-06-01 00:00:00.000')
	,(N'UYU', N'Uruguayan Peso', '2002-06-01 00:00:00.000')
	,(N'VEB', N'Bolivar', '2002-06-01 00:00:00.000')
	,(N'VND', N'Dong', '2002-06-01 00:00:00.000')
	,(N'XOF', N'CFA Franc BCEAO', '2002-06-01 00:00:00.000')
	,(N'ZAR', N'Rand', '2002-06-01 00:00:00.000')
	,(N'ZWD', N'Zimbabwe Dollar', '2002-06-01 00:00:00.000')
) 
AS Source (CurrencyCode, Name, ModifiedDate) 
ON Target.CurrencyCode = Source.CurrencyCode 

-- update matched rows 
WHEN MATCHED THEN 
UPDATE SET Target.Name = Source.Name,
		   Target.ModifiedDate = Source.ModifiedDate 

-- insert new rows 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (CurrencyCode, Name, ModifiedDate) 
VALUES (Source.CurrencyCode, Source.Name, Source.ModifiedDate) 

-- delete rows that are in the target but not the source 
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;

END
