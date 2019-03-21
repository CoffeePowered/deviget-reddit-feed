//
//  ImageFromURLExtension.swift
//  Reddit Feed App
//
//  Created by Lucas on 21/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit
extension UIImageView {
    
    func load(url: URL?) {
        
        guard let url = url else {
            self.image = nil
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
}
