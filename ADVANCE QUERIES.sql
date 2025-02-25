-- Q1. Retrieve the total number of books sold for each genre
SELECT 
    BK.Genre, SUM(OD.Quantity) total_sold
FROM
    orders OD
        JOIN
    books BK ON OD.Book_ID = BK.Book_ID
GROUP BY BK.Genre;
-- Q2. Find the average price of books in the “Fantasy” genre
SELECT 
	Genre,
	AVG(Price)
FROM books
GROUP BY Genre
HAVING 
	Genre = 'Fantasy';

-- Q3. Total Spending of per Customer
    
SELECT
	DISTINCT CU.Customer_ID,
    CU.Name,
    SUM(BK.Price * OD.Quantity) Total_Spent
FROM customers CU
JOIN orders OD
ON 
CU.Customer_ID = OD.Customer_ID
JOIN books BK
ON 
	BK.Book_ID = OD.Book_ID
GROUP BY 
	CU.Customer_ID, CU.Name;



-- Q4. List customers who have placed at least 2 orders

SELECT
	CU.Customer_ID,
	CU.Name,
	OD.Quantity Orders
FROM customers CU
JOIN 
	Orders OD 
ON 
	CU.Customer_ID = OD.Customer_ID
WHERE  Orders >= 2;



-- Q5. Find the most frequently ordered book
SELECT 
	Book_ID,
	COUNT(Quantity) AS Frequency_order
FROM orders
GROUP BY Book_ID
ORDER BY count(Quantity) DESC
LIMIT 1;

-- Q6. Show the top 3 most expensive books of ‘Fantasy’ Genre

SELECT 
	Title,
	price
FROM books
WHERE Genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- Q7. Retrieve the total quantity of books sold by each author
SELECT 
	BK.Author,
	SUM(OD.Quantity) Total_sold
FROM orders OD
JOIN books BK
ON 
	BK.Book_ID = OD.Book_ID
GROUP BY BK.Author;

-- Q8. List the cities where customers who spent over $30
SELECT 
	DISTINCT CU.City,
	CU.Name AS CUSTOMER,
	SUM(BK.Price * OD.Quantity) Total_Spent
FROM orders OD
JOIN customers CU
ON 
	CU.Customer_ID = OD.Customer_ID
JOIN books BK
ON BK.Book_ID = OD.Book_ID
GROUP BY CU.City, CUSTOMER
HAVING
	Total_Spent > 30;

--  Q9. Find the customer who spent the most on orders
SELECT 
	CU.Name CUSTOMER,
	SUM(BK.Price * OD.Quantity) Total_Spent
FROM orders OD
JOIN customers CU
ON 
	CU.Customer_ID = OD.Customer_ID
JOIN books BK
ON BK.Book_ID = OD.Book_ID
GROUP BY CUSTOMER
ORDER BY 
	Total_Spent DESC
    LIMIT 1;

-- Q10.Calculate the stock remaining after fulfilling all orders
SELECT
	BK.Title,
	SUM(BK.Stock - OD.Quantity) Remaining_stock
	FROM books BK
JOIN orders OD
ON BK.Book_ID = OD.Book_ID
GROUP BY BK.Title;
