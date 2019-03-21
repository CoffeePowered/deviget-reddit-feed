//
//  Post.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation

struct Post: Codable {
    let name: String?
    let title: String?
    let thumbnail: String?
    let created: Int?
    let author: String?
    let num_comments: Int?
    
    init() {
        name = ""
        title = ""
        thumbnail = ""
        created = 0
        author = ""
        num_comments = 0
    }
}
