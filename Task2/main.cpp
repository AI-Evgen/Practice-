#include <iostream>
#include "shapes.h"

int main() {
    Shape* shapes[] = {
        new Rectangle(4, 5),
        new Circle(3)
    };

    // Используем обычный цикл for вместо range-based
    for (size_t i = 0; i < 2; ++i) {
        Shape* shape = shapes[i];
        std::cout << "Area: " << shape->area() 
                  << "\nPerimeter: " << shape->perimeter() 
                  << "\n\n";
        delete shape;  // Освобождаем память
    }

    return 0;
}
