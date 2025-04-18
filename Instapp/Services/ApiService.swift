//
//  ApiService.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol ApiService {
    func fetchPosts() async throws -> [PostModel]
}

class ApiServiceImpl: ApiService {
    
    func fetchPosts() async throws -> [PostModel] {
        return try await mockPosts
    }
}
