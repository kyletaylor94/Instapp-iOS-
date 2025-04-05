//
//  CurrentUser.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation
import SwiftUI

struct CurrentUser: Identifiable {
    var id = UUID().uuidString
    let username: String
    let fullName: String
    let stat: ProfileStat
    let profileImage: Image
    var stories: [Image]?
}

let mockCurrentUser: [CurrentUser] = [
    CurrentUser(
        username: "kyletaylor",
        fullName: "Joe Doe",
        stat: ProfileStat(
            posts: 6,
            followers: 12,
            following: 44
        ),
        profileImage: Image(.mockPhoto)
    ),
    
    CurrentUser(
        username: "magordon",
        fullName: "Emma Gordon",
        stat: ProfileStat(
            posts: 3,
            followers: 34,
            following: 77
        ),
        profileImage: Image(.mockPhoto2)
    ),
    CurrentUser(
        username: "griffenPotter54",
        fullName: "Harry Potter",
        stat: ProfileStat(
            posts: 2,
            followers: 2,
            following: 5
        ),
        profileImage: Image(.mockPhoto3)
    )
]
