//
//  MockPostsView.swift
//  Reddit Feed AppTests
//
//  Created by Lucas on 21/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation
@testable import Reddit_Feed_App

class MockPostsView: PostsViewing {
    
    var didCallUpdate = false
    var presentedPost: Post?
    var didCallDismissCell = false
    var shownMessage: (message: String, title: String)?
    
    func update() {
        didCallUpdate = true
    }
    
    func present(post: Post, usingSplitView: Bool) {
        presentedPost = post
    }
    
    func dismissCellAtIndex(_ index: Int) {
        didCallDismissCell = true
    }
    
    func show(message: String, withTitle: String) {
        self.shownMessage = (message: message, title: withTitle)
    }
    
    
}
