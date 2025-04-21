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
    
    
    private var interactor: ApiInteractor {
        guard let apiInteractor = DependencyContainer.shared.container.resolve(ApiInteractor.self) else {
            preconditionFailure("Cannot resolve: \(ApiInteractor.self)")
        }
        return apiInteractor
    }
    
    func fetchPosts() async {
        do {
            self.posts = try await interactor.fetchPosts()
        } catch {
            print(error.localizedDescription)
        }
    }
}
