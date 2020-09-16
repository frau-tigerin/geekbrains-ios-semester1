import UIKit

// MARK: -
// 1. Написать функцию, которая определяет, четное число или нет.
func isNumberEven(_ n: Int) -> Bool {
    let evenNumber = n % 2 == 0
    return evenNumber
}

// MARK: -
// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isNumberDevidedByThree(_ n: Int) -> Bool {
    let numberDevidedByThree = n % 3 == 0
    return numberDevidedByThree
}

// MARK: -
// 3. Создать возрастающий массив из 100 чисел.
func ascendingArray(length: UInt, startingFrom startValue: Int) -> [Int] {
    var numbers = [Int]()
    var value = startValue
    while numbers.count < length {
        numbers.append(value)
        value += 1
    }
    return numbers
}

func ascendingArray2(length: UInt, startingFrom startValue: Int) -> [Int] {
    var numbers = [Int]()
    let endValue = startValue + Int(length)
    for number in startValue..<endValue {
        numbers.append(number)
    }
    return numbers
}

ascendingArray(length: 6, startingFrom: 10)
ascendingArray2(length: 6, startingFrom: 10)

// MARK: -
// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var array = ascendingArray(length: 100, startingFrom: 0)
let arrayCount = array.count
for i in 0..<arrayCount {
    let invertedIndex = arrayCount - 1 - i
    if isNumberEven(array[invertedIndex]) {
        array.remove(at: invertedIndex)
    } else if isNumberDevidedByThree(array[invertedIndex]) {
        array.remove(at: invertedIndex)
    }
}
print(array)
print("")

// MARK: -
// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 80 элементов.
func appendedFibonacciNumber(array: [Int]) -> [Int] {
    if array.count < 2 {
        assertionFailure("Требуется как минимум 2 элемента")
        return []
    }
    
    var fibonacciArray = array
    let fibonacciNumber = array[array.count - 1] + array[array.count - 2]
    fibonacciArray.append(fibonacciNumber)
    return fibonacciArray
}

var fibonacciArray = [0, 1]
for _ in 0..<80 {
    fibonacciArray = appendedFibonacciNumber(array: fibonacciArray)
}
print(fibonacciArray)
