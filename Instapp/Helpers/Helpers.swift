//
//  Helpers.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 26..
//

import Foundation
import Alamofire

class Helpers {
    static let shared = Helpers()
    
    private var authToken: String?
    private var refreshToken: String?
    
    func saveTokens(token: String, refreshToken: String) async throws {
        self.authToken = token
        self.refreshToken = refreshToken
        
        UserDefaults.standard.set(token, forKey: "authToken")
        UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
    }
    
    func loadTokens() async throws {
        authToken = UserDefaults.standard.string(forKey: "authToken")
        refreshToken = UserDefaults.standard.string(forKey: "refreshToken")
    }
    
    func clearTokens() async throws {
        authToken = nil
        refreshToken = nil
        
        UserDefaults.standard.removeObject(forKey: "authToken")
        UserDefaults.standard.removeObject(forKey: "refreshToken")
    }
    
    func getHeaders(requiresAuth: Bool = true) async throws -> HTTPHeaders {
          var headers: HTTPHeaders = [
              "Content-Type": "application/json"
          ]
          
          if requiresAuth {
              try await loadTokens()
              
              if let token = authToken {
                  headers["Authorization"] = "Bearer \(token)"
                  print("Token added to headers: \(token)")
              }
          }
          return headers
      }
}
