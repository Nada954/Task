//
//  UIImageView.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Kingfisher
import UIKit

extension UIImageView {
    func download(image url: URL?, placeholder: ImageAsset? = nil) {
        guard let url = url else { return }
        kf.indicatorType = .activity
        kf.setImage(with: url, placeholder: placeholder?.image)
    }
}
