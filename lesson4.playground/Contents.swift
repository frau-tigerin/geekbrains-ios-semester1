import Foundation

enum Brand {
    case volvo, nissan, mercedes
}

enum EngineState {
    case on, off
}

enum WindowState {
    case closed, open
}

class Car {
    let carBrand: Brand
    let modelYear: Int
    var engineState: EngineState
    var windowsState: WindowState
    var fuel: UInt
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, fuel: UInt) {
        self.carBrand = carBrand
        self.modelYear = modelYear
        self.engineState = engineState
        self.windowsState = windowsState
        self.fuel = fuel
    }
    
    func apply(action: Action) {
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
    
    let trunkCapacity: Double
    var filledTrunkCapacity: Double
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, fuel: UInt, trunkCapacity: Double, filledTrunkCapacity: Double) {
        self.trunkCapacity = trunkCapacity
        self.filledTrunkCapacity = filledTrunkCapacity
        
        super.init(carBrand: carBrand, modelYear: modelYear, engineState: engineState, windowsState: windowsState, fuel: fuel)
    }
    
    override func apply(action: Action) {
        switch action {
        case .loadGoodsToTrunk(let capacity):
            filledTrunkCapacity += capacity
        
        case .unloadGoodsFromTrunk(let capacity):
            filledTrunkCapacity -= capacity
        
        case .spendFuel(let capacity):
            fuel -= capacity
        
        default:
            super.apply(action: action)
        }
    }
    
    var description: String {
        "\(carBrand), \(modelYear), \(engineState), \(windowsState), \(trunkCapacity), \(filledTrunkCapacity), \(fuel)"
    }
}

class TruckCar: Car, CustomStringConvertible {
    let bodyCapacity: Double
    var filledBodyCapacity: Double
    
    init(carBrand: Brand, modelYear: Int, engineState: EngineState, windowsState: WindowState, bodyCapacity: Double, filledBodyCapacity: Double) {
        self.bodyCapacity = bodyCapacity
        self.filledBodyCapacity = filledBodyCapacity
        
        super.init(carBrand: carBrand, modelYear: modelYear, engineState: engineState, windowsState: windowsState, fuel: 100)
    }
    
    override func apply(action: Action) {
        switch action {
        case .loadCargoToBody(let capacity):
            filledBodyCapacity += capacity
        case .unloadCargoFromBody(let capacity):
            filledBodyCapacity -= capacity
        default:
            super.apply(action: action)
        }
    }
    
    var description: String {
        "\(carBrand), \(modelYear), \(engineState), \(windowsState), \(bodyCapacity), \(filledBodyCapacity), \(fuel)"
    }
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

var car1 = SportCar(carBrand: .mercedes, modelYear: 2004, engineState: .off, windowsState: .closed, fuel: 100, trunkCapacity: 100, filledTrunkCapacity: 100)
print(car1)
car1.apply(action: .loadGoodsToTrunk(goodsVolume: 10))
print(car1)

car1.apply(action: .spendFuel(capacity: 100))
print(car1)

var car2 = TruckCar(carBrand: .volvo, modelYear: 2010, engineState: .on, windowsState: .open, bodyCapacity: 500, filledBodyCapacity: 1000)
print(car2)
car2.apply(action: .closeWindow)
print(car2)
