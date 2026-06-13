import Foundation

enum Gender: String {
    case male = "самец"
    case female = "самка"

    static func random() -> Gender {
        Bool.random() ? .male : .female
    }
}

class Animal {
    let nickname: String
    let type: String
    let gender: Gender

    var age: Int
    var hunger: Int
    var health: Int
    var alive: Bool = true

    let lifeLimit: Int
    let hungerLimit: Int
    let foodProbability: Int
    let birthProbability: Int
    let adultAge: Int

    var title: String {
        "\(type) \(nickname)"
    }

    init(
        nickname: String,
        type: String,
        gender: Gender = .random(),
        age: Int = 0,
        hunger: Int = 0,
        health: Int = 100,
        lifeLimit: Int,
        hungerLimit: Int,
        foodProbability: Int,
        birthProbability: Int,
        adultAge: Int
    ) {
        self.nickname = nickname
        self.type = type
        self.gender = gender
        self.age = age
        self.hunger = hunger
        self.health = health
        self.lifeLimit = lifeLimit
        self.hungerLimit = hungerLimit
        self.foodProbability = foodProbability
        self.birthProbability = birthProbability
        self.adultAge = adultAge
    }

    func liveOneDay() {
        age += 1
        hunger += 1

        if hunger >= 2 {
            health -= 10
        }

        print("\(title) прожил ещё один день. Возраст: \(age), голод: \(hunger), здоровье: \(health).")
    }

    func searchFood() {
        let chance = Int.random(in: 1...100)

        if chance <= foodProbability {
            hunger = max(0, hunger - 2)
            health = min(100, health + 5)
            print("\(title) нашёл еду.")
        } else {
            hunger += 1
            print("\(title) остался голодным. Голод: \(hunger).")
        }
    }

    func canHaveChild(with partner: Animal) -> Bool {
        guard alive && partner.alive else {
            return false
        }

        guard type == partner.type else {
            return false
        }

        guard gender != partner.gender else {
            return false
        }

        guard age >= adultAge && partner.age >= partner.adultAge else {
            return false
        }

        let chance = Int.random(in: 1...100)
        return chance <= birthProbability
    }

    func createBaby(number: Int) -> Animal {
        fatalError("Метод должен быть переопределён у конкретного животного")
    }

    func checkLifeStatus() -> String? {
        if age > lifeLimit {
            alive = false
            return "\(title) умер от старости."
        }

        if hunger >= hungerLimit {
            alive = false
            return "\(title) умер от голода."
        }

        if health <= 0 {
            alive = false
            return "\(title) умер из-за плохого здоровья."
        }

        return nil
    }

    func info() {
        print("\(title): \(gender.rawValue), возраст \(age), голод \(hunger), здоровье \(health).")
    }
}

final class Tiger: Animal {
    init(_ nickname: String, age: Int = 0, gender: Gender = .random()) {
        super.init(
            nickname: nickname,
            type: "Тигр",
            gender: gender,
            age: age,
            lifeLimit: 14,
            hungerLimit: 6,
            foodProbability: 55,
            birthProbability: 12,
            adultAge: 4
        )
    }

    override func createBaby(number: Int) -> Animal {
        Tiger("тигрёнок-\(number)")
    }
}

final class Rabbit: Animal {
    init(_ nickname: String, age: Int = 0, gender: Gender = .random()) {
        super.init(
            nickname: nickname,
            type: "Кролик",
            gender: gender,
            age: age,
            lifeLimit: 6,
            hungerLimit: 4,
            foodProbability: 80,
            birthProbability: 45,
            adultAge: 1
        )
    }

    override func createBaby(number: Int) -> Animal {
        Rabbit("крольчонок-\(number)")
    }
}

final class Dog: Animal {
    init(_ nickname: String, age: Int = 0, gender: Gender = .random()) {
        super.init(
            nickname: nickname,
            type: "Собака",
            gender: gender,
            age: age,
            lifeLimit: 11,
            hungerLimit: 5,
            foodProbability: 70,
            birthProbability: 25,
            adultAge: 2
        )
    }

    override func createBaby(number: Int) -> Animal {
        Dog("щенок-\(number)")
    }
}

