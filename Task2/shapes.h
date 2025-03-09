#ifndef SHAPES_H // Защита от повторного включения
#define SHAPES_H

#include <cmath>    // Для M_PI и математических функций
#include <stdexcept> // Для исключений

// Базовый абстрактный класс фигуры
class Shape {
public:
    virtual double area() const = 0;      // Чисто виртуальный метод площади
    virtual double perimeter() const = 0; // Чисто виртуальный метод периметра
    virtual ~Shape() = default;           // Виртуальный деструктор
};

// Класс прямоугольника
class Rectangle : public Shape {
    double width;  // Ширина
    double height; // Высота
public:
    Rectangle(double w, double h); // Конструктор
    double area() const override;     // Переопределение метода площади
    double perimeter() const override; // Переопределение метода периметра
};

// Класс круга
class Circle : public Shape {
    double radius; // Радиус
public:
    Circle(double r); // Конструктор
    double area() const override;     // Переопределение метода площади
    double perimeter() const override; // Переопределение метода периметра
};

#endif // SHAPES_H
