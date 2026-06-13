
import Foundation

/*
 Задача:
 Реализовать систему расчета итоговой цены товара с помощью замыканий.

 Нужно:
 1. Создать несколько замыканий для разных скидок.
 2. Передать замыкание в функцию calculatePrice.
 3. Посмотреть, как одно и то же число обрабатывается разными правилами.
 4. Сделать массив замыканий и применить несколько скидок подряд.
*/

let originalPrice = 1000.0

let tenPercentDiscount: (Double) -> Double = { price in
    return price * 0.9
}

let twentyFivePercentDiscount: (Double) -> Double = { price in
    return price * 0.75
}

let fixedDiscount: (Double) -> Double = { price in
    return price - 150
}

func calculatePrice(price: Double, discountRule: (Double) -> Double) -> Double {
    return discountRule(price)
}

let priceWithTenPercent = calculatePrice(
    price: originalPrice,
    discountRule: tenPercentDiscount
)

let priceWithTwentyFivePercent = calculatePrice(
    price: originalPrice,
    discountRule: twentyFivePercentDiscount
)

let priceWithFixedDiscount = calculatePrice(
    price: originalPrice,
    discountRule: fixedDiscount
)

print("Исходная цена: \(originalPrice)")
print("Цена со скидкой 10%: \(priceWithTenPercent)")
print("Цена со скидкой 25%: \(priceWithTwentyFivePercent)")
print("Цена с фиксированной скидкой 150 рублей: \(priceWithFixedDiscount)")

let priceWithCustomDiscount = calculatePrice(price: originalPrice) { price in
    return price - 300
}

print("Цена со скидкой 300 рублей: \(priceWithCustomDiscount)")

let discountRules: [(Double) -> Double] = [
    tenPercentDiscount,
    fixedDiscount
]

var finalPrice = originalPrice

for rule in discountRules {
    finalPrice = rule(finalPrice)
}

print("Цена после нескольких скидок подряд: \(finalPrice)")

