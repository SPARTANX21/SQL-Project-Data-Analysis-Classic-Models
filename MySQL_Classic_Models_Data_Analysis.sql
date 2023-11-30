-- SELECT Table
USE CLASSICMODELS;

-- 1. Find the top 10 customers who have placed the most orders. Display customer name and the count of orders placed
-- Flow : Customers ; CustomerName,CustomerNumber --> Orders ; CustomerNumber, Count.
Show tables;
select * from customers;
select * from orders;
SELECT * FROM ORDERDETAILS;

SELECT C.CUSTOMERNUMBER,C.CUSTOMERNAME, COUNT(*) as Count_Of_Orders
FROM Customers C 
INNER JOIN ORDERS O Using(CustomerNumber)
GROUP BY 1
ORDER BY Count_Of_Orders DESC
LIMIT 10;

/* OUTPUT
CUSTOMERNUMBER, CUSTOMERNAME, Count_Of_Orders
141	Euro+ Shopping Channel	26
124	Mini Gifts Distributors Ltd.	17
323	Down Under Souveniers, Inc	5
148	Dragon Souveniers, Ltd.	5
114	Australian Collectors, Co.	5
353	Reims Collectables	5
145	Danish Wholesale Imports	5
121	Baane Mini Imports	4
128	Blauer See Auto, Co.	4
496	Kelly's Gift Shop	4
*/

-- 2. Retrieve the list of customers who have placed orders but haven't made any payments yet.

SHOW TABLES;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Orderdetails;
SELECT * FROM Payments;
SELECT * FROM Products;

SELECT o.customernumber
FROM orders o 
WHERE o.customernumber NOT IN (SELECT distinct Customernumber 
							   FROM Orders O
							   WHERE O.customernumber IN (SELECT distinct p.customernumber from PAYMENTS P)); 
/*
OUTPUT
customernumber

*/

-- 3. Retrieve a product that has been ordered the least number of times. Display the product code, product name, and the number of times it has been ordered.

SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM orders;
select * from orderdetails;
select * from products;

SELECT p.productcode, p.productname, count(*) as Count_Ordered
FROM Products P
INNER JOIN Orderdetails od using(productcode)
INNER JOIN orders o using(ordernumber)
GROUP BY 1,2
Order by Count_Ordered;

