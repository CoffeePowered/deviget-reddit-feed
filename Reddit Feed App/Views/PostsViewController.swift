//
//  PostsViewController.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    var presenter: PostsPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        activityIndicator(showIt: true)
        if let presenter = presenter {
            presenter.refreshPosts(view: self, completion: { [weak self] in
                guard let strongSelf = self else { return }
                DispatchQueue.main.async {
                    strongSelf.activityIndicator(showIt: false)
                }
            })
        }
    }
    
    func activityIndicator(showIt: Bool) {
        if showIt {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
}

extension PostsViewController: PostsViewing {
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        return presenter?.postsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PostsTableViewCell,
              let presenter = presenter,
              let viewModel = presenter.cellViewModel(forIndex: indexPath.row) else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let presenter = presenter else { return }
        if indexPath.row == presenter.postsCount() - 1 {
            activityIndicator(showIt: true)
            presenter.fetchMorePosts(view: self, completion: { [weak self] in
                guard let strongSelf = self else { return }
                DispatchQueue.main.async {
                    strongSelf.activityIndicator(showIt: false)
                }
            })
        }
    }
}
