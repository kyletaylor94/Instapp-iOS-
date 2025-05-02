//
//  AuthRepository.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol AuthRepository {
    func fetchToken() async throws
    func login(_ parameters: LoginRequest) async throws
    func register(_ parameters: RegisterRequest) async throws
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
    
    func login(_ parameters: LoginRequest) async throws {
        return try await service.login(parameters)
    }
    
    func register(_ parameters: RegisterRequest) async throws {
        return try await service.register(parameters)
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
