//
//  DepedencyContainer.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 21..
//

import Foundation
import Swinject

final class DependencyContainer {
    static let shared = DependencyContainer()
    let container = Container()
    
    private init () {
        configureAuthDependencies()
        configureSearchDependencies()
        configureApiDependencies()
    }

   private func configureAuthDependencies() {
        container.register(AuthService.self) { _ in return AuthServiceImpl() }.inObjectScope(.container)
        container.register(AuthRepository.self) { _ in return AuthRepositoryImpl() }.inObjectScope(.container)
        container.register(AuthInteractor.self) { _ in return AuthInteractorImpl() }.inObjectScope(.container)
        container.register(AuthViewModel.self) { _ in return AuthViewModel() }.inObjectScope(.transient)
    }
    
    private func configureSearchDependencies() {
        container.register(SearchService.self) { _ in return SearchServiceImpl() }.inObjectScope(.container)
        container.register(SearchRepository.self) { _ in return SearchRepositoryImpl() }.inObjectScope(.container)
        container.register(SearchInteractor.self) { _ in return SearchInteractorImpl() }.inObjectScope(.container)
        container.register(SearchViewModel.self) { _ in return SearchViewModel() }.inObjectScope(.transient)
    }
    
    private func configureApiDependencies() {
        container.register(ApiService.self) { _ in return ApiServiceImpl() }.inObjectScope(.container)
        container.register(ApiRepository.self) { _ in return ApiRepositoryImpl() }.inObjectScope(.container)
        container.register(ApiInteractor.self) { _ in return ApiInteractorImpl() }.inObjectScope(.container)
        container.register(ApiViewModel.self) { _ in return ApiViewModel() }.inObjectScope(.transient)
    }
}

