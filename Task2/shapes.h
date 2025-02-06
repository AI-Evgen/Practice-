#pragma once

class Shape {
public:
    virtual double area() const = 0;
    virtual double perimeter() const = 0;
    virtual ~Shape() = default;
};

// Объявления производных классов
class Rectangle : public Shape {
    double width;
    double height;
public:
    Rectangle(double w, double h);
    double area() const override;
    double perimeter() const override;
};

class Circle : public Shape {
    double radius;
public:
    Circle(double r);
    double area() const override;
    double perimeter() const override;
};
