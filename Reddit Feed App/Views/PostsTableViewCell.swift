//
//  PostsTableViewCell.swift
//  Reddit Feed App
//
//  Created by Lucas on 21/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

struct PostCellViewModel {
    let author: String?
    let timeAgo: String?
    let shouldShowDot: Bool
    let title: String?
    let comments: String?
    let thumbnailURL: URL?
}

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readMarkDotLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: PostCellViewModel) {
        authorLabel.text = viewModel.author
        timeAgoLabel.text = viewModel.timeAgo
        titleLabel.text = viewModel.title
        readMarkDotLabel.isHidden = !viewModel.shouldShowDot
        commentsLabel.text = viewModel.comments
        thumbnailImageView.load(url: viewModel.thumbnailURL)
    }

    @IBAction func didTapMainArea(_ sender: Any) {
    }
    
    @IBAction func didTapDismiss(_ sender: Any) {
    }
    
}
