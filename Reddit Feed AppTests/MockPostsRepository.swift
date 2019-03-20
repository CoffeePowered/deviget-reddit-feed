//
//  MockPostsRepository.swift
//  Reddit Feed AppTests
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

class MockPostsRepository: PostsRepositoryProtocol {
    // Set this flag to cause the requests to fail
    var shouldFail = false
    
    // Set the posts to be returned in case of success --that is, if shouldFail is set to false
    var posts: [Post] = []
    
    func fetchPosts(completion: ([Post])->Void, failure: ()->Void) {
        if shouldFail {
            completion(posts)
            return
        }
        failure()
    }
}
