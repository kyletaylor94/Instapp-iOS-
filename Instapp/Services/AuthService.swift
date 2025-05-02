//
//  AuthService.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation
import Alamofire
import UIKit

protocol AuthService {
    func fetchToken() async throws
    func login(_ parameters: LoginRequest) async throws
    func register(_ parameters: RegisterRequest) async throws
    func logout() async throws
    func fetchCurrentUserFromAPI() async throws -> User
    
    func fetchCurrentUser() async throws -> CurrentUser
}

class AuthServiceImpl: AuthService {
    
    func fetchToken() async throws {
        let url = Constants.shared.baseUrl.appendingPathComponent(Constants.shared.fetchDeviceUrl)
        
        let fakeIDToken = UUID().uuidString
        let device = await UIDevice.current
                
        let parameters = await DeviceRegistrationRequest(
            deviceName: device.name,
            deviceToken: "apn-token-\(fakeIDToken)",
            platform: "ios"
        )
        
        do {
            let response = try await AF.request(
                url,
                method: .post,
                parameters: parameters.toDictionary(),
                encoding: JSONEncoding.default,
            )
                .serializingDecodable(TokenResponse.self)
                .value
            
            try await Helpers.shared.saveTokens(token: response.token, refreshToken: response.refreshToken)
            
            print("Tokens fetched and saved successfully!")
        } catch {
            print("Error in fetchToken: \(error)")
            throw error
        }
    }
    
    func login(_ parameters: LoginRequest) async throws {
        let url = Constants.shared.baseUrl.appendingPathComponent(Constants.shared.loginUrl)
        let headers = try await Helpers.shared.getHeaders()
        
        do {
            let response = try await AF.request(
                url,
                method: .post,
                parameters: parameters.toDictionary(),
                encoding: JSONEncoding.default,
                headers: headers
            )
                .validate()
                .serializingString()
                .value
            
            print("Login successfully: \(response)")
            
        } catch {
            print("Error in login: \(error)")
            throw error
        }
    }
    
    func register(_ parameters: RegisterRequest) async throws {
        let url = Constants.shared.baseUrl.appendingPathComponent(Constants.shared.registerUrl)
        let headers = try await Helpers.shared.getHeaders()
        
        
        do {
            let response = try await AF.request(
                url,
                method: .post,
                parameters: parameters.toDictionary(),
                encoding: JSONEncoding.default,
                headers: headers
                
            )
                .validate()
                .serializingString()
                .value
            
            print("Register successful: \(response)")
        } catch {
            print("Error in register: \(String(describing: error))")
            throw error
        }
    }
    
    func logout() async throws {
        let url = Constants.shared.baseUrl.appendingPathComponent(Constants.shared.logoutUrl)
        let headers = try await Helpers.shared.getHeaders()
        
        do {
            let response = try await AF.request(
                url,
                method: .post,
                headers: headers
            )
                .validate()
                .serializingString()
                .value
            
            print("Logout successful: \(response)")
        } catch {
            print("Error in logout: \(error)")
            throw error
        }
    }
    
    func fetchCurrentUser() async throws -> CurrentUser {
        return mockCurrentUser[1]
    }
    
    func fetchCurrentUserFromAPI() async throws -> User {
        let url = Constants.shared.baseUrl.appendingPathComponent(Constants.shared.fetchCurrentUserUrl)
        let headers = try await Helpers.shared.getHeaders()
        
        do {
            let user = try await AF.request(
                url,
                method: .get,
                headers: headers
            )
                .validate()
                .serializingDecodable(User.self)
                .value
            
            return user
        } catch {
            print("Error in fetchCurrentUserFromAPI: \(error)")
            throw error
        }
    }
}
