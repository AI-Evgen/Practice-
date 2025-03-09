#include "shapes.h"
#include <stdexcept> // Для исключений

// Конструктор прямоугольника
Rectangle::Rectangle(double w, double h) : width(w), height(h) {
    if (w <= 0 || h <= 0) {
        throw std::invalid_argument("Ширина и высота должны быть положительными");
    }
}

// Расчет площади прямоугольника
double Rectangle::area() const { 
    return width * height; 
}

// Расчет периметра прямоугольника
double Rectangle::perimeter() const { 
    return 2 * (width + height); 
}

// Конструктор круга
Circle::Circle(double r) : radius(r) {
    if (r <= 0) {
        throw std::invalid_argument("Радиус должен быть положительным");
    }
}

// Расчет площади круга
double Circle::area() const { 
    return M_PI * radius * radius; 
}

// Расчет длины окружности (периметра)
double Circle::perimeter() const { 
    return 2 * M_PI * radius; 
}
