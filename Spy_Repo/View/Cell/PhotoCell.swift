//
//  PhotoCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 10.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell,ReusableCell {

    typealias T = DefaultCellModel<PhotoViewModel>
    
    @IBOutlet weak var imageView:UIImageView!
    
    var item: DefaultCellModel<PhotoViewModel>?{
        didSet {
//            self.imageView.image = UIImage(data: (item?.property?.model!.image)!)
            self.imageView.image = (item?.property?.model!.image)?.convertBase64StringToImage()

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
