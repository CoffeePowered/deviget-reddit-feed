//
//  PostsPresenter.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation
import UIKit

// Interface methods for a posts feed presentation logic object
protocol PostsPresenting {
    func refreshPosts(completion: ()->Void)
    func fetchMorePosts(completion: ()->Void)
    func postsCount() -> Int
    func showDetail(in view: PostsViewing, forItemAt index: Int, inViewOfSize size: CGSize)
    func cellViewModel(forIndex index: Int) -> PostCellViewModel
    func view(_ view: PostsViewing, didTapDismissAt index: Int)
}

// Interface methods for a posts feed view
protocol PostsViewing {
    func update()
    func present(post: Post, usingSplitView: Bool)
    func dismissCellAtIndex(_ index: Int)
    func show(message: String, withTitle: String)
}

class PostsPresenter {
    
    fileprivate var repository: PostsRepositoryProtocol?
    fileprivate var posts: [Post] = []
    
    init(with repo: PostsRepositoryProtocol) {
        repository = repo
    }
    
    func viewModel(for post: Post) -> PostCellViewModel {
        return PostCellViewModel(author: post.author,
                                 timeAgo: String(describing: post.created),
                                 shouldShowDot: true,
                                 title: post.title,
                                 comments: String(describing: post.num_comments),
                                 thumbnailURL: nil)
    }
    
    func shouldUseSplitView(for size: CGSize) -> Bool {
        // TO DO: Implement split view
        return false
    }
}

extension PostsPresenter: PostsPresenting {
    
    func showDetail(in view: PostsViewing, forItemAt index: Int, inViewOfSize size: CGSize) {
        if index >= 0 && index < posts.count {
            view.present(post: posts[index], usingSplitView: shouldUseSplitView(for: size))
        }
    }
    
    func refreshPosts(completion: () -> Void) {
        guard let repo = repository else { return }
        repo.fetchInitialPosts(completion: {[weak self] posts in
            if let strongSelf = self {
                strongSelf.posts.append(contentsOf: posts)
            }
        }, failure: {
            
        })
    }
    
    func fetchMorePosts(completion: () -> Void) {
        guard let repo = repository else { return }
        repo.fetchMorePosts(completion: {posts in }, failure: {})
    }
    
    func postsCount() -> Int {
        return 0
    }
    
    func cellViewModel(forIndex index: Int) -> PostCellViewModel {
        return PostCellViewModel(author: "",
                                 timeAgo: "",
                                 shouldShowDot: true,
                                 title: "",
                                 comments: "",
                                 thumbnailURL: nil)
    }
    
    func view(_ view: PostsViewing, didTapDismissAt index: Int) {
        
    }
}


