//
//  PostsRepository.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

protocol PostsRepositoryProtocol {
    func fetchPosts(completion: ([Post])->Void, failure: ()->Void)
}

class PostsRepository {
    fileprivate var networkLayer: PostsNetworking?
    fileprivate var persistentStorage: PostsPersistable?
    
    init(withNetwork network: PostsNetworking, andStorage storage: PostsPersistable) {
        networkLayer = network
        persistentStorage = storage
    }
}

extension PostsRepository: PostsRepositoryProtocol {
    func fetchPosts(completion: ([Post])->Void, failure: ()->Void) {
        guard let network = networkLayer else {
            completion([])
            return
        }
        network.fetchPosts(completion: { posts in
            // Do something, i.e. reconcile content from persistence vs content from the network response
            completion(posts)
        }, failure: failure)
    }
}
