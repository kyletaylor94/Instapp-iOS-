//
//  AuthInteractor.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol AuthInteractor {
    func fetchCurrentUser() async throws -> CurrentUser?
    func login(email: String, password: String) async throws
    func register(email: String, password: String, userName: String, fullName: String) async throws
    func logout() async throws
}

class AuthInteractorImpl: AuthInteractor {
    
    private var repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    
    func fetchCurrentUser() async throws -> CurrentUser? {
        return try await repository.fetchCurrentUser()
    }
    
    func login(email: String, password: String) async throws {
        return try await repository.login(email: email, password: password)
    }
    
    func register(email: String, password: String, userName: String, fullName: String) async throws {
        return try await repository.register(email: email, password: password, userName: userName, fullName: fullName)
    }
    
    func logout() async throws {
        return try await repository.logout()
    }
    
}
