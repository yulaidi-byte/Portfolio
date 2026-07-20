COPY DimCustomerSegment FROM 'github_assets/dimcustomersegment.csv' (FORMAT 'csv', force_not_null ('City', 'Segmentid'), quote '"', delimiter ',', header 1);
COPY DimDate FROM 'github_assets/dimdate.csv' (FORMAT 'csv', force_not_null ('date', 'Year', 'Quarter', 'QuarterName', 'Month', 'Monthname', 'Day', 'Weekday', 'WeekdayName', 'Dateid'), quote '"', delimiter ',', header 1);
COPY DimProduct FROM 'github_assets/dimproduct.csv' (FORMAT 'csv', force_not_null ('Producttype', 'Productid'), quote '"', delimiter ',', header 1);
COPY FactSales FROM 'github_assets/factsales.csv' (FORMAT 'csv', force_not_null ('Dateid', 'Productid', 'Segmentid', 'Price_PerUnit', 'QuantitySold', 'Salesid'), quote '"', delimiter ',', header 1);
