# Maven Marketing Campaign Analysis

## Table of Content 
1. [Overview](#Overview)
2. [Data Source](##Data-Source)
3. [Tools](##Tools)
4. [Skills demonstrated](##Skills-demonstrated)
5. [Business questions](##Business-questions)
6. [SQL Queries](##SQL-Queries)
7. [Recommendation from findings](##Recommendation-from-findings)
8. [Data Visualization Dashboard](##Data-Visualization-Dashboard)

## Overview
This is a personal project on Maven Marketing campaign performance,The store is a large retail supermarket that sells products ranging from edible products alongside other luxury products.
The dataset contains information generated from 2,240 customers of Maven store, including the customer profiles, product, preferences, campaign successes/failures and sales channels performance

## Data Source
Maven Marketing Data; The promary dataset used for this analysis is the 'Marketing data.csv' file, it contains detailed information about the customer's engagement overtime alongside other important 
information

## Tools 
-	Microsoft Excel - Data Cleaning, Visualization
-	SQL Server - Data Manipulation, Data Analysis, Data Transformation

## Skills demonstrated
- Data Cleaning
- Data Analysis
- Data Transformation
- Data Visualization
-Data Manipulation

## Business Questions
- What factors are signficantly related to the number of web purchases
- Which marketing campaign was the most successful
- What does the average customer look like?
- Which products are performing best
- Which channels are underperforming
- Provide recommendations

## SQL Queries
```
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

```

## Recommendation from findings
The dataset reveals that a larger percentage of the activities and features of customers that visited and have engaged Maven store overtime. The charts shows that a larger percentage of the customers
are educated from graduate level to PhD, whilw those at the basic education level are at all time low and this is one one of the germane insight revealed by the dataset. The dataset also reveals the factors that are responsible for the number of web purchases which ranges from age bracket, education level alongside others. The chart also gave a detailed information abou the profile of an average customer at Maven
store. The product sale performance chart shows that wine as a product is doing much more fine compared to others
The recommendations are as follows;

- The systems of operation in the store should be modified in order to accommodate those at basic education level to aid sale increase (The process of making purchases should be much more simplified and seamless for them.

- The marketing campaign strategy 1 has been the most effective. The first four campaign strategy can be maintained as the difference  between the success rates are not much. which makes it obvious that each of the campaigns are generating leads for the store in their respective capacity, while the last campaign (Campaign 2) can be discarded.

- The charts also reveal that the highest amount of sales is recorded in Spain with a wide margin compared to others. Probably the main store is located in Spain or discount is being given on the purchases made, this can be looked into. Whatever is done in the store at Spain that has led to such an impressive conversion rate can also be replicated in other countries.

- The web and store purchases by Age range shows that a large number of customers are between the age of 53 - 62 and a lot of the younger generation don't patronize the store, this could have been as a result of unavailability of products that appeal to their age bracket. The scope of the available products at Maven Store can be widened. Include products that appeal to the younger generation as this will reall boost web purchases. While the store purchases seems to be at all time high compared to others.

- The customers enrollment date also reveal that the enrollment rate goes down during the end of the year which should have been a strategic time to increase sales. Promos and year end discount can be used to attract more customers expecially during festive season.


## Data Visualization Dashboard




 ![Picture15](https://github.com/Kaykstheanalyst/Marketing-store-project/assets/150609177/c7f6f305-ded2-4627-84e9-c09c9b02792e)


