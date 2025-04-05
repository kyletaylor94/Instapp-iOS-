//
//  ApiViewModel.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation
import Observation

enum ApiError: String, Error {
    case badUrl
    case invalidResponse
    case decodingFailed
    case otherError = "Unknown error"
    
    var errorDescription: String {
        switch self {
        case .badUrl:
            return "Bad url!"
        case .invalidResponse:
            return "Invalid response!"
        case .decodingFailed:
            return "Decoding failed!"
        case .otherError:
            return "Unknown!"
        }
    }
}

@Observable
class ApiViewModel {
    var posts = [PostModel]()
    var isLoading = false
    var hasError = false
    var errorType: ApiError? = nil
    
    private var interactor: ApiInteractor
    
    init(posts: [PostModel] = [PostModel](), isLoading: Bool = false, hasError: Bool = false, errorType: ApiError? = nil, interactor: ApiInteractor) {
        self.posts = posts
        self.isLoading = isLoading
        self.hasError = hasError
        self.errorType = errorType
        self.interactor = interactor
    }
    
    func fetchPosts() async {
        do {
            self.posts = try await interactor.fetchPosts()
        } catch {
            print(error.localizedDescription)
        }
    }
}
