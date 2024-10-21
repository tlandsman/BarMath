import Combine


struct AppState {
    var sidePlateWeight: Double
    let barWeight: Double
   
    var plateArray: [PlateState]
    
    var total: Int {
        return Int(sidePlateWeight * 2 + barWeight)
    }
    
  
}

enum Action {
    case weightTapped(Double)
    case clearTapped
}

func reducer(state: inout AppState, action: Action) {
    switch action {
    case .weightTapped(let weight):
        state.sidePlateWeight = state.sidePlateWeight + weight
        
        // update count
        if let index = state.plateArray.firstIndex(where: { $0.weight == weight }) {
            state.plateArray[index].count += 1
        }
        
       
    case .clearTapped:
        state.sidePlateWeight = 0
        state.plateArray = PlateStateFactory().createPlateStates()
    }
}


    
final class AppStore: ObservableObject {
    @Published var state: AppState
    
    init(state: AppState = AppState(sidePlateWeight: 0, barWeight: 35, plateArray: PlateStateFactory().createPlateStates()) ) {
        self.state = state
    }
    
    func onAction(_ action: Action) {
        reducer(state: &state, action: action)
    }
}


struct PlateState: Hashable, Identifiable {
    let weight: Double
    var count: Int
    var id: Double {
        return weight
    }
    
    init(weight: Double, count: Int = 0) {
        self.weight = weight
        self.count = count
    }
}



struct PlateStateFactory {
    private let weights = [2.5, 5, 10, 15, 25, 35, 45]
    func createPlateStates() -> [PlateState] {
        return weights.map { PlateState(weight: $0)}
    }
}
