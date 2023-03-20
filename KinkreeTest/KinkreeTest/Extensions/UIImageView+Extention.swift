//
//  UIImageView+Extention.swift
//  KinkreeTest
//
//  Created by Administrator on 17/03/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.setImage(with: resource)
    }
}
