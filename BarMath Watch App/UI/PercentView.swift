
import SwiftUI

struct PercentView: View {
    @State private var inputNumber: String = ""
    @State private var calculatedPercentages = [ 75:0, 80:0, 85:0, 90:0]

    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter PR", text: $inputNumber, onCommit: calculatePercentages)
            if !calculatedPercentages.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Breakdown:")
                        .font(.headline)
                    //LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    VStack {
                        ForEach(calculatedPercentages.sorted(by: { $0.key > $1.key }), id: \.key) { percent, value in
                            HStack {
                                Text("\(percent)%")
                                
                                Text("\(value) (\(value / 2)x2)")
                            }
                        }
                    }
                    
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
        }
        .padding()
    }

       private func calculatePercentages() {
           for percent in calculatedPercentages.keys {
               let percentage = (percent * (Int(inputNumber) ?? 0 )) / 100
               calculatedPercentages[percent] = percentage
           }
           print("Calculated percentages: \(calculatedPercentages)")
       }
}


#Preview {
    PercentView()
}
