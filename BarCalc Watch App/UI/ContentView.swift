//
//  ContentView.swift
//  BarCalc Watch App
//
//  Created by Tanya Landsman on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: AppStore
    var body: some View {
      
        
        NavigationView {
                    VStack {
                        WeightGridView(store: store)
                    }
                    .navigationTitle("Total: \(store.state.total)")  // Sets the title of the view
                
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

#Preview {
    ContentView(store: AppStore( state: AppState(sidePlateWeight: 0, barWeight: 35, plateArray: PlateStateFactory().createPlateStates())))
}


