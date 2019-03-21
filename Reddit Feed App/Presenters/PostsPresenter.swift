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
    func refreshPosts(view: PostsViewing, completion: @escaping ()->Void)
    func fetchMorePosts(view: PostsViewing, completion: @escaping ()->Void)
    func postsCount() -> Int
    func showDetail(in view: PostsViewing, forItemAt index: Int, inViewOfSize size: CGSize)
    func cellViewModel(forIndex index: Int) -> PostCellViewModel?
    func view(_ view: PostsViewing, didReceiveTapToDismiss index: Int)
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
        let timestamp = Int(Date().timeIntervalSince1970)
        let timeAgo = TimeAgoStringHelper.timeAgoString(sinceTimestamp: post.created ?? 0, currentTimestamp: timestamp)
        var comments = ""
        if let numComments = post.num_comments {
            comments = String(numComments) + " comments"
        }
        return PostCellViewModel(author: post.author,
                                 timeAgo: timeAgo,
                                 shouldShowDot: true,
                                 title: post.title,
                                 comments: comments,
                                 thumbnailURL: URL(string: post.thumbnail ?? ""))
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
    
    func refreshPosts(view: PostsViewing, completion: @escaping () -> Void) {
        guard let repo = repository else { return }
        repo.fetchInitialPosts(completion: { [weak self] posts in
            if let strongSelf = self {
                strongSelf.posts = posts
                view.update()
                completion()
            }
        }, failure: {
            view.show(message: "Something went wrong", withTitle: "Oops!")
        })
    }
    
    func fetchMorePosts(view: PostsViewing, completion: @escaping () -> Void) {
        guard let repo = repository else { return }
        repo.fetchMorePosts(completion: { [weak self] posts in
            if let strongSelf = self {
                strongSelf.posts.append(contentsOf: posts)
                view.update()
                completion()
            }
        }, failure: {
            view.show(message: "Something went wrong", withTitle: "Oops!")
        })
    }
    
    func postsCount() -> Int {
        return posts.count
    }
    
    func cellViewModel(forIndex index: Int) -> PostCellViewModel? {
        if index >= 0 && index < posts.count {
            return viewModel(for: posts[index])
        }
        return nil
    }
    
    func view(_ view: PostsViewing, didReceiveTapToDismiss index: Int) {
        view.dismissCellAtIndex(index)
    }
}


