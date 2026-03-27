/*:
 ## Задание 3
 3.1 Объявите свойство dayOfBirth и присвойте ему дату вашего рождения
 
 3.2 Объявите свойство monthOfBirth и присвойте ему месяц вашего рождения
 
 3.3 Объявите свойство yearOfBirth и присвойте ему год вашего рождения
 
 3.4 Необходимо рассчитать прожитое время с момента вашего рождения по текущую дату в разных единицах измерения (в годах, в месяцах, в днях и в секундах). За текущее время возьмите сегодняшнюю дату и 0 часов 0 минут. Високосные года учитывать не надо. Пусть среднее количество дней в месяце будет 30, а количество дней в году 360. Создайте все необходимые свойства, которые вам понадобятся для решения данной задачи. Для расчета всех необходимых величин используйте только арифметические операторы. Ни каких функций и условных операторов if-else использовать не нужно.
 
 3.5 Выведите результат вычислений на консоль в виде текста (n years, n months, n days and n seconds have passed since my birth). Пример: если я родился 9 ноября 1980 года, а текущая дата 29.01.20, то результат будет следующим: 39 years, 470 months, 14120 days and 1219968000 seconds have passed since my birth.
 
 *3.6 Выведите на консоль сообщение о том в каком квартале вы родились. Для этого используйте операторы сравнения, что бы сравнить номер месяца вашего рождения с одним из четырех кварталов. Например если номер месяца больше 0 и меньше или равно 3, то это будет первый квартал. Для получения результата используйте условный оператор if
 */

let dayOfBirth: Int = 13
let monthOfBirth: Int = 4
let yearOfBirth: Int = 2003

let currentDay: Int = 20
let currentMonth: Int = 3
let currentYear: Int = 2026

let years: Int = currentYear - yearOfBirth
let months: Int = currentMonth - monthOfBirth
let days: Int = currentDay - dayOfBirth

let totalYears: Int = years
let totalMonths: Int = years * 12 + months
let totalDays: Int = years * 360 + months * 30 + days
let totalSeconds: Int = totalDays * 24 * 60 * 60

print("\(totalYears) years, \(totalMonths) months, \(totalDays) days and \(totalSeconds) seconds have passed since my birth.")

if (monthOfBirth > 0 && monthOfBirth <= 3) {
    print("Я родился в 1 квартале")
} else if (monthOfBirth > 3 && monthOfBirth <= 6) {
    print("Я родился во 2 квартале")
} else if (monthOfBirth > 6 && monthOfBirth <= 9) {
    print("Я родился в 3 квартале")
} else {
    print("Я родился в 4 квартале")
}
