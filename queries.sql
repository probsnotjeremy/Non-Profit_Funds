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

-- 1. List all donations with donor names
SELECT donors.name, donations.amount, donations.date
FROM donations
JOIN donors ON donors.id = donations.donor_id;

-- 2. Total donations per donor
SELECT donors.name, SUM(donations.amount) AS total_donated
FROM donations
JOIN donors ON donors.id = donations.donor_id
GROUP BY donors.name;

-- 3. Donations received at each event
SELECT events.name, SUM(donations.amount) AS total_event_donations
FROM donations
JOIN events ON events.id = donations.event_id
GROUP BY events.name;

-- 4. Expenses linked to events
SELECT events.name, expenses.category, expenses.amount
FROM expenses
JOIN events ON events.id = expenses.event_id;

-- 5. Net revenue per event (donations - expenses)
SELECT e.name,
       IFNULL(SUM(d.amount), 0) - IFNULL(SUM(x.amount), 0) AS net_revenue
FROM events e
LEFT JOIN donations d ON e.id = d.event_id
LEFT JOIN expenses x ON e.id = x.event_id
GROUP BY e.name;
