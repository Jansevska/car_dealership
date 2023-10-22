-- CAR DEALERSHIP DDL

CREATE TABLE sales_invoice(
	invoice_id SERIAL PRIMARY KEY NOT NULL,
	date TIMESTAMP NOT NULL,
	vehicle_id INTEGER NOT NULL UNIQUE,
	customer_id INTEGER NOT NULL UNIQUE,
	salesperson_id INTEGER NOT NULL UNIQUE
);

SELECT *
FROM sales_invoice;

ALTER TABLE sales_invoice 
ADD COLUMN sale_price NUMERIC(8,2) NOT NULL;

SELECT *
FROM sales_invoice ;

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone_number INTEGER UNIQUE,
	address VARCHAR(100) NOT NULL
);

SELECT *
FROM customer;

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	pay_rate NUMERIC(5,2),
	sales_comission NUMERIC(10,2)
);

SELECT *
FROM salesperson;

ALTER TABLE sales_invoice 
ADD FOREIGN key(customer_id) REFERENCES customer(customer_id);

ALTER TABLE sales_invoice 
ADD FOREIGN key(salesperson_id) REFERENCES salesperson(salesperson_id);

SELECT *
FROM sales_invoice ;

CREATE TABLE vehicle(
	vehicle_id SERIAL PRIMARY KEY,
	vehicle_serial_num INTEGER NOT NULL UNIQUE,
	make VARCHAR(25) NOT NULL,
	model VARCHAR(25) NOT NULL,
	vehicle_year INTEGER NOT NULL,
	value_price NUMERIC(8,2)
);

SELECT *
FROM vehicle;

ALTER TABLE sales_invoice 
ADD FOREIGN KEY(vehicle_id) REFERENCES vehicle(vehicle_id);

CREATE TABLE service_history(
	vehicle_serial_num INTEGER PRIMARY KEY NOT NULL UNIQUE,
	vehicle_id INTEGER UNIQUE,
	service_id INTEGER NOT NULL,
	service_ticket_id integer NOT NULL,
	service_comment TEXT
);

SELECT *
FROM service_history ;

ALTER TABLE vehicle 
ADD FOREIGN KEY(vehicle_serial_num) REFERENCES service_history(vehicle_serial_num);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	LAST_name VARCHAR(50) NOT NULL,
	pay_rate NUMERIC(6,2) NOT NULL
);

SELECT *
FROM mechanic ;

CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_type VARCHAR(50),
	service_rate NUMERIC(7,2)
);

SELECT *
FROM service;

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	date_in TIMESTAMP NOT NULL,
	date_out TIMESTAMP NOT NULL,
	vehicle_id INTEGER NOT NULL UNIQUE,
	FOREIGN KEY(vehicle_id) REFERENCES vehicle(vehicle_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	service_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	vehicle_status VARCHAR(50) NOT NULL,
	service_comment TEXT,
	service_totalcost NUMERIC(7,2)
);

SELECT *
FROM service_ticket;

CREATE TABLE service_garage(
	vehicle_status VARCHAR(25) PRIMARY KEY,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	service_ticket_id INTEGER NOT NULL UNIQUE,
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id),
	service_id INTEGER NOT NULL UNIQUE,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	hours_total INTEGER NOT NULL
);

SELECT *
FROM service_garage

ALTER TABLE service_garage 
ADD COLUMN service_comment TEXT;

SELECT *
FROM service_garage














