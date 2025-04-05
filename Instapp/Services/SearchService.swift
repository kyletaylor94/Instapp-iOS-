//
//  SearchService.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 05..
//

import Foundation

protocol SearchService {
    func fetchAllusers() async throws -> [CurrentUser]
    func searchingUsers(query: String, users: [CurrentUser]) async throws -> [CurrentUser]
    func searchBetweenLikes(query: String, users: [CurrentUser]) async throws -> [CurrentUser]
}

class SearchServiceImpl: SearchService {
    
    func fetchAllusers() async throws -> [CurrentUser] {
        return try await mockCurrentUser
    }
    
    func searchingUsers(query: String, users: [CurrentUser]) async throws -> [CurrentUser] {
        guard !query.isEmpty else {
            return try await mockCurrentUser
        }
        
        return users.filter {
            $0.fullName.localizedStandardContains(query) ||
            $0.username.localizedStandardContains(query)
        }
    }
    
    func searchBetweenLikes(query: String, users: [CurrentUser]) async throws -> [CurrentUser] {
        return []
    }
}
