//
//  PostModel.swift
//  Instapp
//
//  Created by Turdesan Csaba on 2025. 04. 04..
//

import Foundation
import SwiftUICore

struct PostModel: Identifiable {
    var id = UUID().uuidString
    let comments: [Comments]
    let commentCount: Int
    let likesCount: Int
    let caption: String
    let timestamp: Date
   // let images: [Image]
    let postByUser: CurrentUser
}

let mockPosts: [PostModel] = [
    PostModel(
        comments: [
            Comments(
                currentUser: CurrentUser(
                    username: "emma_smith",
                    fullName: "Emma Smith",
                    stat: ProfileStat(posts: 45, followers: 1200, following: 890),
                    profileImage: Image(.mockPhoto)
                ),
                commentText: "Beautiful sunset! 🌅",
                likesCount: 12,
                timeStamp: Date().addingTimeInterval(-3600)
            ),
            Comments(
                currentUser: CurrentUser(
                    username: "john_doe",
                    fullName: "John Doe",
                    stat: ProfileStat(posts: 23, followers: 450, following: 230),
                    profileImage: Image(.mockPhoto)
                ),
                commentText: "Amazing view! Where is this?",
                likesCount: 5,
                timeStamp: Date().addingTimeInterval(-7200)
            )
        ],
        commentCount: 2,
        likesCount: 156,
        caption: "Chasing sunsets and making memories ✨ #sunset #nature #photography",
        timestamp: Date().addingTimeInterval(-86400),
        postByUser: mockCurrentUser[0]
    ),
    PostModel(
        comments: [
            Comments(
                currentUser: CurrentUser(
                    username: "sarah_wilson",
                    fullName: "Sarah Wilson",
                    stat: ProfileStat(posts: 67, followers: 2300, following: 1200),
                    profileImage: Image(.mockPhoto)
                ),
                commentText: "Love your coffee art! ☕️",
                likesCount: 8,
                timeStamp: Date().addingTimeInterval(-1800)
            )
        ],
        commentCount: 1,
        likesCount: 89,
        caption: "Morning coffee ritual ☕️ #coffee #barista #coffeeart",
        timestamp: Date().addingTimeInterval(-43200),
        postByUser: mockCurrentUser[1]
    ),
    PostModel(
        comments: [
            Comments(
                currentUser: CurrentUser(
                    username: "mike_brown",
                    fullName: "Mike Brown",
                    stat: ProfileStat(posts: 34, followers: 780, following: 560),
                    profileImage: Image(.mockPhoto)
                ),
                commentText: "Great shot! 📸",
                likesCount: 3,
                timeStamp: Date().addingTimeInterval(-5400)
            ),
            Comments(
                currentUser: CurrentUser(
                    username: "lisa_parker",
                    fullName: "Lisa Parker",
                    stat: ProfileStat(posts: 89, followers: 3400, following: 2100),
                    profileImage: Image(.mockPhoto)
                ),
                commentText: "The colors are amazing!",
                likesCount: 7,
                timeStamp: Date().addingTimeInterval(-3600)
            )
        ],
        commentCount: 2,
        likesCount: 234,
        caption: "Street photography in the city 🏙️ #streetphotography #citylife #urban",
        timestamp: Date().addingTimeInterval(-21600),
        postByUser: mockCurrentUser[2]
    )
]
