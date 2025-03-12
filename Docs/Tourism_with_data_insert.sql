-- Создание базы данных
CREATE DATABASE Tourism;
GO

USE Tourism;

-- Таблица "Туры"
CREATE TABLE Tours (
    TourID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    DurationDays INT NOT NULL
);

-- Таблица "Заказы"
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    ClientName NVARCHAR(100) NOT NULL,
    TourID INT NOT NULL,
    OrderDate DATE DEFAULT GETDATE()
);

-- Добавление внешних ключей
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Tours
FOREIGN KEY (TourID) REFERENCES Tours(TourID);

-- Индексы для оптимизации запросов
CREATE INDEX idx_Tours_Title ON Tours(Title);
CREATE INDEX idx_Orders_TourID ON Orders(TourID);

-- Вставка тестовых данных
BEGIN TRANSACTION;

INSERT INTO Tours (Title, Price, DurationDays)
VALUES 
    (N'Тур в Париж', 1500.00, 7),
    (N'Отдых на Бали', 2500.00, 10),
    (N'Экскурсия по Риму', 1200.00, 5);

INSERT INTO Orders (ClientName, TourID)
VALUES 
    (N'Иван Петров', 1),
    (N'Мария Сидорова', 2),
    (N'Алексей Иванов', 3);

COMMIT;
