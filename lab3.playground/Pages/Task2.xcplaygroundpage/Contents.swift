// Задание 2
// Дан массив целых чисел. Необходимо выполнить анализ его содержимого.
// Требуется определить:
// • количество положительных чисел;
// • количество отрицательных чисел;
// • количество нулевых значений;
// • максимальное значение в массиве;
// • сумму всех элементов.
// Результаты анализа необходимо вывести в консоль.

let numbers = [3, -1, 0, 7, -5, 0, 2]

let positiveCount = numbers.filter { number in
    number > 0
}.count
let negativeCount = numbers.filter { number in
    number < 0
}.count
let zeroCount = numbers.filter { number in
    number == 0
}.count
let sum = numbers.reduce(0) { currentSum, number in
    currentSum + number
}
let maxValue = numbers.max() ?? 0

print("Количество положительных чисел: \(positiveCount)")
print("Количество отрицательных чисел: \(negativeCount)")
print("Количество нулевых значений: \(zeroCount)")
print("Максимальное значение: \(maxValue)")
print("Сумма всех элементов: \(sum)")
