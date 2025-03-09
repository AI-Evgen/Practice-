-- Создание базы данных
CREATE DATABASE Tourism;
GO

USE Tourism;

-- Таблица "Туры"
CREATE TABLE Tours (
    TourID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    DurationDays INT
);

-- Индекс для поиска по названию
CREATE INDEX idx_Tours_Title ON Tours(Title);

-- Таблица "Заказы"
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    ClientName NVARCHAR(100),
    TourID INT FOREIGN KEY REFERENCES Tours(TourID),
    OrderDate DATE DEFAULT GETDATE()
);

-- Индекс для связи с Tours
CREATE INDEX idx_Orders_TourID ON Orders(TourID);
