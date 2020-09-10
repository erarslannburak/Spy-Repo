//
//  AlbumCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.layer.cornerRadius = 8
            self.layer.borderColor = UIColor.lightGray.cgColor
            self.layer.borderWidth = 0.75
        }
    }
    
    func configure(albumViewModel:AlbumViewModel) {
        nameLabel.text = albumViewModel.name
    }

}
