include "shapes.h"
#include <cassert>
#include <cmath>

int main() {
    Rectangle rect(4, 5);
    assert(rect.area() == 20);
    assert(rect.perimeter() == 18);

    Circle circle(3);
    assert(std::abs(circle.area() - 28.2743) < 0.001);
    assert(std::abs(circle.perimeter() - 18.8496) < 0.001);
    return 0;
}' > test.cpp
