SELECT 
Extract.CLIENT_FULL_NAME, 
Extract.CLIENT_FIRST_LAST, 
Extract.ADDRESS_LINE1 AS [Extract Address 1], 
Extract.ADDRESS_LINE2 AS [Extract Address 2], 
Extract.CITY AS [Extract City], 
Extract.STATE AS [Extract State], 
Extract.Zip AS [Extract Zip], 
Extract.CLIENT_PHONE AS [Extract Primary Phone], 
Extract.CLIENT_ALT_PHONE AS [Extract Alternative Phone], 
Core.[Mailing Street] AS [Core Mailing Street], 
Core.[Mailing City] AS [Core Mailing City], 
Core.[Mailing State] AS [Core Mailing State], 
Core.[Mailing Zip] AS [Core Mailing Zip], 
Core.[Other Street] AS [Core Other Street], 
Core.[Other City] AS [Core Other City], 
Core.[Other State] AS [Core Other State], 
Core.[Other Zip] AS [Core Other Zip], 
Core.[Home Phone] AS [Core Home Phone], 
Core.Mobile AS [Core Mobile Phone], 
Core.[Total Demand Deposit Balance], 
Core.[Total Savings Balance], 
Core.[Total Loan Balance], 
Core.[Total Certificate Balance] 
INTO [Extract+Core]
FROM Extract 
LEFT JOIN Core 
ON Extract.CLIENT_FULL_NAME = Core.Name;

SELECT 
[Extract+Core].*, 
WealthManagement.[Type of Account *] AS [Type of Wealth Management Account], 
WealthManagement.[2020 YTD] AS [Wealth Management 2020 $ YTD], 
WealthManagement.[Owner Address 1] AS [Wealth Management Address 1], 
WealthManagement.[Owner Address 2] AS [Wealth Management Address 2], 
WealthManagement.[Owner Address 3] AS [Wealth Management Address 3], 
WealthManagement.[Owner City] AS [Wealth Management City], 
WealthManagement.[Owner State] AS [Wealth Management State], 
WealthManagement.[Owner ZipCode] AS [Wealth Management Zip], 
WealthManagement.[Owner Phone Number] AS [Wealth Management Phone] 
INTO [Extract+Core+WealthManagement]
FROM [Extract+Core] 
LEFT JOIN WealthManagement 
ON [Extract+Core].CLIENT_FULL_NAME = WealthManagement.[Account Owner];


SELECT 
[Extract+Core+WealthManagement].*, 
Brokerage.[Reg Addr_LN3] AS [Brokerage Address 1], 
Brokerage.[Reg Addr_LN4] AS [Brokerage Address 2], 
Brokerage.[Reg Addr_LN5] AS [Brokerage City], 
Brokerage.[Reg Addr_LN6] AS [Brokerage State], 
Brokerage.[Cust Phone] AS [Brokerage Phone] 
INTO [Extract+Core+WealthManagement+Brokerage]
FROM [Extract+Core+WealthManagement] 
LEFT JOIN Brokerage 
ON [Extract+Core+WealthManagement].CLIENT_FIRST_LAST = Brokerage.[Cust Name];


SELECT 
CLIENT_FULL_NAME, 
[Total Demand Deposit Balance], 
[Total Savings Balance], 
[Total Loan Balance], 
[Total Certificate Balance], 
[Type of Wealth Management Account], 
[Wealth Management 2020 $ YTD], 
[Extract Primary Phone], 
[Extract Alternative Phone], 
[Core Home Phone], 
[Core Mobile Phone], 
[Wealth Management Phone], 
[Brokerage Phone], 
[Extract Address 1], 
[Extract Address 2], 
[Extract City], 
[Extract State], 
[Extract Zip], 
[Core Mailing Street], 
[Core Mailing City], 
[Core Mailing State], 
[Core Mailing Zip], 
[Core Other Street], 
[Core Other City], 
[Core Other State], 
[Core Other Zip], 
[Wealth Management Address 1], 
[Wealth Management Address 2], 
[Wealth Management Address 3], 
[Wealth Management City], 
[Wealth Management State], 
[Wealth Management Zip], 
[Brokerage Address 1], 
[Brokerage Address 2], 
[Brokerage City], 
[Brokerage State]
FROM [Extract+Core+WealthManagement+Brokerage];
