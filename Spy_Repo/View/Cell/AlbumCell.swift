//
//  AlbumCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell,ReusableCell {

    typealias T = DefaultCellModel<AlbumViewModel>
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameContainerView:UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var item: DefaultCellModel<AlbumViewModel>?{
        didSet {
            
            nameLabel.text = item?.property?.model?.name
            
            item?.property?.model?.coverImage.bind(listener: { [weak self] (base64DataStr)  in
                self?.imageView.image = base64DataStr.convertBase64StringToImage()
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.cornerRadius(radius: 8)
            self.nameContainerView.blur()
        }
    }
}
