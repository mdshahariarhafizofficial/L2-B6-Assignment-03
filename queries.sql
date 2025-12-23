-- Query 1: JOIN - Retrieve booking information with customer and vehicle names
SELECT
b.booking_id,
u.name AS customer_name,
v.name AS vehicle_name,
b.start_date,
b.end_date,
b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id
ORDER BY b.booking_id;

