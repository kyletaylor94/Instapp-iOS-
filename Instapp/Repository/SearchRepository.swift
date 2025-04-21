//
//  SearchRepository.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 05..
//

import Foundation

protocol SearchRepository {
    func searchForUsers(with query: String, users: [CurrentUser]) async throws -> [CurrentUser]
    func fetchAllUsers() async throws -> [CurrentUser]
}

class SearchRepositoryImpl: SearchRepository {
   
    private var service: SearchService {
        guard let  searchService = DependencyContainer.shared.container.resolve(SearchService.self) else {
            preconditionFailure("Cannot resolve: \(SearchService.self)")
        }
        return searchService
    }
    
    func searchForUsers(with query: String, users: [CurrentUser]) async throws -> [CurrentUser] {
        return try await service.searchingUsers(query: query, users: users)
    }
    
    func fetchAllUsers() async throws -> [CurrentUser] {
        return try await service.fetchAllusers()
    }
}
