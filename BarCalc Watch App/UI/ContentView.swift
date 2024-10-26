//
//  ContentView.swift
//  BarCalc Watch App
//
//  Created by Tanya Landsman on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    var store: AppStore
    
    var body: some View {
        BuildPage(store: store)
    }
}

#Preview {
    ContentView(store: AppStore( state: AppState(sidePlateWeight: 0, bar: .medium, plateArray: PlateStateFactory().createPlateStates())))
}


struct BuildPage: View {
    @ObservedObject var store: AppStore
    var body: some View {
        NavigationView {
            WeightGridView(store: store)
                .navigationTitle("Total: \(store.state.total)")
                .toolbar {
                    // Toolbar button on the trailing (right) side
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            store.onAction(.clearTapped)
                        }) {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
            
        }
    }
}
