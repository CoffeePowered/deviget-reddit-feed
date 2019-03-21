//
//  PostsViewController.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension PostsViewController: PostsViewing {
    func update() {
    }
    
    func present(post: Post, usingSplitView: Bool) {
    }
    
    func dismissCellAtIndex(_ index: Int) {
    }
    
    func show(message: String, withTitle: String) {
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell ?? UITableViewCell()
    }
    
    
}
