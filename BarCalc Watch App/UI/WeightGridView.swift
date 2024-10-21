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
            LazyVGrid(columns: columns) {
                ForEach(store.state.plateArray) { state in
                    PlateButton(weight: state.weight, counter: state.count) {_ in
                        store.onAction(.weightTapped(state.weight))
                    }
                }
            }
            .background(Color.clear)
            .padding(.bottom)
            
            Divider()
            HStack{
                Text("Bar Weight:")
                Text("35lbs")
                Spacer()
            } .foregroundColor(.secondary)
                .font(.footnote)
            .padding()
        }
    }
}

#Preview {
    WeightGridView(store: AppStore())
}
