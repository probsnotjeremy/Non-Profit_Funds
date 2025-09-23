-- Show all rows
SELECT * FROM expenses;

-- Filter by category
SELECT * FROM expenses WHERE category = 'Events';

-- Total spent by category
SELECT category, SUM(amount) AS total
FROM expenses
GROUP BY category;

-- Biggest expenses first
SELECT category, amount
FROM expenses
ORDER BY amount DESC
LIMIT 3;
