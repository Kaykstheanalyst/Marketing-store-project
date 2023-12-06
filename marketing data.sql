Select *
From marketing_data$


---Standardize date 

SELECT Dt_Customer, CONVERT( Date, Dt_Customer) AS 'Dt_customer_conv'
FROM marketing_data$

ALTER TABLE marketing_data$
ADD Dt_customer_conv Date;

UPDATE marketing_data$
SET Dt_Customer_conv = CONVERT( Date, Dt_Customer)

--FACTORS SIGNIFICANTLY RELATED TO NUMBER OF WEB PURCHASES

-- Number of web purchases when education is 'Basic' 
SELECT SUM(Numwebpurchases) 
FROM marketing_data$
WHERE Education = 'Basic' 

GO
-- Number of web purchases when education is 'Graduation' 
SELECT SUM(Numwebpurchases)
FROM marketing_data$
WHERE Education = 'Graduation' 
GO
-- Number of web purchases when education is 'PhD' 
SELECT SUM(Numwebpurchases)
FROM marketing_data$
WHERE Education = 'PhD' 


-- Number of store purchases when education is 'Basic' 
SELECT SUM(NumStorePurchases)
FROM marketing_data$
WHERE Education = 'Basic' 

GO
 --Number of store purchases when education is 'Graduation' 
SELECT SUM(NumStorePurchases)
FROM marketing_data$
WHERE Education = 'Graduation' 
GO
 --Number of store purchases when education is 'PhD' 
SELECT SUM(NumStorePurchases)
FROM marketing_data$
WHERE Education = 'PhD' 



-- Number of catalog purchases when education is 'Basic' 
SELECT SUM(NumCatalogPurchases)
FROM marketing_data$
WHERE Education = 'Basic' 

GO
 --Number of catalog purchases when education is 'Graduation' 
SELECT SUM(NumCatalogPurchases)
FROM marketing_data$
WHERE Education = 'Graduation' 
GO
 --Number of catalog purchases when education is 'PhD' 
SELECT SUM(NumCatalogPurchases)
FROM marketing_data$
WHERE Education = 'PhD' 


-- Number of Deals purchases when education is 'Basic' 
SELECT SUM(NumDealsPurchases)
FROM marketing_data$
WHERE Education = 'Basic' 

GO
 --Number of Deals purchases when education is 'Graduation' 
SELECT SUM(NumDealsPurchases)
FROM marketing_data$
WHERE Education = 'Graduation' 
GO
 --Number of Deals purchases when education is 'PhD' 
SELECT SUM(NumDealsPurchases)
FROM marketing_data$
WHERE Education = 'PhD' 



---WEB PURCHASES BY BIRTH YEAR INTERVALS
---- 1950-1954
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1950 and 1954

--1955-1959
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1955 and 1959

---1960-1964
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1960 and 1964


---1965-1969
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1965 and 1969
ORDER BY Year_birth ASC


---1970-1974
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1970 and 1974
ORDER BY Year_birth ASC


---1975-1979
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1975 and 1979
ORDER BY Year_birth ASC

---1980-1984
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1980 and 1984
ORDER BY Year_birth ASC

---1985-1989
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1985 and 1989
ORDER BY Year_birth ASC


---1990-1994
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1990 and 1994
ORDER BY Year_birth ASC


---1995-1999
SELECT Numwebpurchases,NumStorePurchases, Year_birth
FROM marketing_data$
WHERE Year_Birth between 1995 and 1999
ORDER BY Year_birth ASC


--FACTORS SIGNIFICANTLY RELATED TO NUMBER OF STORE PURCHASES

--- Number of store purchases when education is 'Basic' and year between 1950 and 1980

SELECT SUM(NumStorePurchases) 
FROM marketing_data$
WHERE Education = 'Basic' AND Year_Birth BETWEEN '1950'AND'1980'

GO
-- Number of store purchases when education is 'Graduation' and year between 1950 and 1980
SELECT SUM(NumStorePurchases)
FROM marketing_data$
WHERE Education = 'Graduation' AND Year_Birth BETWEEN '1950'AND'1980'

-- Number of store purchases when education is 'Basic' and year between 1981 and 2000
SELECT SUM(NumStorePurchases)
FROM marketing_data$
WHERE Education = 'Basic' AND Year_Birth BETWEEN '1981'AND'2000'

GO
 --Number of store purchases when education is 'Graduation' and year between 1981 and 2000
SELECT SUM(NumStorePurchases)
FROM marketing_data$
WHERE Education = 'Graduation' AND Year_Birth BETWEEN '1981'AND'2000'


--- NUMBER OF WEB PURCHASES BASED ON INCOME
SELECT [ Income ], Numwebpurchases
FROM  marketing_data$
ORDER BY Numwebpurchases DESC

GO
--- NUMBER OF STORE PURCHASES BASED ON INCOME
SELECT [ Income ], NumStorePurchases
FROM  marketing_data$
ORDER BY NumStorePurchases DESC

