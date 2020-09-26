import Foundation

protocol Car {
    var carBrand: Brand { get set }
    var modelYear: Int { get set }
    var engineState: EngineState { get set }
    var windowsState: WindowState { get set }
    func apply(action: Action)
}

enum Brand {
    case volvo, nissan, mercedes
}

enum EngineState {
    case on, off
}

enum WindowState {
    case closed, open
}

enum Action {
    case loadCargoToBody(cargoCapacity: Double)
    case unloadCargoFromBody(cargoCapacity: Double)
    case loadGoodsToTrunk(goodsVolume: Double)
    case unloadGoodsFromTrunk(goodsVolume: Double)
}

extension Car {
    mutating func handleEngine() {
        switch engineState {
        case .on:
            engineState = .off
        case .off:
            engineState = .on
        }
    }
    
    mutating func handleWindows() {
        switch windowsState {
        case .open:
            windowsState = .closed
        case .closed:
            windowsState = .open
        }
    }
}

class SportCar: Car, CustomStringConvertible {
    var carBrand: Brand
    var modelYear: Int
    var engineState: EngineState
    var windowsState: WindowState
    let trunkCapacity: Double
    var filledTrunkCapacity: Double
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, trunkCapacity: Double, filledTrunkCapacity: Double) {
        self.carBrand = carBrand
        self.modelYear = modelYear
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkCapacity = trunkCapacity
        self.filledTrunkCapacity = filledTrunkCapacity
    }
    
    func apply(action: Action) {
        switch action {
        case .loadGoodsToTrunk(let capacity):
            filledTrunkCapacity += capacity
        case .unloadGoodsFromTrunk(let capacity):
            filledTrunkCapacity -= capacity
        default:
            apply(action: action)
        }
    }
    
    var description: String {
        "\(carBrand), \(modelYear), \(engineState), \(windowsState), \(trunkCapacity), \(filledTrunkCapacity)"
    }
}

class TruckCar: Car, CustomStringConvertible {
    var carBrand: Brand
    var modelYear: Int
    var engineState: EngineState
    var windowsState: WindowState
    let bodyCapacity: Double
    var filledBodyCapacity: Double
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, bodyCapacity: Double, filledBodyCapacity: Double) {
        self.carBrand = carBrand
        self.modelYear = modelYear
        self.engineState = engineState
        self.windowsState = windowsState
        self.bodyCapacity = bodyCapacity
        self.filledBodyCapacity = filledBodyCapacity
    }
    
    func apply(action: Action) {
        switch action {
        case .loadCargoToBody(let capacity):
            filledBodyCapacity += capacity
        case .unloadCargoFromBody(let capacity):
            filledBodyCapacity -= capacity
        default:
            apply(action: action)
        }
    }
    
    var description: String {
        "\(carBrand), \(modelYear), \(engineState), \(windowsState), \(bodyCapacity), \(filledBodyCapacity)"
    }
}


var car1 = SportCar(carBrand: .mercedes, modelYear: 2004, engineState: .off, windowsState: .closed, trunkCapacity: 200, filledTrunkCapacity: 150)
print(car1)
car1.apply(action: .loadGoodsToTrunk(goodsVolume: 10))
print(car1)

var car2 = TruckCar(carBrand: .volvo, modelYear: 1998, engineState: .on, windowsState: .open, bodyCapacity: 500, filledBodyCapacity: 400)
print(car2)

car2.handleEngine()
print(car2)

car2.handleWindows()
print(car2)
