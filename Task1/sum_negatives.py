def sum_negatives_between_min_max(arr):
    if not arr:
        return 0  # Пустой массив
    
    # Инициализация min и max
    min_val = max_val = arr[0]
    min_idx = max_idx = 0
    
    # Поиск индексов min и max
    for i, num in enumerate(arr):
        if num < min_val:
            min_val, min_idx = num, i
        if num > max_val:
            max_val, max_idx = num, i
    
    # Определение границ
    start = min(min_idx, max_idx) + 1
    end = max(min_idx, max_idx)
    
    # Суммирование отрицательных элементов
    return sum(x for x in arr[start:end] if x < 0)

# Примеры тестов
print(sum_negatives_between_min_max([3, -2, 5, -1, 4, -7, 8]))  # -8 (-1 + -7)
print(sum_negatives_between_min_max([1, 2, 3]))  # 0 (нет отрицательных)
print(sum_negatives_between_min_max([-5, -3, -1]))  # 0 (min и max на краях)
