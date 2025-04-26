//
//  TokenResponse.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 26..
//

import Foundation

struct TokenResponse: Codable {
    let token: String
    let refreshToken: String
}
