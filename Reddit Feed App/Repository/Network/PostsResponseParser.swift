//
//  PostsResponseParser.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

struct MainPostsResponse : Codable {
    let data: DataPostsResponse
}

struct DataPostsResponse: Codable {
    let children: [PostChildNode]
    let after: String?
    let before: String?
}

struct PostChildNode: Codable {
    var data: Post
}

class PostsResponseParser {
    
    // Returns posts == nil if there was an error
    func parse(data: Data) -> (posts: [Post]?, before: String?, after: String?) {
        let decoder = JSONDecoder()
        do {
            let parsedResponse = try decoder.decode(MainPostsResponse.self, from: data)
            let posts = parsedResponse.data.children.map { $0.data }
            return (posts: posts, before: parsedResponse.data.before, after: parsedResponse.data.after)
        }
        catch {
            return (posts: nil, before: nil, after: nil)
        }
    }
}
