#include <iostream>
#include <vector>       // Для std::vector
#include <memory>       // Для умных указателей
#include "shapes.h"     // Подключаем наши классы

int main() {
    try {
        // Создаем вектор умных указателей на фигуры
        std::vector<std::unique_ptr<Shape>> shapes;
        shapes.push_back(std::make_unique<Rectangle>(4, 5)); // Прямоугольник 4x5
        shapes.push_back(std::make_unique<Circle>(3));       // Круг с радиусом 3

        // Настраиваем вывод чисел с фиксированной точностью
        std::cout << std::fixed << std::setprecision(2);

        // Выводим информацию о каждой фигуре
        for (const auto& shape : shapes) {
            std::cout << "Площадь: " << shape->area() 
                      << "\nПериметр: " << shape->perimeter() 
                      << "\n\n";
        }
    } 
    catch (const std::exception& e) {
        // Обработка ошибок (например, отрицательные размеры)
        std::cerr << "Ошибка: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}
