//
//  PostsPersistance.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

protocol PostsPersistable {
    func post(_ post: Post, markAsRead: Bool)
    func postIsRead() -> Bool
}

class PostsPersistentStorage {
}

extension PostsPersistentStorage: PostsPersistable {

    func post(_ post: Post, markAsRead: Bool) {
        
    }
    
    func postIsRead() -> Bool {
        return false
    }
}
