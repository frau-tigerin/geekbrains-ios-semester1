import Foundation
import UIKit

// MARK: - 1
let a = 2.0
let b = 1.0
let c = 4.0

let D = sqrt(b * b - 4 * a * c)
let x1 = (-b + D) / (2 * a)
let x2 = (-b - D) / (2 * a)

if x1 == x2 {
    print("Единственный корень:", x1)
} else if x1.isNaN {
    print("Нет корней на множестве действительных чисел")
} else {
    print("Два корня:", x1, x2)
}

print("")

// MARK: - 2
let cathetus1 = 10.0
let cathetus2 = 12.0

let triangleArea = 0.5 * cathetus1 * cathetus2
let hypotenuse = sqrt(cathetus1 * cathetus1 + cathetus2 * cathetus2)
let perimeter = cathetus1 + cathetus2 + hypotenuse

var formatter = NumberFormatter()
formatter.maximumFractionDigits = 2
formatter.minimumFractionDigits = 0

print(
    "Площадь треугольника = \(formatter.string(for: triangleArea)!)",
    "Гипотенуза = \(formatter.string(for: hypotenuse)!)",
    "Периметр = \(formatter.string(for: perimeter)!)",
    separator: "\n"
)

print("")

// MARK: - 3
var depositAmount = 50000.0
let percentageAmount = 4.5
var depositYears = 0

while depositYears < 5 {
    depositAmount = depositAmount * percentageAmount / 100 + depositAmount
    depositYears+=1
}

print("Сумма вклада через 5 лет: \(formatter.string(for: depositAmount)!)")
