import Foundation

protocol Car {
    var fuelCapacity: Int { get set }
}

class SportCar: Car {
    var fuelCapacity: Int = 100
    init(fc: Int) {
        self.fuelCapacity = fc
    }
}

class TrunkCar: Car {
    var fuelCapacity: Int
    init(fc: Int) {
        self.fuelCapacity = fc + 100
    }
}

struct Stack<T: Car> {
    private var items = [T] ()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    func sortByFC(_ fc: Int) -> [T] {
        return items.filter { $0.fuelCapacity >= fc }
    }
    subscript(index: Int) -> T? {
        if index <= items.count - 1 && index >= 0 {
            return items[index]
        } else {
            return nil
        }
    }
}
