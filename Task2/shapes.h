#pragma once
#include <cmath>
#include <stdexcept>

/**
 * @brief Базовый класс для геометрических фигур.
 */
class Shape {
public:
    virtual double area() const = 0;
    virtual double perimeter() const = 0;
    virtual ~Shape() = default;
};

/**
 * @brief Класс прямоугольника.
 */
class Rectangle : public Shape {
    double width;
    double height;
public:
    Rectangle(double w, double h);
    double get_width() const { return width; }
    double get_height() const { return height; }
    double area() const override;
    double perimeter() const override;
};

/**
 * @brief Класс окружности.
 */
class Circle : public Shape {
    double radius;
public:
    Circle(double r);
    double get_radius() const { return radius; }
    double area() const override;
    double perimeter() const override;
};
