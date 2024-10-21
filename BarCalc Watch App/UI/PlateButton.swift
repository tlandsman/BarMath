import SwiftUI


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
                .frame(width: 48, height: 48) // Define the size of the circle
                .overlay(content: {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 30, height: 30)
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
