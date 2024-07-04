import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue)
                Text("Login")
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       TLButton(title: "Value", background: .pink)

    }
}