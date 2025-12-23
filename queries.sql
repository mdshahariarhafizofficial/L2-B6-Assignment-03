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

-- Query 2: EXISTS - Find all vehicles that have never been booked
SELECT
v.id AS vehicle_id,
v.name,
v.type,
v.model,
v.registration_number,
v.rental_price,
v.status
FROM vehicles v
WHERE NOT EXISTS (
SELECT 1
FROM bookings b
WHERE b.vehicle_id = v.id
);

-- Query 3: WHERE - Retrieve all available vehicles of a specific type (e.g. cars)
SELECT
v.id AS vehicle_id,
v.name,
v.type,
v.model,
v.registration_number,
v.rental_price,
v.status
FROM vehicles v
WHERE v.type = 'car'
AND v.status = 'available';

