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
        WeightGridView(store: store)
            
    }
}

#Preview {
    ContentView(store: AppStore( state: AppState(sidePlateWeight: 0, barWeight: 35, plateArray: PlateStateFactory().createPlateStates())))
}


struct WeightGridView: View {
    @ObservedObject var store: AppStore
    // Define the grid layout with columns
    let columns = [
        GridItem(.flexible()), // Flexible column adjusts based on available space
        GridItem(.flexible()), // Second flexible column
        GridItem(.flexible()),
   
    ]

    var body: some View {
        ScrollView {
           
            HStack {
                Text("Total: \(store.state.total)")
                    .font(.title3)
                  //  .padding(10)
          
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.red)
                    .onTapGesture {
                        store.onAction(.clearTapped)
                    }

            }
            LazyVGrid(columns: columns) {
                ForEach(store.state.plateArray) { state in
                    PlateButton(weight: state.weight, counter: state.count) {_ in
                        store.onAction(.weightTapped(state.weight))
                    }
                }
            }
            .background(Color.clear)
            
  
        }
    }
}




struct PlateButton: View {
    let weight: Double
    let counter: Int
    let buttonAction:(Double) -> Void

    var displayWeight: String {
        if (weight == 2.5) {
            return "\(weight)"
        } else {
            return ("\(Int(weight))")
        }
    }
    
    var body: some View {
        ZStack {
            PlateView(weight: "\(displayWeight)")
                .onTapGesture {
                    buttonAction(weight)
                }
            if counter > 0 {
                BadgeView(counter: counter)
                    .offset(x: 24, y: -22) // Position the badge at the top-right
            }
           
        }
        .padding(4)
      
    }
}

struct PlateButton_Previews: PreviewProvider {
    static var previews: some View {
        PlateButton(weight: 5, counter: 1, buttonAction: {_ in })
    }
}


struct PlateView: View {
    var weight: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray) // Fill the circle with color
                .frame(width: 60, height: 60) // Define the size of the circle
                .overlay(content: {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 34, height: 34)
                        .overlay {
                            Circle().stroke(Color.white, lineWidth: 1)
                                .shadow(color: Color.black, radius: 2.0)
                        }
                        
                })
                .overlay {
                    Circle().stroke(Color.white, lineWidth: 2)
                }
                .shadow(color: Color.black, radius: 1.0)
            
            
            Text(weight)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .font(.footnote)
        }
       
    }
}

struct PlateView_Previews: PreviewProvider {
    static var previews: some View {
        PlateView(weight: "5")
    }
}


struct BadgeView: View {
    var counter: Int
    
    var body: some View {
        Text("\(counter)")
            .font(.caption)
            .foregroundColor(.white)
            .frame(width: 20, height: 20)
            .background(Color.blue)
            .clipShape(Circle())
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(counter: 2)
    }
}
