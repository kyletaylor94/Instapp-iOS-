//
//  AuthViewModel.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation
import Observation

enum AuthErrorType: String, Error {
    case loginFailed
    case registerFailed
    case logoutFailed
    case cannotFetchCurrentUser
    
    var errorDescription: String {
        switch self {
        case .loginFailed:
            return "Login was failed!"
        case .registerFailed:
            return "Sign up was failed!"
        case .logoutFailed:
            return "Log out was failed!"
        case .cannotFetchCurrentUser:
            return "Cannot fetch current user!"
        }
    }
}

@Observable
class AuthViewModel {
    var currentUser: CurrentUser?
    
    var isLoading = false
    var hasError = false
    var errorType: AuthErrorType? = nil
    
    private var interactor: AuthInteractor {
        guard let authInteractor = DependencyContainer.shared.container.resolve(AuthInteractor.self) else {
            preconditionFailure("Cannot resolve: \(AuthInteractor.self)")
        }
        return authInteractor
    }
    
    func fetchCurrentUser() async {
        do {
            self.currentUser = try await interactor.fetchCurrentUser()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func login(email: String, password: String) async {
        do {
            try await interactor.login(email: email, password: password)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func register(email: String, password: String, userName: String, fullName: String) async {
        do {
            try await interactor.register(email: email, password: password, userName: userName, fullName: fullName)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func logOut() async {
        do {
            try await interactor.logout()
        } catch {
            print(error.localizedDescription)
        }
    }
}
