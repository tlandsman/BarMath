import SwiftUI

final class AppStore: ObservableObject {
    @Published var state: AppState
    
    init(state: AppState = AppState() ) {
        self.state = state
    }
    
    func onAction(_ action: Action) {
        reducer(state: &state, action: action)
    }
}
