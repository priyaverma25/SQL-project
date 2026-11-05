-- # Recclable and low fat products
-- select product-id
-- from products
-- where low_fat = 'Y' and recyclable = 'Y'
 
-- # Not Boring Movies 
-- select * from cinema
-- where id % 2 != 0
-- and description != 'boring'
-- order by rating  desc

-- # Find Customer Referee
-- select name
-- from customers
-- where referee_id !=2
-- or referee_id is null 
 
-- -- Customer Placing the Largest Number of Orders
-- SELECT customer_number
-- FROM Orders
-- GROUP BY customer_number
-- ORDER BY COUNT(order_number) DESC
-- LIMIT 1;

-- SELECT customer_number
-- FROM Orders
-- GROUP BY customer_number
-- HAVING COUNT(order_number) = (
--     SELECT MAX(order_count)
--     FROM (
--         SELECT COUNT(order_number) AS order_count
--         FROM Orders
--         GROUP BY customer_number
--     ) AS temp
-- );


-- -- Classes With at Least 5 Students 

-- SELECT class
-- FROM Courses
-- GROUP BY class
-- HAVING COUNT(student) >= 5;


-- -- -- Monthly Transactions I
-- SELECT
--     DATE_FORMAT(trans_date, '%Y-%m') AS month,
--     country,
--     COUNT(*) AS trans_count,
--     SUM(state = 'approved') AS approved_count,
--     SUM(amount) AS trans_total_amount,
--     SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
-- FROM Transactions
-- GROUP BY month, country;

-- -- User Activity for the Past 30 Days I
-- SELECT
--   activity_date AS day,
--   COUNT(DISTINCT user-id) AS active_users,
-- FROM Activity
-- WHERE
--   activity_date >= '2019-06-28' AND activity_date <= '2019-07-27'
-- GROUP BY activity_date  

-- -- Students and Examinations
-- SELECT
--     s.student_id,
--     s.student_name,
--     sub.subject_name,
--     COUNT(e.subject_name) AS attended_exams
-- FROM Students s
-- CROSS JOIN Subjects sub
-- LEFT JOIN Examinations e
--     ON s.student_id = e.student_id
--     AND sub.subject_name = e.subject_name
-- GROUP BY
--     s.student_id,
--     s.student_name,
--     sub.subject_name
-- ORDER BY
--     s.student_id,
--     sub.subject_name;

-- -- Customers Who Bought All Products
-- SELECT customer_id
-- FROM Customer
-- GROUP BY customer_id
-- HAVING COUNT(DISTINCT product_key) = (
--     SELECT COUNT(*) FROM Product
-- );

-- -- Tree Node
-- SELECT
--     id,
--     CASE
--         WHEN p_id IS NULL THEN 'Root'
--         WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
--         ELSE 'Leaf'
--     END AS type
-- FROM Tree;

-- -- Movie Rating
-- (SELECT u.name AS results
-- FROM Users u
-- JOIN MovieRating mr
-- ON u.user_id = mr.user_id
-- GROUP BY u.user_id, u.name
-- ORDER BY COUNT(*) DESC, u.name ASC
-- LIMIT 1)

-- UNION ALL

-- (SELECT m.title AS results
-- FROM Movies m
-- JOIN MovieRating mr
-- ON m.movie_id = mr.movie_id
-- WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
-- GROUP BY m.movie_id, m.title
-- ORDER BY AVG(rating) DESC, m.title ASC
-- LIMIT 1); 

-- -- Trips and Users
-- SELECT
--     request_at AS Day,
--     ROUND(
--         SUM(status != 'completed') / COUNT(*),
--         2
--     ) AS `Cancellation Rate`
-- FROM Trips t
-- JOIN Users c
--     ON t.client_id = c.users_id
-- JOIN Users d
--     ON t.driver_id = d.users_id
-- WHERE
--     c.banned = 'No'
--     AND d.banned = 'No'
--     AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
-- GROUP BY request_at;

-- Rank Scores
SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores
ORDER BY score DESC;
