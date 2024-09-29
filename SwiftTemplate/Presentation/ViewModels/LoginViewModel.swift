import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Any initialization logic, such as fetching stored credentials
    }

    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Username and password cannot be empty."
            return
        }

        // Simulate a login process (In a real app, you could call an API here)
        if username == "user" && password == "password" {
            isAuthenticated = true
            errorMessage = nil
        } else {
            isAuthenticated = false
            errorMessage = "Invalid credentials."
        }
    }
}
