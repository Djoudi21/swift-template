import SwiftUI

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel() // Create an instance of LoginViewModel
    @State private var isRegisterViewPresented = false // State to trigger the modal

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Button(action: {
                isRegisterViewPresented  = true
            }) {
                Text("Don't have an account? Register")
                    .padding()
                    .foregroundColor(.black)
            }
            .padding()
        }
            // Sheet presentation for the modal view
                    .sheet(isPresented: $isRegisterViewPresented) {
                        RegisterScreen() // This will be presented modally
                    }
        .padding()
        }
}

#Preview {
    LoginScreen()
}
