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
        
    case .setBar(let bar):
        state.bar = bar
    }
}
