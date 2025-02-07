#include <iostream>
#include "shapes.h"

int main() {
    Shape* shapes[] = {
        new Rectangle(4, 5),
        new Circle(3)
    };

    for(int i = 0; i < 2; i++) {
        std::cout << "Area: " << shapes[i]->area() 
                  << "\nPerimeter: " << shapes[i]->perimeter() 
                  << "\n\n";
        delete shapes[i];
    }
    
    return 0;
}
