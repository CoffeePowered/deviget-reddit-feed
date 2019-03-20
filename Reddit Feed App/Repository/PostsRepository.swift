//
//  PostsRepository.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

// A repository is responsible for providing data to client objects -typically, a presenter.
protocol PostsRepositoryProtocol {
    func fetchInitialPosts(completion: @escaping ([Post])->Void, failure: @escaping ()->Void)
    func fetchMorePosts(completion: @escaping ([Post])->Void, failure: @escaping ()->Void)
    func post(_ post: Post, markAsRead: Bool)
    func isBusy() -> Bool
}

// A PostsRepository does the fetching via a networking layer and a persistence layer
// Both of these layers are provided via dependency injection
class PostsRepository {
    fileprivate var networkLayer: PostsNetworking?
    fileprivate var persistentStorage: PostsPersistable?
    
    fileprivate var before: String?
    fileprivate var after: String?
    fileprivate let limit: Int = 15
    
    init(withNetwork network: PostsNetworking, andStorage storage: PostsPersistable) {
        networkLayer = network
        persistentStorage = storage
    }
}

extension PostsRepository: PostsRepositoryProtocol {
    
    func fetchInitialPosts(completion: @escaping ([Post])->Void, failure: @escaping ()->Void) {
        before = nil
        after = nil
        guard let network = networkLayer else {
            completion([])
            return
        }
        network.fetchPosts(after: nil, limit: limit, completion: { (posts, before, after) in
            // Do something, i.e. sync content from persistence vs content from the network response
            
        }, failure: failure)
    }

    func fetchMorePosts(completion: @escaping ([Post]) -> Void, failure: @escaping () -> Void) {
        
    }
    
    func post(_ post: Post, markAsRead: Bool) {
        
    }
    
    func isBusy() -> Bool {
        guard let networkLayer = networkLayer else { return false }
        return networkLayer.isBusy()
    }

}
