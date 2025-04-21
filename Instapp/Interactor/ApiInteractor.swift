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
    private var repository: ApiRepository {
        guard let apiRepository = DependencyContainer.shared.resolver.resolve(ApiRepository.self) else {
            preconditionFailure("Cannot resolve: \(ApiRepository.self)")
        }
        return apiRepository
    }
    
    func fetchPosts() async throws -> [PostModel] {
        return try await repository.fetchPosts()
    }
}
