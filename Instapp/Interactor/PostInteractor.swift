//
//  ApiInteractor.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol PostInteractor {
    func fetchPosts() async throws -> [PostModel]
}

class PostInteractorImpl: PostInteractor {
    private var repository: PostRepository {
        guard let apiRepository = DependencyContainer.shared.resolver.resolve(PostRepository.self) else {
            preconditionFailure("Cannot resolve: \(PostRepository.self)")
        }
        return apiRepository
    }
    
    func fetchPosts() async throws -> [PostModel] {
        return try await repository.fetchPosts()
    }
}