/*
productcode, productname, Count_Ordered
S18_4933	1957 Ford Thunderbird	24
S24_2887	1952 Citroen-15CV	24
S18_1589	1965 Aston Martin DB5	25
S18_1749	1917 Grand Touring Sedan	25
S18_2248	1911 Ford Town Car	25
S18_2870	1999 Indy 500 Monte Carlo SS	25
S18_3685	1948 Porsche Type 356 Roadster	25
S18_4409	1932 Alfa Romeo 8C2300 Spider Sport	25
S24_1046	1970 Chevy Chevelle SS 454	25
S24_1628	1966 Shelby Cobra 427 S/C	25
S24_2766	1949 Jaguar XK 120	25
S24_3191	1969 Chevrolet Camaro Z28	25
S24_3432	2002 Chevy Corvette	25
S24_3969	1936 Mercedes Benz 500k Roadster	25
S12_1099	1968 Ford Mustang	27
S12_1108	2001 Ferrari Enzo	27
S12_3148	1969 Corvair Monza	27
S12_3380	1968 Dodge Charger	27
S12_3891	1969 Ford Falcon	27
S12_3990	1970 Plymouth Hemi Cuda	27
S12_4675	1969 Dodge Charger	27
S18_1129	1993 Mazda RX-7	27
S18_1889	1948 Porsche 356-A Roadster	27
S18_1984	1995 Honda Civic	27
S18_3140	1903 Ford Model A	27
S18_3259	Collectable Wooden Train	27
S18_3278	1969 Dodge Super Bee	27
S18_3482	1976 Ford Gran Torino	27
S18_3782	1957 Vespa GS150	27
S18_4027	1970 Triumph Spitfire	27
S18_4522	1904 Buick Runabout	27
S18_4721	1957 Corvette Convertible	27
S24_2011	18th century schooner	27
S24_2360	1982 Ducati 900 Monster	27
S24_2972	1982 Lamborghini Diablo	27
S24_3151	1912 Ford Model T Delivery Wagon	27
S24_3371	1971 Alpine Renault 1600s	27
S24_3856	1956 Porsche 356A Coupe	27
S24_4048	1992 Porsche Cayenne Turbo Silver	27
S24_4620	1961 Chevrolet Impala	27
S32_2206	1982 Ducati 996 R	27
S32_3207	1950's Chicago Surface Lines Streetcar	27
S32_4485	1974 Ducati 350 Mk3 Desmo	27
S50_1514	1962 City of Detroit Streetcar	27
S50_4713	2002 Yamaha YZR M1	27
S700_1138	The Schooner Bluenose	27
S700_1938	The Mayflower	27
S700_2610	The USS Constitution Ship	27
S700_3505	The Titanic	27
S700_3962	The Queen Mary	27
S72_3212	Pont Yacht	27
S10_1678	1969 Harley Davidson Ultimate Chopper	28
S10_1949	1952 Alpine Renault 1300	28
S10_2016	1996 Moto Guzzi 1100i	28
S10_4698	2003 Harley-Davidson Eagle Drag Bike	28
S10_4757	1972 Alfa Romeo GTA	28
S10_4962	1962 LanciaA Delta 16V	28
S12_1666	1958 Setra Bus	28
S12_2823	2002 Suzuki XREO	28
S12_4473	1957 Chevy Pickup	28
S18_1097	1940 Ford Pickup Truck	28
S18_1342	1937 Lincoln Berline	28
S18_1367	1936 Mercedes-Benz 500K Special Roadster	28
S18_1662	1980s Black Hawk Helicopter	28
S18_2238	1998 Chrysler Plymouth Prowler	28
S18_2319	1964 Mercedes Tour Bus	28
S18_2325	1932 Model A Ford J-Coupe	28
S18_2432	1926 Ford Fire Engine	28
S18_2581	P-51-D Mustang	28
S18_2625	1936 Harley Davidson El Knucklehead	28
S18_2795	1928 Mercedes-Benz SSK	28
S18_2949	1913 Ford Model T Speedster	28
S18_2957	1934 Ford V8 Coupe	28
S18_3029	1999 Yamaha Speed Boat	28
S18_3136	18th Century Vintage Horse Carriage	28
S18_3320	1917 Maxwell Touring Car	28
S18_3856	1941 Chevrolet Special Deluxe Cabriolet	28
S18_4600	1940s Ford truck	28
S18_4668	1939 Cadillac Limousine	28
S24_1444	1970 Dodge Coronet	28
S24_1578	1997 BMW R 1100 S	28
S24_1785	1928 British Royal Navy Airplane	28
S24_1937	1939 Chevrolet Deluxe Coupe	28
S24_2000	1960 BSA Gold Star DBD34	28
S24_2022	1938 Cadillac V-16 Presidential Limousine	28
S24_2300	1962 Volkswagen Microbus	28
S24_2840	1958 Chevy Corvette Limited Edition	28
S24_2841	1900s Vintage Bi-Plane	28
S24_3420	1937 Horch 930V Limousine	28
S24_3816	1940 Ford Delivery Sedan	28
S24_3949	Corsair F4U ( Bird Cage)	28
S24_4258	1936 Chrysler Airflow	28
S24_4278	1900s Vintage Tri-Plane	28
S32_1268	1980’s GM Manhattan Express	28
S32_1374	1997 BMW F650 ST	28
S32_2509	1954 Greyhound Scenicruiser	28
S32_3522	1996 Peterbilt 379 Stake Bed with Outrigger	28
S32_4289	1928 Ford Phaeton Deluxe	28
S50_1341	1930 Buick Marquette Phaeton	28
S50_1392	Diamond T620 Semi-Skirted Tanker	28
S700_1691	American Airlines: B767-300	28
S700_2047	HMS Bounty	28
S700_2466	America West Airlines B757-200	28
S700_2824	1982 Camaro Z28	28
S700_2834	ATA: B757-300	28
S700_3167	F/A 18 Hornet 1/72	28
S700_4002	American Airlines: MD-11S	28
S72_1253	Boeing X-32A JSF	28
S18_3232	1992 Ferrari 360 Spider red	53
*/

