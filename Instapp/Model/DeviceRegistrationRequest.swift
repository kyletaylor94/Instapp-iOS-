//
//  DeviceRegistrationRequest.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 05. 02..
//

import Foundation

struct DeviceRegistrationRequest: Codable {
    let deviceName: String
    let deviceToken: String
    let platform: String
    
    func toDictionary() -> [String: Any] {
        [
            "deviceName": deviceName,
            "deviceToken": deviceToken,
            "platform": platform
        ]
    }
}

struct LoginRequest: Codable {
    let email: String
    let password: String
    
    func toDictionary() -> [String: Any] {
        [
            "email": email,
            "password": password
        ]
    }
}

struct RegisterRequest: Codable {
    let name: String
    let email: String
    let password: String
    let confirmPassword: String
    
    func toDictionary() -> [String: String] {
        [
            "name": name,
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword
        ]
    }
}
