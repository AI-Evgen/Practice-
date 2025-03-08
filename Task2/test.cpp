#include "shapes.h"
#include <cmath>
#include <cassert>

int main() {
    // Тестирование прямоугольника
    {
        Rectangle rect(4.0, 5.0);
        
        // Проверка площади
        const double expected_area = 20.0;
        assert(rect.area() == expected_area && "Rectangle area calculation failed");
        
        // Проверка периметра
        const double expected_perimeter = 18.0;
        assert(rect.perimeter() == expected_perimeter && "Rectangle perimeter calculation failed");
    }

    // Тестирование круга
    {
        const double radius = 3.0;
        Circle circle(radius);
        const double tolerance = 0.0001; // Погрешность для сравнения double
        
        // Проверка площади
        const double expected_area = M_PI * radius * radius;
        assert(std::abs(circle.area() - expected_area) < tolerance && "Circle area calculation failed");
        
        // Проверка периметра (длины окружности)
        const double expected_perimeter = 2 * M_PI * radius;
        assert(std::abs(circle.perimeter() - expected_perimeter) < tolerance && "Circle perimeter calculation failed");
    }

    // Дополнительные тесты
    {
        // Тест на нулевые значения (если поддерживается классом)
        // assert(throws_exception([](){ Rectangle(0, 5); }));
        
        // Тест на отрицательные значения
        // assert(throws_exception([](){ Circle(-1); }));
    }

    return 0;
}
