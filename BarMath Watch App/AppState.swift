import Combine


struct AppState {
    var sidePlateWeight: Double = 0
    var bar: Bar = .medium
    var plateArray: [PlateState] = PlateStateFactory.createPlateStates()
    
    var total: Int {
        return Int(sidePlateWeight * 2 + Double(bar.rawValue))
    }
}
