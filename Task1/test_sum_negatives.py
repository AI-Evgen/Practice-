import pytest
from sum_negatives import sum_negatives_between_min_max

def test_basic_case():
    arr = [3, -2, 5, -1, 4, -7, 8]
    assert sum_negatives_between_min_max(arr) == -8  # -1 + (-7) = -8

def test_empty_array():
    assert sum_negatives_between_min_max([]) == 0

def test_all_positive():
    arr = [1, 2, 3]
    assert sum_negatives_between_min_max(arr) == 0

def test_min_after_max():
    arr = [5, -3, -1, 2]  # min=-3 (индекс 1), max=5 (индекс 0)
    assert sum_negatives_between_min_max(arr) == -3

def test_all_same_elements():
    arr = [4, 4, 4]
    assert sum_negatives_between_min_max(arr) == 0

def test_no_negatives_between():
    arr = [10, -5, 20, -3, 30]
    assert sum_negatives_between_min_max(arr) == 0  # Между -5 (min) и 30 (max) нет отрицательных
