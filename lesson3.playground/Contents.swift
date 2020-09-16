import UIKit

enum Brand {
    case volvo, nissan, mercedes
}

enum EngineState {
    case on, off
}

enum WindowState {
    case closed, open
}

struct SportCar {
    let carBrand: Brand
    let modelYear: Int
    let trunkCapacity: Double
    var engineState: EngineState
    var windowsState: WindowState
    var filledTrunkCapacity: Double
    
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
        case .loadGoodsToTrunk(let capacity):
            filledTrunkCapacity += capacity
        case .unloadGoodsFromTrunk(let capacity):
            filledTrunkCapacity -= capacity
        default:
            break
        }
    }
}

struct TruckCar {
    let carBrand: Brand
    let modelYear: Int
    let bodyCapacity: Double
    var engineState: EngineState
    var windowsState: WindowState
    var filledBodyCapacity: Double
    
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
        case .loadCargoToBody(let capacity):
            filledBodyCapacity += capacity
        case .unloadCargoFromBody(let capacity):
            filledBodyCapacity -= capacity
        default:
            break
        }
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
}

var car1 = SportCar(carBrand: .mercedes, modelYear: 2004, trunkCapacity: 200, engineState: .on, windowsState: .closed, filledTrunkCapacity: 100)
var car2 = TruckCar(carBrand: .volvo, modelYear: 2010, bodyCapacity: 1000, engineState: .off, windowsState: .open, filledBodyCapacity: 1000)

print(car1)
print(car2)

car1.apply(action: .unloadGoodsFromTrunk(goodsVolume: 100))
car2.apply(action: .closeWindow)
print(car1)
print(car2)
