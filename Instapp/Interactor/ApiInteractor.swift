//
//  ApiInteractor.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol ApiInteractor {
    func fetchPosts() async throws -> [PostModel]
}

class ApiInteractorImpl: ApiInteractor {
    private var repository: ApiRepository
    
    init(repository: ApiRepository) {
        self.repository = repository
    }
    
    func fetchPosts() async throws -> [PostModel] {
        return try await repository.fetchPosts()
    }
}
