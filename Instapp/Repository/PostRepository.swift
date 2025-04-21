//
//  ApiRepository.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol PostRepository {
    func fetchPosts() async throws -> [PostModel]
}

class PostRepositoryImpl: PostRepository {
    
    private var service: PostService {
        guard let apiService = DependencyContainer.shared.resolver.resolve(PostService.self) else {
            preconditionFailure("Cannot resolve: \(PostService.self)")
        }
        return apiService
    }
    
    func fetchPosts() async throws -> [PostModel] {
        return try await service.fetchPosts()
    }
}
