// ПРАКТИЧЕСКАЯ РАБОТА №2
// 1
// Создайте два множества: setA и setB. setA должен содержать числа от 1 до 10, а setB — числа от 5 до 15.
// 2
// Найдите пересечение множеств setA и setB.
// Найдите объединение множеств setA и setB.
// Найдите разность множеств setA и setB.

//3
//Проверьте, является ли setA подмножеством setB.
//Проверьте, является ли setB подмножеством setA.

//4
//Найдите симметрическую разность множеств setA и setB.
//Проверьте, являются ли множества setA и setB равными.
//5
//Выведите результат в форматированном виде
//print("Пересечение: \(intersection)")
//print("Объединение: \(union)")
//print("Разность: \(difference)")
//print("setA является подмножеством setB: \(isSubsetA)")
//print("setB является подмножеством setA: \(isSubsetB)")
//print("Симметрическая разность: \(symmetricDifference)")
//print("Множества равны: \(isEqual)")

// Часть 1
let setA: Set = Set(1...10)
let setB: Set = Set(5...15)

// Часть 2
let intersection = setA.intersection(setB)
let union = setA.union(setB)
let difference = setA.subtracting(setB)

// Часть 3
let isSubsetA = setA.isSubset(of: setB)
let isSubsetB = setB.isSubset(of: setA)

// Часть 4
let symmetricDifference = setA.symmetricDifference(setB)
let isEqual = setA == setB

// Часть 5
print("Пересечение: \(intersection)")
print("Объединение: \(union)")
print("Разность: \(difference)")
print("setA является подмножеством setB: \(isSubsetA)")
print("setB является подмножеством setA: \(isSubsetB)")
print("Симметрическая разность: \(symmetricDifference)")
print("Множества равны: \(isEqual)")
