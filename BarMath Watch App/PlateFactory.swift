struct PlateStateFactory {
    static func createPlateStates() -> [PlateState] {
        let weights = [2.5, 5, 10, 15, 25, 35, 45]
        return weights.map { PlateState(weight: $0)}
    }
}
