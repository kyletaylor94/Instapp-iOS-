//
//  ApiService.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

protocol PostService {
    func fetchPosts() async throws -> [PostModel]
}

class PostServiceImpl: PostService {
    
    func fetchPosts() async throws -> [PostModel] {
        return mockPosts
    }
}
