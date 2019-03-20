//
//  Network.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

protocol PostsNetworking {
    // The completion block must return an array of Posts, a "before" identifier, and an "after" identifier
    func fetchPosts(after: String?, limit: Int, completion: @escaping ([Post], String?, String?)->Void, failure: @escaping ()->Void)
    
    // Returns true if there is a network call in progress. False otherwise.
    func isBusy() -> Bool
}

class PostsNetworkAPI {
    var feedURLString = "https://www.reddit.com/top.json"
    fileprivate var callInProgress: Bool = false
}

extension PostsNetworkAPI: PostsNetworking {
    func fetchPosts(after: String?, limit: Int, completion: @escaping ([Post], String?, String?)->Void, failure: @escaping ()->Void) {
        callInProgress = true
        if let baseUrl = URL(string: feedURLString) {
            var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
            var queryItems: [URLQueryItem] = []
            if let after = after {
                queryItems = [URLQueryItem(name: "after", value: after)]
            }
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            components?.queryItems = queryItems
            guard let url = components?.url else {
                failure()
                return
            }
            var request = URLRequest(url: url)
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request, completionHandler:{
                [weak self] (data, response, error) in
                guard let data = data, let strongSelf = self else {
                    failure()
                    return
                }
                let parser = PostsResponseParser()
                let parsedResponse = parser.parse(data: data)
                if let posts = parsedResponse.posts {
                    strongSelf.callInProgress = false
                    completion(posts, parsedResponse.before, parsedResponse.after)
                    return
                }
                strongSelf.callInProgress = false
                failure()
            })
            task.resume()
        }
    }
    
    func isBusy() -> Bool {
        return callInProgress
    }
}
