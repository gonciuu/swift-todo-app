//
//  LoginViewModel.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func login() {
        guard validate() else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password)
    }

    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }

        guard email.contains("#") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }

        return true
    }
}
