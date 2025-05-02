//
//  AuthInteractor.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol AuthInteractor {
    func fetchToken() async throws
    func fetchCurrentUser() async throws -> CurrentUser?
    func login(_ parameters: LoginRequest) async throws
    func register(_ parameters: RegisterRequest) async throws
    func logout() async throws
    
    func fetchCurrentUserFromAPI() async throws -> User?
    func checkLoginStatus() async throws -> (Bool, User?)
}

class AuthInteractorImpl: AuthInteractor {
    
   private var repository: AuthRepository {
        guard let authRepository = DependencyContainer.shared.resolver.resolve(AuthRepository.self) else {
            preconditionFailure("Cannot resolve: \(AuthRepository.self)")
        }
        return authRepository
    }
    
    func fetchToken() async throws {
        return try await repository.fetchToken()
    }
    
    func fetchCurrentUser() async throws -> CurrentUser? {
        return try await repository.fetchCurrentUser()
    }
    
    func login(_ parameters: LoginRequest) async throws {
        return try await repository.login(parameters)
    }
    
    func register(_ parameters: RegisterRequest) async throws {
        try await fetchToken()
        return try await repository.register(parameters)
    }
    
    func logout() async throws {
        return try await repository.logout()
    }
    
    func fetchCurrentUserFromAPI() async throws -> User? {
        return try await repository.fetchCurrentUserFromAPI()
    }
    
    func checkLoginStatus() async throws -> (Bool, User?) {
        let user = try await fetchCurrentUserFromAPI()
                
        if ((user?.isActive) != nil) {
            return (true, user)
        } else {
            return (false, nil)
        }
    }
}