-- 4. Classic Models has a product line called "Vintage Cars." 
	-- The management wants to know the total revenue generated by this product line in the last quarter of the year 2003 (from October to December). 
	-- Write a MySQL stored procedure that takes no input parameters and returns total revenue of the "Vintage Cars" product line for the last quarter of 2003.

-- Flow (In to Out): Vintage --> Productline --> Products,Productcode --> Orderdetails, Ordernumber --> Orders, CustomerNumber --> Payments - 2003(from oct to dec)

SHOW TABLES;
SELECT * FROM ORDERS;
SELECT * FROM ORDERDETAILS;
SELECT * FROM PAYMENTS;
SELECT * FROM PRODUCTS;
SELECT * FROM PRODUCTLINES;

/*
Business Case 1 - (Sum(o.orderquantity * od.priceEach) 
Where Order_Dispatched/Shipped = Revenue Recognized (where Payment could recieve within next 90/180 days)
*/
DELIMITER $$
CREATE PROCEDURE Revenue_Vintage_Cars_01()
BEGIN
    SELECT SUM(od.quantityOrdered * od.priceEach) AS Total_Revenue
    FROM Orderdetails OD
    JOIN Orders O using( ordernumber)
    JOIN Products P using (productcode)
    JOIN Productlines PL using(productline)
    WHERE pl.productLine = 'Vintage Cars'
    AND o.shippedDate >= '2003-10-01' AND o.shippedDate <= '2003-12-31'
    AND o.status ='Shipped';
END $$
DELIMITER ;

CALL Revenue_Vintage_Cars_01();

/*
OUTPUT
Total_Revenue
306949.80
*/

/*
Business Case 2 - (Sum(p.amount)) 
Where Payment recieved = Revenue recognized 
*/

DELIMITER $$
CREATE PROCEDURE Revenue_Vintage_Cars_02()
BEGIN
    SELECT SUM(p.amount) AS Total_Rev
    FROM Payments p 
    JOIN Orders O using( customernumber)
    JOIN Orderdetails OD using(ordernumber)
    JOIN Products Pr using (productcode)
    JOIN Productlines PL using(productline)
    WHERE pl.productLine = 'Vintage Cars'
    AND p.paymentDate >= '2003-10-01' AND p.paymentDate <= '2003-12-31';
END $$
DELIMITER ;

call Revenue_Vintage_Cars_02();	

/*
OUTPUT 
Total_Rev
17049079.67
*/

-- 5. Write an SQL query using CTE's and window functions inside it to retrieve the top 5 customers along with their total order values across all orders.
-- Flow (In to out) : Payments --> customernumber; Orders --> customernumber, ordernumber; Orderdetails --> productcode, quantityordered, Customers --> customernumber, customername.

WITH Top_5_Cus_CTE
AS 
(
	SELECT distinct C.customernumber, C.customername,
    SUM(OD.priceEach * OD.quantityordered) OVER(PARTITION BY customernumber) AS Total_Amount
    FROM Customers C 
    INNER JOIN Orders O Using(Customernumber)
    INNER JOIN Orderdetails OD using(ordernumber)
    ORDER BY Total_Amount DESC
    LIMIT 5)
    
SELECT * FROM Top_5_Cus_CTE;

