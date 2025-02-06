class Shape:
    """Базовый класс для геометрических фигур."""
    def area(self):
        raise NotImplementedError("Метод area() должен быть переопределен")

    def perimeter(self):
        raise NotImplementedError("Метод perimeter() должен быть переопределен")

class Rectangle(Shape):
    """Производный класс: Прямоугольник."""
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return 2 * (self.width + self.height)

class Circle(Shape):
    """Производный класс: Круг."""
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.1415 * self.radius ** 2

    def perimeter(self):
        return 2 * 3.1415 * self.radius
