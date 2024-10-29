import SwiftUI

struct BarSettingView: View {
    let bar: Bar
    var barSelectAction: (Bar) -> Void
    
    var body: some View {
        VStack(){
            HStack {
                Image(systemName: "dumbbell.fill")
                Text("Bar Setting")
            }
           
            HStack{
                BarButtonView(bar: Bar.medium,
                              isSelected: (bar == Bar.medium),
                              barSelectAction: barSelectAction)
                
                BarButtonView(bar: Bar.large,
                              isSelected: (bar == Bar.large),
                              barSelectAction: barSelectAction)
            }
            .padding()
        }
        
    }
}

#Preview() {
    BarSettingView(bar: .large, barSelectAction: {_ in })
}



struct BarButtonView: View {
    var bar: Bar
    var title: String {
        "\(bar.rawValue)"
    }
    var isSelected: Bool
    var barSelectAction: (Bar) -> Void
    var body: some View {
            Button (action: {
                barSelectAction(bar)
            }) {
                Text(title)
                    .fontWeight(.bold)
            }
            .background( isSelected ? .blue : .secondary)
            .foregroundStyle( isSelected ? .primary : .secondary)
            .clipShape(Circle())
            .controlSize(.small)
            .padding(.trailing, 12)
            
  
    }
}
