//
//  AuthRepository.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol AuthRepository {
    func fetchToken() async throws
    func login(email: String, password: String) async throws
    func register(name: String, email: String, password: String, confirmPassword: String) async throws
    func logout() async throws
    
    func fetchCurrentUser() async throws -> CurrentUser?
    func fetchCurrentUserFromAPI() async throws -> User?
}

class AuthRepositoryImpl: AuthRepository {
    private var service: AuthService {
        guard let authService = DependencyContainer.shared.resolver.resolve(AuthService.self) else {
            preconditionFailure("CAnnot resolve: \(AuthService.self)")
        }
        return authService
    }
    
    func fetchToken() async throws {
        return try await service.fetchToken()
    }
    
    func login(email: String, password: String) async throws {
        return try await service.login(email: email, password: password)
    }
    
    func register(name: String, email: String, password: String, confirmPassword: String) async throws {
        return try await service.register(name: name, email: email, password: password, confirmPassword: confirmPassword)
    }
    
    func logout() async throws {
        return try await service.logout()
    }
    
    func fetchCurrentUser() async throws -> CurrentUser? {
        return try await service.fetchCurrentUser()
    }
    
    func fetchCurrentUserFromAPI() async throws -> User? {
        return try await service.fetchCurrentUserFromAPI()
    }

}
