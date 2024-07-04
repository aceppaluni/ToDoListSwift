import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        VStack {
            // Header
            HeaderView(
                title: "To Do List",
                subtitle: "The safe space for multitaskers",
                angle: 15,
                background: .pink
            )
            //login
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(message)
                        .foregroundColor(Color.red)
                }
                TextField("Email Address", text: $ViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                SecureField("Password", text: $ViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TLButton(title: "Login", background: .blue)
                {
                    viewModel.login()
                }
                .padding()
            }
            .offset(y: -50)

            // Create Account
            VStack {
                Text("New here?")
                NavigationLink("Create Account", destination: RegisterView())
            }
            .padding(.bottom, 50)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}