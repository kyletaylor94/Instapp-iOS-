//
//  Constants.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 26..
//

import Foundation

class Constants {
    static let shared = Constants()
    
    let baseUrl = URL(string: "http://api.instapp.zsoltfiddler.hu/api")!
    
    //MARK: - System
    let healtCheckUrl = "/healthcheck"
    
    //MARK: - Authentication
    let registerUrl = "/auth/register"
    let loginUrl = "/auth/login"
    let logoutUrl = "/auth/logout"
    let refreshTokenUrl = "/auth/refresh-token"
    
    //MARK: - Devices
    let fetchDeviceUrl = "/devices"
    
    //MARK: - Users
    let fetchCurrentUserUrl = "/users/profile"
}
