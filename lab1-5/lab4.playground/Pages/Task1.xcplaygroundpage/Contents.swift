
/*
 ## 1. Выбранный метод

 map

 ## 2. Краткое описание

 Метод map проходит по всем элементам массива и преобразует каждый элемент
 по заданному правилу. Правило передается в виде замыкания.
 В результате создается новый массив с измененными значениями.

 ## 5. Что происходит "под капотом"

 map создает новый массив, затем последовательно перебирает элементы
 исходного массива. Для каждого элемента вызывается замыкание, которое
 преобразует значение. Полученный результат добавляется в новый массив.
 */

let numbers = [1, 2, 3, 4, 5]

// 3. Пример использования встроенного метода map.
let doubledNumbersUsingMap = numbers.map {
    number in number * 2
}

print("Встроенный map: \(doubledNumbersUsingMap)")

// 4. Собственный аналог map без использования встроенных функций высшего порядка.
func myMap(_ array: [Int], transform: (Int) -> Int) -> [Int] {
    var result: [Int] = []

    for element in array {
        let newElement = transform(element)
        result.append(newElement)
    }

    return result
}

let doubledNumbersUsingMyMap = myMap(numbers) { number in
    number * 2
}

print("Собственный myMap: \(doubledNumbersUsingMyMap)")

// Обычный код без отдельной функции: цикл, преобразование и накопление результата.
var doubledNumbersUsingLoop: [Int] = []

for number in numbers {
    let doubledNumber = number * 2
    doubledNumbersUsingLoop.append(doubledNumber)
}

print("Обычный цикл: \(doubledNumbersUsingLoop)")
