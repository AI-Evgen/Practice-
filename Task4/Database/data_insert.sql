USE Tourism;

-- Начало транзакции для атомарности
BEGIN TRANSACTION;

-- Добавление тестовых туров
INSERT INTO Tours (Title, Price, DurationDays) 
VALUES 
    ('Тур в Париж', 1500.00, 7),
    ('Отдых на Бали', 2500.00, 10),
    ('Экскурсия по Риму', 1200.00, 5);

-- Добавление тестовых заказов
INSERT INTO Orders (ClientName, TourID) 
VALUES 
    ('Иван Петров', 1),
    ('Мария Сидорова', 2),
    ('Алексей Иванов', 3);

-- Завершение транзакции
COMMIT;
