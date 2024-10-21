import SwiftUI

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
