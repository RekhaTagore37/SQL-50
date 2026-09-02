WITH DailySales AS (
    SELECT visited_on, SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    d1.visited_on, 
    SUM(d2.total_amount) AS amount, 
    ROUND(AVG(d2.total_amount), 2) AS average_amount
FROM DailySales d1
JOIN DailySales d2 
    ON d2.visited_on <= d1.visited_on 
    AND DATEDIFF(d1.visited_on, d2.visited_on) <= 6
GROUP BY d1.visited_on
HAVING COUNT(d2.visited_on) = 7
ORDER BY d1.visited_on;