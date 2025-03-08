#include "shapes.h"
#include <stdexcept>

Rectangle::Rectangle(double w, double h) : width(w), height(h) {
    if (w <= 0 || h <= 0) {
        throw std::invalid_argument("Width and height must be positive.");
    }
}

double Rectangle::area() const { 
    return width * height; 
}

double Rectangle::perimeter() const { 
    return 2 * (width + height); 
}

Circle::Circle(double r) : radius(r) {
    if (r <= 0) {
        throw std::invalid_argument("Radius must be positive.");
    }
}

double Circle::area() const { 
    return M_PI * radius * radius; 
}

double Circle::perimeter() const { 
    return 2 * M_PI * radius; 
}
