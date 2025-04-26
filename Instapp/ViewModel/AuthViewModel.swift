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
    var currentUserFromAPI: User?
    var currentUser: CurrentUser?
    
    var isLoading = false
    var hasError = false
    var errorType: AuthErrorType? = nil
    
    private var interactor: AuthInteractor {
        guard let authInteractor = DependencyContainer.shared.resolver.resolve(AuthInteractor.self) else {
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
            await fetchCurrentUserFromAPI()
            print(currentUserFromAPI)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func register(name: String, email: String, password: String, confirmPassword: String) async {
        do {
            try await interactor.register(name: name, email: email, password: password, confirmPassword: confirmPassword)
            await fetchCurrentUserFromAPI()
            print(currentUserFromAPI)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func logOut() async {
        do {
            try await interactor.logout()
            self.currentUserFromAPI = nil
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchCurrentUserFromAPI() async {
        do {
            self.currentUserFromAPI = try await interactor.fetchCurrentUserFromAPI()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func checkLoginStatus() async {
        do {
           let (isAuthenticated, user) = try await interactor.checkLoginStatus()
            self.currentUserFromAPI = user
        } catch {
            print(error.localizedDescription)
        }
    }
}
