//
//  MockPostsNetworkAPI.swift
//  Reddit Feed AppTests
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

class MockPostsNetworkAPI: PostsNetworking {
    
    var shouldFail = false
    
    func fetchPosts(after: String?, limit: Int, completion: @escaping ([Post]) -> Void, failure: @escaping () -> Void) {
        if shouldFail {
            completion([])
            return
        }
        failure()
    }
}

