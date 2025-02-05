def sum_negatives_between_min_max(arr):
    """Находит сумму отрицательных элементов между первыми вхождениями min и max."""
    if not arr:
        return 0

    min_val = max_val = arr[0]
    min_idx = max_idx = 0

    # Находим первые вхождения min и max
    for i, num in enumerate(arr):
        if num < min_val:
            min_val, min_idx = num, i
        if num > max_val:
            max_val, max_idx = num, i

    # Определяем границы диапазона
    start = min(min_idx, max_idx) + 1
    end = max(min_idx, max_idx)

    # Суммируем отрицательные элементы
    return sum(x for x in arr[start:end] if x < 0)
