import pytest
from shapes import Rectangle, Circle

def test_rectangle_area():
    rect = Rectangle(4, 5)
    assert rect.area() == 20

def test_rectangle_perimeter():
    rect = Rectangle(3, 6)
    assert rect.perimeter() == 18

def test_circle_area():
    circle = Circle(2)
    assert round(circle.area(), 2) == 12.57

def test_circle_perimeter():
    circle = Circle(3)
    assert round(circle.perimeter(), 2) == 18.85
