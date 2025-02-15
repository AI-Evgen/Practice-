USE tourism;

INSERT INTO clients (name, email, phone) VALUES
('Иван Петров', 'ivan@example.com', '+79161234567'),
('Мария Сидорова', 'maria@example.com', '+79167654321');

INSERT INTO tours (title, description, price, duration_days) VALUES
('Тур в Париж', 'Экскурсия по достопримечательностям Парижа', 1500.00, 7),
('Отдых на Бали', 'Пляжный отдых и спа-процедуры', 2500.00, 10);

INSERT INTO services (name, cost) VALUES
('Страховка', 100.00),
('Трансфер', 50.00);

INSERT INTO employees (full_name, position) VALUES
('Алексей Иванов', 'Менеджер'),
('Ольга Смирнова', 'Консультант');

INSERT INTO orders (client_id, tour_id, service_id, employee_id) VALUES
(1, 1, 1, 1),
(2, 2, NULL, 2);
