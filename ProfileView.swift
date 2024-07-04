import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        Navigation {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading user profile")
                }
            }
            .navigationTitle("Profile")

        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

@ViewBuilder
func profile(user: User) -> some View {
    Image(systemName: "person.circle")
        .resizeable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(Color.blue)
        .frame(width: 125, height: 125)
        .padding()
    VStack(alignment: .leading) {
        HStack {
            Text("Name")
                .bold()
            Text(user.name)
        }
        .padding()
        HStack {
            Text("Email")
                .bold()
            Text(user.email)
        }
        .padding()
        HStack {
            Text("Member Since")
                .bold()
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abreviated, time: .shortened))")
        }
        .padding()
    }
    .padding()

    Button("Log Out") {
        viewModel.logout()
    }
    .tint(.red)
    .padding()

    Spacer()
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}