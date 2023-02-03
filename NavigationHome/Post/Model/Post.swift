//
//  Post.swift
//  NavigationHome
//
//  Created by Ella Timoncheva on 25.11.2022.
//

import Foundation

struct Post {
    let id = UUID()
    let author, description, image: String
    var likes, views: Int
    
    static let dummyPosts: [Post] = [
        Post(author: "Reddit", description: "Reddit Launches its ‘Reddit Recap’ Activation for 2022, Provides New Usage Insights", image: "post3", likes: 122, views: 222),
        Post(author: "Pinterest", description: "Pinterest Shares its 2023 Trend Predictions, Based on Pin Activity and Engagement", image: "post2", likes: 134, views: 2222),
        Post(author: "NewGram", description: "NewGram Updates Account Status with New Insight into ‘Shadowbans’", image: "post4", likes: 22, views: 111)
    ]
}
