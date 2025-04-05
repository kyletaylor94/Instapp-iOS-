//
//  AuthService.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol AuthService {
    func login(email: String, password: String) async throws
    func register(email: String, password: String, username: String, fullName: String) async throws
    func logout() async throws
    
    func fetchCurrentUser() async throws -> CurrentUser
}

class AuthServiceImpl: AuthService {
    func login(email: String, password: String) async throws {
        //
    }
    
    func register(email: String, password: String, username: String, fullName: String) async throws {
        //
    }
    
    func logout() async throws {
        //
    }
    
    func fetchCurrentUser() async throws -> CurrentUser {
        return try await mockCurrentUser[1]
    }
    
}
