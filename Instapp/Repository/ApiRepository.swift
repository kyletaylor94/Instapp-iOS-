//
//  ApiRepository.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol ApiRepository {
    func fetchPosts() async throws -> [PostModel]
}

class ApiRepositoryImpl: ApiRepository {
    private var service: ApiService
    
    init(service: ApiService) {
        self.service = service
    }
    
    func fetchPosts() async throws -> [PostModel] {
        return try await service.fetchPosts()
    }
}
