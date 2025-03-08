#include <iostream>
#include <iomanip>
#include <memory>
#include "shapes.h"

int main() {
    try {
        std::unique_ptr<Shape> shapes[] = {
            std::make_unique<Rectangle>(4, 5),
            std::make_unique<Circle>(3)
        };

        std::cout << std::fixed << std::setprecision(2);
        for (const auto& shape : shapes) {
            std::cout << "Area: " << shape->area() 
                      << "\nPerimeter: " << shape->perimeter() 
                      << "\n\n";
        }
    } catch (const std::invalid_argument& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
