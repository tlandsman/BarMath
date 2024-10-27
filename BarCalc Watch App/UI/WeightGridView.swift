import SwiftUI

struct WeightGridView: View {
    @ObservedObject var store: AppStore
    // Define the grid layout with columns
    let columns = [
        GridItem(.flexible()), // Flexible column adjusts based on available space
        GridItem(.flexible()), 
        GridItem(.flexible()),
   
    ]

    var body: some View {
        ScrollView {
            Divider()
                .padding(.top, -4)
                
            VStack(alignment: .leading) {
                Text("1 Side:")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(0)
                
                LazyVGrid(columns: columns) {
                    ForEach(store.state.plateArray) { state in
                        PlateButton(weight: state.weight, counter: state.count) {_ in
                            store.onAction(.weightTapped(state.weight))
                        }
                    }
                }
                .background(Color.clear)
                .padding(.top, -4)
                .padding(.leading, 2)
                .padding(.trailing, 6)
                
                
                Divider()
                
                BarSettingView(bar: store.state.bar, barSelectAction: { bar in
                    store.onAction(.setBar(bar))
                })
            }
           
      
        }
       
    }
}

#Preview {
    WeightGridView(store: AppStore())
}
