import pytest
   from sum_negatives import sum_negatives_between_min_max

   def test_basic():
       assert sum_negatives_between_min_max([3, -2, 5, -1, 4, -7, 8]) == -8

   def test_empty_array():
       assert sum_negatives_between_min_max([]) == 0

   def test_no_negatives():
       assert sum_negatives_between_min_max([1, 2, 3]) == 0

   def test_min_after_max():
       assert sum_negatives_between_min_max([5, -3, -1, 2]) == -3

   def test_all_same():
       assert sum_negatives_between_min_max([4, 4, 4]) == 0

   if __name__ == "__main__":
       pytest.main(
