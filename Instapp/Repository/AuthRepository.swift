//
//  AuthRepository.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol AuthRepository {
    func login(email: String, password: String) async throws
    func register(email: String, password: String, userName: String, fullName: String) async throws
    func logout() async throws
    
    func fetchCurrentUser() async throws -> CurrentUser?
}

class AuthRepositoryImpl: AuthRepository {
    private var service: AuthService
    
    init(service: AuthService) {
        self.service = service
    }
    
    func login(email: String, password: String) async throws {
        return try await service.login(email: email, password: password)
    }
    
    func register(email: String, password: String, userName: String, fullName: String) async throws {
        return try await service.register(email: email, password: password, username: userName, fullName: fullName)
    }
    
    func logout() async throws {
        return try await service.logout()
    }
    
    func fetchCurrentUser() async throws -> CurrentUser? {
        return try await service.fetchCurrentUser()
    }
    
    
}
