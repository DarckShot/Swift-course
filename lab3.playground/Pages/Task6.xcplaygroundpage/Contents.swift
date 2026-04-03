// Задание 6
// Реализуйте функцию, которая определяет, является ли число простым.
// Используя данную функцию, выведите в консоль все простые числа в диапазоне от 1 до 20.

func isPrime(number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for i in 1...20 {
    if isPrime(number: i) {
        print(i)
    }
}
