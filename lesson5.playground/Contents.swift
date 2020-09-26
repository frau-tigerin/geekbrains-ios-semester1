import Foundation

protocol Car {
    var modelYear: Int { get set }
    var fuel: UInt { get set }
    var carBrand: Brand { get set }
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
    case engineOn
    case engineOff
    case closeWindow
    case openWindow
    case loadCargoToBody(cargoCapacity: Double)
    case unloadCargoFromBody(cargoCapacity: Double)
    case loadGoodsToTrunk(goodsVolume: Double)
    case unloadGoodsFromTrunk(goodsVolume: Double)
    case spendFuel(capacity: UInt)
}

extension Car {
    mutating func apply(action: Action) {
        
        switch action {
        case .engineOn:
            engineState = .on
        case .engineOff:
            engineState = .off
        case .closeWindow:
            windowsState = .closed
        case .openWindow:
            windowsState = .open
        case .spendFuel(let capacity):
            fuel -= capacity
        default:
            break
        }
    }
}

class SportCar: Car, CustomStringConvertible {
    var modelYear: Int
    var fuel: UInt
    var carBrand: Brand
    var engineState: EngineState
    var windowsState: WindowState
    let trunkCapacity: Double
    var filledTrunkCapacity: Double
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, fuel: UInt, trunkCapacity: Double, filledTrunkCapacity: Double) {
        self.carBrand = carBrand
        self.modelYear = modelYear
        self.engineState = engineState
        self.windowsState = windowsState
        self.fuel = fuel
        self.trunkCapacity = trunkCapacity
        self.filledTrunkCapacity = filledTrunkCapacity
    }
    
    func apply(action: Action) {
        switch action {
        case .loadGoodsToTrunk(let capacity):
            filledTrunkCapacity += capacity
        
        case .unloadGoodsFromTrunk(let capacity):
            filledTrunkCapacity -= capacity
        
        case .spendFuel(let capacity):
            fuel -= capacity
        
        default:
            apply(action: action)
        }
    }
    
    var description: String {
        "\(carBrand), \(modelYear), \(engineState), \(windowsState), \(trunkCapacity), \(filledTrunkCapacity), \(fuel)"
    }
}

class TruckCar: Car, CustomStringConvertible {
    var modelYear: Int
    var fuel: UInt
    var carBrand: Brand
    var engineState: EngineState
    var windowsState: WindowState
    let bodyCapacity: Double
    var filledBodyCapacity: Double
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, fuel: UInt, bodyCapacity: Double, filledBodyCapacity: Double) {
        self.carBrand = carBrand
        self.modelYear = modelYear
        self.engineState = engineState
        self.windowsState = windowsState
        self.fuel = fuel
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
        "\(carBrand), \(modelYear), \(engineState), \(windowsState), \(bodyCapacity), \(filledBodyCapacity), \(fuel)"
    }
}


var car1 = SportCar(carBrand: .mercedes, modelYear: 2004, engineState: .off, windowsState: .closed, fuel: 150, trunkCapacity: 200, filledTrunkCapacity: 150)
print(car1)
car1.apply(action: .loadGoodsToTrunk(goodsVolume: 10))
print(car1)

car1.apply(action: .spendFuel(capacity: 100))
print(car1)

var car2 = TruckCar(carBrand: .volvo, modelYear: 1998, engineState: .on, windowsState: .open, fuel: 300, bodyCapacity: 500, filledBodyCapacity: 400)
print(car2)

car2.apply(action: .closeWindow)

