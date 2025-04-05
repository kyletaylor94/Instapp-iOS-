//
//  SearchInteractor.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 05..
//

import Foundation

protocol SearchInteractor {
    func searchForUsers(_ query: String, _ users: [CurrentUser]) async throws -> [CurrentUser]
    func fetchAllUsers() async throws -> [CurrentUser]
}

class SearchInteractorImpl: SearchInteractor {
    private var repository: SearchRepository
    
    init(repository: SearchRepository) {
        self.repository = repository
    }
    
    func searchForUsers(_ query: String, _ users: [CurrentUser]) async throws -> [CurrentUser] {
        return try await repository.searchForUsers(with: query, users: users)
    }
    
    func fetchAllUsers() async throws -> [CurrentUser] {
        return try await repository.fetchAllUsers()
    }
}
