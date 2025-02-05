def sum_negatives_between_min_max(arr):
    """
    Находит сумму отрицательных элементов между первым вхождением минимального и максимального элементов.
    
    :param arr: Список чисел
    :return: Сумма отрицательных элементов или 0, если массив пуст или min/max совпадают
    """
    if not arr:
        return 0

    min_val = max_val = arr[0]
    min_idx = max_idx = 0

    # Поиск индексов min и max
    for i, num in enumerate(arr):
        if num < min_val:
            min_val, min_idx = num, i
        if num > max_val:
            max_val, max_idx = num, i

    # Если min и max совпадают
    if min_idx == max_idx:
        return 0

    # Определение границ
    start = min(min_idx, max_idx) + 1
    end = max(min_idx, max_idx)

    # Сумма отрицательных элементов
    return sum(x for x in arr[start:end] if x < 0)

if __name__ == "__main__":
    example_arr = [3, -2, 5, -1, 4, -7, 8]
    print(f"Пример работы программы:")
    print(f"Массив: {example_arr}")
    print(f"Сумма отрицательных элементов: {sum_negatives_between_min_max(example_arr)}")
