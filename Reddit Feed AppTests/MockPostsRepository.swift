//
//  MockPostsRepository.swift
//  Reddit Feed AppTests
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation
@testable import Reddit_Feed_App

class MockPostsRepository: PostsRepositoryProtocol {
    
    
    /*
    func fetchMorePosts(completion: @escaping ([Post]) -> Void, failure: @escaping () -> Void) {
        if shouldFail {
            completion(posts)
            return
        }
        failure()
    }
    
    func fetchInitialPosts(completion: @escaping ([Post]) -> Void, failure: @escaping () -> Void) {
    }
    
    func post(_ post: Post, markAsRead: Bool) {
    }
    
    func isBusy() -> Bool {
        return false
    }
*/

    // Set this flag to cause the requests to fail
    var shouldFail = false
    
    // Set the posts to be returned in case of success --that is, if shouldFail is set to false
    var posts: [Post] = []
    
    func fetchInitialPosts(completion: @escaping ([Post])->Void, failure: @escaping ()->Void) {}
    func fetchMorePosts(completion: @escaping ([Post])->Void, failure: @escaping ()->Void) {}
    func post(_ post: Post, markAsRead: Bool) {}
    func isBusy() -> Bool { return false }
}
