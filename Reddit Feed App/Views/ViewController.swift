//
//  ViewController.swift
//  Reddit Feed App
//
//  Created by Lucas on 20/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoVerticalCenter: NSLayoutConstraint!
    
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var logoWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.logoVerticalCenter.constant = strongSelf.view.frame.size.height * (-0.5)
            strongSelf.logoWidth.constant = 0
            strongSelf.logoHeight.constant = 0
            strongSelf.view.layoutIfNeeded()
        }, completion: {hasFinished in
            if hasFinished {
                self.performSegue(withIdentifier: "goToPosts", sender: self)
            }
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPosts",
            let nav = segue.destination as? UINavigationController,
            let postsViewController = nav.topViewController as? PostsViewController {
            let storage = PostsPersistentStorage()
            let network = PostsNetworkAPI()
            let repository = PostsRepository(withNetwork: network, andStorage: storage)
            let presenter = PostsPresenter(with: repository)
            postsViewController.presenter = presenter
        }
    }

}

