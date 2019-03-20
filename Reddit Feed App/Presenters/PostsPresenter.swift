//
//  PostsPresenter.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation
import UIKit

// Presentation logic interface methods
protocol PostsPresenting {
    func reloadPosts(completion: ()->Void)
    func fetchMorePosts(completion: ()->Void)
    func postsCount() -> Int
    func showDetail(in view: PostsViewing, for post: Post, inViewOfSize: CGSize)
}

// Presentation view interface methods
protocol PostsViewing {
    func updateTable()
    func present(post: Post, usingSplitView: Bool)
}

class PostsPresenter {
    fileprivate var repository: PostsRepositoryProtocol?
    
    init(with repo: PostsRepositoryProtocol) {
        repository = repo
    }
}

extension PostsPresenter: PostsPresenting {
    
    func showDetail(in view: PostsViewing, for post: Post, inViewOfSize: CGSize) {
    }
    
    func reloadPosts(completion: () -> Void) {
    }
    
    func fetchMorePosts(completion: () -> Void) {
    }
    
    func postsCount() -> Int {
        return 0
    }
}
