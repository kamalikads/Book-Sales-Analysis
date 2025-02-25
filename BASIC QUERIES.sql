-- Q1. Retrieve all books in the “Fiction” genre.
SELECT
	Book_ID,
    Title,
    Author,
    Published_Year,
    Price,
    Stock 
FROM books
WHERE 
	Genre='Fantasy';
    
-- Q2.Find books published after the year 1950.
SELECT 
    Book_ID, Title, Author, Genre, Price, Stock
FROM
    books
WHERE
    Published_Year > 1950;
    
-- Q3.List all customers from Canada.

SELECT Customer_ID,Name,Email,Phone,City,country
FROM CUSTOMERS
WHERE
	COUNTRY = 'Canada';
    
-- Q4. Show orders placed in November 2023.

SELECT 
	Order_ID,
    Customer_ID,
    Book_ID,
    Quantity,
    Total_Amount
FROM orders
WHERE YEAR(Order_Date) = 2023 AND
MONTH(Order_Date) = 11;

-- Q5.Retrieve the total stock of books available

SELECT
	SUM(Stock)
FROM books;

-- Q6.Find the details of the most expensive book.

SELECT 
	Book_ID,
    Title,
    Author,
    Genre,
    Published_Year,
    Price,
    Stock
FROM books
WHERE
	price = (SELECT 
					MAX(Price)
			 FROM books)
ORDER BY
	price DESC;


-- Q7.Show all customers who ordered more than 1 quantity of a book.
SELECT 
	CU.Name 'Customer Name',
	CU.Email,
    Bk.Title,
    BK.Genre,
    OD.Quantity
 FROM customers  CU
JOIN orders  OD ON CU.Customer_ID = OD.Customer_ID
JOIN books BK ON OD.Book_ID = BK. Book_ID
 WHERE OD.Quantity > 1;
 -- Q8. Retrieve all orders where the total amount exceeds $20.
 
 SELECT 
	bk.Book_ID,
    (bk.Price * od.Quantity) AS total_Amount 
FROM books bk
LEFT JOIN orders od ON od.Book_ID = bk.Book_ID
WHERE (bk.Price * od.Quantity) = 20;
 
--  Q9.List all genres available in the Books table.

SELECT 
	DISTINCT(Genre)
FROM Books;
 -- Q10.Find the book with the lowest stock.
SELECT
	*
FROM books
 WHERE Stock = (
SELECT MIN(Stock) FROM books
)
LIMIT 1;

--  Q11.Calculate the total revenue generated from all orders

SELECT 
	ROUND(SUM(Total_Amount)) AS Total_Revenue
FROM orders;

 