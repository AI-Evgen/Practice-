import pytest
from sum_negatives import sum_negatives_between_min_max

def test_basic_case():
    assert sum_negatives_between_min_max([5, -3, -2, 1, -4, 7]) == 0  # -2 + (-4)

def test_empty_array():
    assert sum_negatives_between_min_max([]) == 0

def test_min_after_max():
    assert sum_negatives_between_min_max([7, -3, -5, 2]) == -3  # между 7 (max) и -5 (min)

def test_no_negatives():
    assert sum_negatives_between_min_max([1, 2, 3]) == 0

def test_all_same():
    assert sum_negatives_between_min_max([5, 5, 5]) == 0

def test_edge_case():
    assert sum_negatives_between_min_max([-5, 10, 3, -2, 8]) == 0  # нет элементов между min и max
