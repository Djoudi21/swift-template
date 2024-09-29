import SwiftUI

struct LoginScreen: View {
    @StateObject private var viewModel = LoginViewModel() // Create an instance of LoginViewModel
    @State private var isRegisterViewPresented = false // State to trigger the modal

    var body: some View {
        VStack {
            Text("Sign in to Wish Well")
                .font(.largeTitle)
                .padding()
            Text("Welcome back !")
            Text("PLEASE SIGN UP TO CONTINUE")

            
            SocialLoginList(viewModel: viewModel)
            
            HStack(alignment: .center) {
                HStack {}.frame(width: 70, height: 1).background(Color.black.opacity(0.3))
                Text("or").background()
                HStack {}.frame(width: 70, height: 1).background(Color.black.opacity(0.3))
            }
            
            LoginForm(viewModel: viewModel) // Pass the ObservedObject here
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
