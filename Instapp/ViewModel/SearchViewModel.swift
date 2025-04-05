//
//  SearchViewModel.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 05..
//

import Foundation
import Observation

enum SearchErrorTypes: String, Error {
    case searchingError
    
    var errorDescription: String {
        switch self {
        case .searchingError:
            return "Cannot search for users!"
        }
    }
}

@MainActor
@Observable
class SearchViewModel {
    var searchedUsers = [CurrentUser]()
    var isLoading = false
    var hasError = false
    var errorType: SearchErrorTypes? = nil
    
    private var interactor: SearchInteractor
    
    init(searchedUsers: [CurrentUser] = [CurrentUser](), isLoading: Bool = false, hasError: Bool = false, errorType: SearchErrorTypes? = nil, interactor: SearchInteractor) {
        self.searchedUsers = searchedUsers
        self.isLoading = isLoading
        self.hasError = hasError
        self.errorType = errorType
        self.interactor = interactor
    }
    
    func searchForUsers(_ query: String, users: [CurrentUser]) async {
        do {
            self.searchedUsers = try await interactor.searchForUsers(query, users)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchAllUsers() async {
        do {
            self.searchedUsers = try await interactor.fetchAllUsers()
        } catch {
            print(error.localizedDescription)
        }
    }
}
