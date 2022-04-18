CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(30)
);

CREATE TABLE parts_inventory(
	parts_inventory_id SERIAL PRIMARY KEY,
	name_of_part VARCHAR(100),
	price NUMERIC(6, 2),
	quantity NUMERIC(3)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	seller_invoice_id INTEGER NOT NULL,
	FOREIGN KEY (seller_invoice_id) REFERENCES car(car_id),
	buyer_invoice_id INTEGER NOT NULL,
	FOREIGN KEY (buyer_invoice_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES car(car_id),
	make VARCHAR(30),
	model VARCHAR(30),
	year_ NUMERIC(4)
);

CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	type_of_service VARCHAR(30),
	service_total NUMERIC(6, 2)
);

CREATE TABLE IF NOT EXISTS seller_invoice(
	seller_invoice_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
	date_of_purchase DATE,
	amount NUMERIC(8, 2)
);

CREATE TABLE IF NOT EXISTS buyer_invoice(
	buyer_invoice_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	date_of_purchase DATE,
	amount NUMERIC(8, 2)
);