/*
OUTPUT
customernumber, customername, Total_Amount
141	Euro+ Shopping Channel	820689.54
124	Mini Gifts Distributors Ltd.	591827.34
114	Australian Collectors, Co.	180585.07
151	Muscle Machine Inc	177913.95
119	La Rochelle Gifts	158573.12
*/
																
                                                                
/*
WITH Top_5_Cus_CTE
AS 
(
	SELECT distinct *, 
    SUM(P.amount) OVER(PARTITION BY Customernumber RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Total_Amount
    FROM Customers C 
    INNER JOIN Orders O Using(Customernumber)
    INNER JOIN Orderdetails OD using(ordernumber)
    INNER JOIN Payments P using(Customernumber)
    
    ORDER BY Total_Amount DESC)
    -- LIMIT 5)
    
SELECT * FROM Top_5_Cus_CTE;
*/

# 6 What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.

SELECT Concat(firstname, space(1), lastname) as Fullname, JobTitle
FROM EMPLOYEES 
WHERE Jobtitle regexp 'vp' or jobtitle regexp 'manager';

/*
Fullname, JobTitle
Mary Patterson	VP Sales
Jeff Firrelli	VP Marketing
William Patterson	Sales Manager (APAC)
Gerard Bondur	Sale Manager (EMEA)
Anthony Bow	Sales Manager (NA)
*/

# 7 Are there any products that appear on all orders?
SELECT distinct Od.ProductCode
FROM OrderDetails OD 
INNER JOIN Orders O using(Ordernumber)
INNER JOIN Products P using(ProductCode)
WHERE P.ProductCode = Od.ProductCode; 

/*
ProductCode
S10_1949
S10_4757
S10_4962
S12_1099
S12_1108
S12_3148
S12_3380
S12_3891
S12_3990
S12_4675
S18_1129
S18_1589
S18_1889
S18_1984
S18_2238
S18_2870
S18_3232
S18_3278
S18_3482
S18_3685
S18_4027
other values are truncated due to space
*/

# 8 Reports those products that have been sold with a markup of 100% or more (i.e.,  the priceEach is at least twice the buyPrice)

DELIMITER $$
CREATE PROCEDURE NUMBER_PROFIT(IN INPUT_NUMBER INT)
BEGIN 
	(SELECT  OD.Ordernumber,ProductCode, productName, ProductLine, BuyPrice, od.priceEach , MSRP
	FROM products p
	INNER JOIN Orderdetails OD using(ProductCode)
	WHERE PriceEach > (buyprice * input_number)  
	having buyPrice < (OD.PRICEEACH ) 
	ORDER BY MSRP ASC);
END $$
DELIMITER ;

# 9 Which customers have a digit in their name?
SELECT CUSTOMERNAME FROM CUSTOMERS
WHERE CUSTOMERNAME REGEXP '[0-9]';

# 10 What is the difference in days between the most recent and oldest order date in the Orders file?
SELECT DATEDIFF(MAX(ORDERDATE),MIN(ORDERDATE)) AS Difference_btwn_Orders_date
FROM ORDERS;

# 11 Compute the commission for each sales representative, assuming the commission is 5% of the value of an order. Sort by employee last name and first name.

SELECT e.lastName AS Last_Name, e.firstName AS First_Name, o.orderNumber AS Order_Number, o.orderDate AS Order_Date, SUM(od.priceEach * od.quantityOrdered) AS Order_Value, (SUM(od.priceEach * od.quantityOrdered) * 0.05) AS Commission
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
WHERE e.jobTitle = 'Sales Rep'
GROUP BY e.employeeNumber, o.orderNumber
ORDER BY Last_Name, First_Name, Order_Number;

# 12 List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?

SELECT C.CustomerNumber, C.Customername, O.OrderNumber, Sum(OD.QuantityOrdered * PriceEach) as Customer_total_Order_value
FROM Orderdetails OD 
INNER JOIN Orders O using(OrderNumber)
INNER JOIN Customers C using(Customernumber)
group by 1,2,3
HAVING  Customer_total_Order_value > 25000
ORDER BY Customer_total_Order_value ASC;
													-- --------------------------- END ------------------------------- --  