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
