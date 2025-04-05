//
//  Comments.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation

struct Comments: Identifiable {
    var id = UUID().uuidString
    let currentUser: CurrentUser
    let commentText: String
    let likesCount: Int
    let timeStamp: Date
}
