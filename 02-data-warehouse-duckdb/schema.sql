CREATE TABLE DimCustomerSegment(Segmentid INTEGER PRIMARY KEY, City VARCHAR NOT NULL);;
CREATE TABLE DimDate(Dateid INTEGER PRIMARY KEY, date DATE NOT NULL, "Year" INTEGER NOT NULL, "Quarter" INTEGER NOT NULL, QuarterName VARCHAR NOT NULL, "Month" INTEGER NOT NULL, Monthname VARCHAR NOT NULL, "Day" INTEGER NOT NULL, Weekday INTEGER NOT NULL, WeekdayName VARCHAR NOT NULL);;
CREATE TABLE DimProduct(Productid INTEGER PRIMARY KEY, Producttype VARCHAR NOT NULL);;
CREATE TABLE FactSales(Salesid VARCHAR PRIMARY KEY, Dateid INTEGER NOT NULL, Productid INTEGER NOT NULL, Segmentid INTEGER NOT NULL, Price_PerUnit DECIMAL(10,2) NOT NULL, QuantitySold INTEGER NOT NULL, FOREIGN KEY (Dateid) REFERENCES DimDate(Dateid), FOREIGN KEY (Productid) REFERENCES DimProduct(Productid), FOREIGN KEY (Segmentid) REFERENCES DimCustomerSegment(Segmentid));;
CREATE VIEW max_sales AS SELECT cs.City, p.Productid, p.Producttype, max((f.Price_PerUnit * f.QuantitySold)) AS MaxSales FROM FactSales AS f INNER JOIN DimProduct AS p ON ((f.Productid = p.Productid)) INNER JOIN DimCustomerSegment AS cs ON ((f.Segmentid = cs.Segmentid)) GROUP BY cs.City, p.Productid, p.Producttype;;

