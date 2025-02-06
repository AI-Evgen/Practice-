#include <iostream>
#include "shapes.h"

int main() {
    Shape* shapes[] = {
        new Rectangle(4, 5),
        new Circle(3)
    };

    for (auto* shape : shapes) {
        std::cout << "Area: " << shape->area() 
                  << "\nPerimeter: " << shape->perimeter() 
                  << "\n\n";
        delete shape;
    }
    
    return 0;
}
