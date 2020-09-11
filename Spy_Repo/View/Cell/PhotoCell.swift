//
//  PhotoCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 10.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var imageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(photoViewModel:PhotoViewModel) {
//        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: photoViewModel.image)
//        }
    }
}
