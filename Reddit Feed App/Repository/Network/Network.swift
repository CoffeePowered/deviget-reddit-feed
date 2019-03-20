//
//  Network.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

protocol PostsNetworking {
    func fetchPosts(completion: ([Post])->Void, failure: ()->Void)
}

class PostsNetworkAPI {
}

extension PostsNetworkAPI: PostsNetworking {
    func fetchPosts(completion: ([Post])->Void, failure: ()->Void) {
        completion([])
    }
}