--MOST SUCCESSFUL MARKETING CAMPAIGN

--- success on number of web purchases
SELECT TOP 1 (SELECT SUM(Numwebpurchases) FROM marketing_data$ WHERE AcceptedCmp1 = '1' ) AS cmp1_pass,
(SELECT SUM(Numwebpurchases) FROM marketing_data$ WHERE AcceptedCmp2 = '1') AS cmp2_pass,
(SELECT SUM(Numwebpurchases) FROM marketing_data$ WHERE AcceptedCmp3 = '1')AS cmp3_pass,
(SELECT SUM(Numwebpurchases) FROM marketing_data$ WHERE AcceptedCmp4 = '1') AS cmp4_pass,
(SELECT SUM(Numwebpurchases) FROM marketing_data$ WHERE AcceptedCmp5 = '1') AS cmp5_pass
FROM marketing_data$
GO
---success on num of catalog purchases
SELECT TOP 1(SELECT SUM(NumCatalogPurchases) FROM marketing_data$ WHERE AcceptedCmp1 = '1') AS cmp1_pass, 
(SELECT SUM(NumCatalogPurchases) FROM marketing_data$ WHERE AcceptedCmp2 = '1') AS cmp2_pass,
(SELECT SUM(NumCatalogPurchases) FROM marketing_data$ WHERE AcceptedCmp3 = '1')AS cmp3_pass,
(SELECT SUM(NumCatalogPurchases) FROM marketing_data$ WHERE AcceptedCmp4 = '1') AS cmp4_pass,
(SELECT SUM(NumCatalogPurchases) FROM marketing_data$ WHERE AcceptedCmp5 = '1') AS cmp5_pass
FROM marketing_data$
GO
---success on Number of store purchases
SELECT TOP 1(SELECT SUM(NumStorePurchases) FROM marketing_data$ WHERE AcceptedCmp1 = '1') AS cmp1_pass, 
(SELECT SUM(NumStorePurchases) FROM marketing_data$ WHERE AcceptedCmp2 = '1') AS cmp2_pass,
(SELECT SUM(NumStorePurchases) FROM marketing_data$ WHERE AcceptedCmp3 = '1')AS cmp3_pass,
(SELECT SUM(NumStorePurchases) FROM marketing_data$ WHERE AcceptedCmp4 = '1') AS cmp4_pass,
(SELECT SUM(NumStorePurchases) FROM marketing_data$ WHERE AcceptedCmp5 = '1') AS cmp5_pass
FROM marketing_data$
GO
---success on Number of deals purchases
SELECT TOP 1(SELECT SUM(NumDealsPurchases) FROM marketing_data$ WHERE AcceptedCmp1 = '1') AS cmp1_pass, 
(SELECT SUM(NumDealsPurchases) FROM marketing_data$ WHERE AcceptedCmp2 = '1') AS cmp2_pass,
(SELECT SUM(NumdealsPurchases) FROM marketing_data$ WHERE AcceptedCmp3 = '1')AS cmp3_pass,
(SELECT SUM(NumdealsPurchases) FROM marketing_data$ WHERE AcceptedCmp4 = '1') AS cmp4_pass,
(SELECT SUM(NumdealsPurchases) FROM marketing_data$ WHERE AcceptedCmp5 = '1') AS cmp5_pass
FROM marketing_data$


---NUMBER OF PURCHASES BY COUNTRY

SELECT Country, NumWebPurchases
FROM marketing_data$
GO
SELECT Country, NumStorePurchases
FROM marketing_data$
GO
SELECT Country, NumCatalogPurchases
FROM marketing_data$
GO
SELECT Country, NumDealsPurchases
FROM marketing_data$


---ATTRIBUTES OF AN AVERAGE CUSTOMER
---Average webpurchases
SELECT  AVG(Numwebpurchases) avgwebpurchase
FROM marketing_data$
GO
-- average income
SELECT AVG([ Income ]) avgincome
FROM marketing_data$
GO

---Average amount spent on products
SELECT TOP 1(SELECT AVG(mntwines) FROM marketing_data$) mntwines, (SELECT AVG(MntFruits) FROM marketing_data$) mntfruits,
(SELECT AVG(MntFishProducts) FROM marketing_data$) mntfish, (SELECT AVG(MntMeatProducts) FROM marketing_data$) mntmeat,
(SELECT AVG(MntGoldProds) FROM marketing_data$) mntgold
FROM marketing_data$
GO

---average recency
SELECT AVG(Recency) averagerecency
FROM marketing_data$


---BEST PERFORMING PRODUCT

SELECT TOP 1(SELECT SUM(mntwines) FROM marketing_data$) mntwines, (SELECT SUM(MntFruits) FROM marketing_data$) mntfruits,
(SELECT SUM(MntFishProducts) FROM marketing_data$) mntfish, (SELECT SUM(MntMeatProducts) FROM marketing_data$) mntmeat,
(SELECT SUM(MntGoldProds) FROM marketing_data$) mntgold
FROM marketing_data$


