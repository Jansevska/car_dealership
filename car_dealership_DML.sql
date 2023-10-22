-- CAR DEALERSHIP DML 


-- ADD CUSTOMER PROCEDURE


CREATE OR REPLACE PROCEDURE add_customer (
	first_name VARCHAR(50), 
	last_name VARCHAR(50),
	phone_number VARCHAR,
	address VARCHAR(100),
	email VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, phone_number, address, email)
	VALUES (first_name, last_name, phone_number, address, email);
END
$$

CALL add_customer ('Bubbles', 'McTickles', '(808)998-7345', '123 Giggle Street, Laughter Town, JOY 45678', 'bmctickles@joy.com');
CALL add_customer ('Chuckles', 'Wigglesworth', '(808)765-4839', '567 Hilarity Lane, Guffawville, HAHA 78901', 'cwigglesworth@haha.com');
CALL add_customer ('Snickers', 'Doodleheimer', '(808)344-8765', '987 Chuckle Road, Comedy Heights, LOL 12345', 'sdoodle@lol.com');
CALL add_customer ('Lili', 'Kawai', '(808)669-1300', '243 Honoapiilani Road, Kahana, HI, 96761', 'liliwai@808.com');


DROP PROCEDURE IF EXISTS add_customer;

SELECT *
FROM customer c 
ORDER BY customer_id


-- ADD SALESPERSON PROCEDURE

SELECT *
FROM salesperson s 

INSERT INTO salesperson (first_name, last_name, pay_rate, sales_comission)
VALUES ('Ziggy', 'Salesman', 32.12, 5600.50 );

CREATE OR REPLACE PROCEDURE add_salesperson (
	first_name VARCHAR(50), 
	last_name VARCHAR(50),
	pay_rate NUMERIC(5,2),
	sales_comission NUMERIC(6,2))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO salesperson(first_name, last_name, pay_rate , sales_comission)
	VALUES (first_name, last_name, pay_rate, sales_comission);
END
$$

CALL add_salesperson ('Penny', 'Vendor', 18.50, 4500.00);
CALL add_salesperson ('Artie', 'Dealerman', 22.00, 7000.00);
CALL add_salesperson ('Olive', 'Sellsalot', 32.50, 9750.00);

SELECT *
FROM salesperson s 
ORDER BY salesperson_id 


-- ADD VEHICLE 

SELECT *
FROM vehicle v 

CREATE OR REPLACE PROCEDURE add_vehicle (
	make VARCHAR(50), 
	model VARCHAR(50),
	vehicle_year INTEGER,
	vin VARCHAR(17),
	value_price NUMERIC(10,2)
	)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO vehicle (make, model, vehicle_year, vin, value_price)
	VALUES (make, model, vehicle_year, vin, value_price);
END
$$


CALL add_vehicle ('Toyota', 'Tacoma', 2022, '1HGCM82633A123456', 39150.00);
CALL add_vehicle ('Ford', 'Mustang', 2023, '1FA6P8CF2F5326547', 37205.00);
CALL add_vehicle ('Honda', 'CR-V', 2020, '2HKRW2H80L1237890', 29050.00);
CALL add_vehicle ('Chevrolet', 'Silverado', 2023, '3GCUKREC5FG211223', 55995.00);
CALL add_vehicle ('BMW', 'X5', 2023, '5UXKR0C50J0X12345', 69400.00);
CALL add_vehicle ('Mercedes_Benz', 'E-Class', 2019, 'WDDZF4JB4HA123456', 54050.00);
CALL add_vehicle ('Audi', 'Q7', 2018, 'WA1LAAF77HD123456', 54950.00);
CALL add_vehicle ('Nissan', 'Frontier', 2021, '5N1AT2MT5FC123456', 32190.00);
CALL add_vehicle ('Tesla', 'X', 2022, '5NPEC4AC2EH123456', 89990.00);
CALL add_vehicle ('Tesla', 'Roadster', 2023, '5XXGM4A71DG123456', 200000.00);

SELECT *
FROM vehicle v 


-- ADD sales_invoice

CREATE OR REPLACE PROCEDURE add_sales_invoice (
	date TIMESTAMP,
	vehicle_id INTEGER,
	customer_id INTEGER,
	salesperson_id INTEGER,
	sale_price NUMERIC(10,2)
	)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO sales_invoice(date, vehicle_id, customer_id, salesperson_id, sale_price)
	VALUES (date, vehicle_id, customer_id, salesperson_id, sale_price);
END
$$;

CALL add_sales_invoice (now()::timestamp, 11, 8, 1, 42000.00);
CALL add_sales_invoice (now()::timestamp, 14, 9, 2, 53995.00);
CALL add_sales_invoice (now()::timestamp, 17, 10, 3, 56000.00);
CALL add_sales_invoice (now()::timestamp, 19, 11, 4, 87990.00);



-- ADD MECHANIC

CREATE OR REPLACE PROCEDURE add_mechanic (
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	pay_rate NUMERIC(7,2)
	)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(first_name, last_name, pay_rate)
	VALUES (first_name, last_name, pay_rate);
END
$$

CALL add_mechanic ('Jack', 'Smith', 38.50);
CALL add_mechanic ('Jaimie', 'Johnson', 40.25);
CALL add_mechanic ('Alex', 'Jones', 42.00);

SELECT *
FROM mechanic m 


-- ADD SERVICE

CREATE OR REPLACE PROCEDURE add_service (
	service_type VARCHAR(50),
	service_rate NUMERIC(9,2)
	)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service(service_type, service_rate)
	VALUES (service_type, service_rate);
END
$$

CALL add_service ('oil change', 89.99);
CALL add_service ('break inspection and repair', 349.95);
CALL add_service ('engine tune-up', 129.99);
CALL add_service ('transmission fluid change', 99.95);
CALL add_service ('air conditioning repair', 329.99);

SELECT *
FROM service s 



-- ADD SERVICE_TICKET

CREATE OR REPLACE PROCEDURE add_service_ticket (
	check_in timestamp,
	vehicle_id INTEGER,
	customer_id INTEGER,
	service_id INTEGER,
	vehicle_status VARCHAR(25),
	service_comment TEXT,
	service_totalcost NUMERIC(9,2)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_ticket(check_in, vehicle_id, customer_id, service_id, vehicle_status, service_comment, service_totalcost)
	VALUES (check_in, vehicle_id, customer_id, service_id, vehicle_status, service_comment, service_totalcost);
END
$$

CALL add_service_ticket (now()::timestamp, 11, 8, 1, 'checked-in', 'authorized to change what is needed', 275.00);
CALL add_service_ticket (now()::timestamp, 17, 10, 2, 'checked-in', 'wants high-end breaks', 425.00);
CALL add_service_ticket (now()::timestamp, 14, 9, 3, 'checked-in', 'n/a', 129.99);




SELECT *
FROM service_ticket st 

-- ADD SERVICE GARAGE

CREATE OR REPLACE PROCEDURE add_service_garage (
	vehicle_status VARCHAR(25),
	mechanic_id INTEGER,
	service_ticket_id INTEGER,
	service_id INTEGER,
	hours_total INTEGER,
	service_comment TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_garage(vehicle_status, mechanic_id, service_ticket_id, service_id, hours_total, service_comment)
	VALUES (vehicle_status, mechanic_id, service_ticket_id, service_id, hours_total, service_comment);
END
$$

CALL add_service_garage ('checked-in', 1, 1, 1, 2, 'next oil change in 3 months or 5000 miles');
CALL add_service_garage ('checked-out', 2, 2, 2, 1, 'n/a');


SELECT *
FROM service_garage sg 