final class Owl: Animal {
    init(_ nickname: String, age: Int = 0, gender: Gender = .random()) {
        super.init(
            nickname: nickname,
            type: "Сова",
            gender: gender,
            age: age,
            lifeLimit: 9,
            hungerLimit: 4,
            foodProbability: 65,
            birthProbability: 20,
            adultAge: 2
        )
    }

    override func createBaby(number: Int) -> Animal {
        Owl("совёнок-\(number)")
    }
}

final class Goat: Animal {
    init(_ nickname: String, age: Int = 0, gender: Gender = .random()) {
        super.init(
            nickname: nickname,
            type: "Коза",
            gender: gender,
            age: age,
            lifeLimit: 10,
            hungerLimit: 5,
            foodProbability: 75,
            birthProbability: 30,
            adultAge: 2
        )
    }

    override func createBaby(number: Int) -> Animal {
        Goat("козлёнок-\(number)")
    }
}

final class Zoo {
    private var animals: [Animal]
    private var dayNumber = 0

    private var bornTotal = 0
    private var deadTotal = 0
    private var babyNumbers: [String: Int] = [:]

    init(animals: [Animal]) {
        self.animals = animals
    }

    func start(days: Int) {
        for _ in 1...days {
            if animals.isEmpty {
                print("В зоопарке больше нет животных.")
                break
            }

            runDay()
        }

        showFinalReport()
    }

    private func runDay() {
        dayNumber += 1

        print("\n===== День \(dayNumber) =====\n")

        var babies: [Animal] = []
        var diedToday = 0

        for animal in animals {
            guard animal.alive else {
                continue
            }

            animal.liveOneDay()
            animal.searchFood()

            if let deathText = animal.checkLifeStatus() {
                diedToday += 1
                print(deathText)
            }

            print("")
        }

        babies = processBirths()

        animals.append(contentsOf: babies)
        animals = animals.filter { $0.alive }

        bornTotal += babies.count
        deadTotal += diedToday

        showDayReport(born: babies.count, died: diedToday)
    }

    private func processBirths() -> [Animal] {
        var newborns: [Animal] = []
        var usedTypes: Set<String> = []

        for first in animals {
            if usedTypes.contains(first.type) {
                continue
            }

            guard first.alive else {
                continue
            }

            if let second = animals.first(where: {
                $0 !== first &&
                $0.alive &&
                $0.type == first.type &&
                $0.gender != first.gender
            }) {
                if first.canHaveChild(with: second) {
                    let number = nextBabyNumber(for: first.type)
                    let baby = first.createBaby(number: number)

                    newborns.append(baby)
                    usedTypes.insert(first.type)

                    print("У пары \(first.type) появился потомок: \(baby.title).")
                }
            }
        }

        return newborns
    }

    private func nextBabyNumber(for type: String) -> Int {
        let number = (babyNumbers[type] ?? 0) + 1
        babyNumbers[type] = number
        return number
    }

    private func showDayReport(born: Int, died: Int) {
        print("Итоги дня:")
        print("Животных сейчас: \(animals.count)")
        print("Родилось сегодня: \(born)")
        print("Умерло сегодня: \(died)")
        print("Состав зоопарка:")

        let grouped = Dictionary(grouping: animals) { $0.type }

        for key in grouped.keys.sorted() {
            print("\(key): \(grouped[key]?.count ?? 0)")
        }
    }

    private func showFinalReport() {
        print("\n===== Финальная статистика =====")
        print("Осталось животных: \(animals.count)")
        print("Всего родилось: \(bornTotal)")
        print("Всего умерло: \(deadTotal)")
        print("\nОставшиеся животные:")

        for animal in animals {
            animal.info()
        }
    }
}

let zoo = Zoo(animals: [
    Tiger("Шерхан", age: 5, gender: .male),
    Tiger("Рада", age: 4, gender: .female),

    Rabbit("Пушок", age: 1, gender: .male),
    Rabbit("Белка", age: 1, gender: .female),

    Dog("Рекс", age: 3, gender: .male),
    Dog("Лада", age: 2, gender: .female),

    Owl("Архимед", age: 2, gender: .male),
    Owl("Ночка", age: 2, gender: .female),

    Goat("Марта", age: 2, gender: .female)
])

zoo.start(days: 7)
