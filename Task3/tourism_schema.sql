CREATE DATABASE IF NOT EXISTS tourism;
USE tourism;

CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE tours (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) CHECK (price > 0),
    duration_days INT NOT NULL
);

CREATE TABLE services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) CHECK (cost > 0)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    tour_id INT NOT NULL,
    service_id INT,
    employee_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    status ENUM('оформлен', 'отменен', 'завершен') DEFAULT 'оформлен',
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE INDEX idx_orders_client ON orders(client_id);
CREATE INDEX idx_orders_tour ON orders(tour_id);
