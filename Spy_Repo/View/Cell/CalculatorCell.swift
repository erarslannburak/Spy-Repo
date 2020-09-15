//
//  CalculatorCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 15.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class CalculatorCell: UICollectionViewCell,ReusableCell {
    
    typealias T = DefaultCellModel<CalculatorViewModel>
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var contentLabel:UILabel!
    
    
    var item: DefaultCellModel<CalculatorViewModel>?{
        didSet {
            
            if item?.property?.model?.type == .number {
                imageView.isHidden = true
                contentLabel.isHidden = false
                contentLabel.text = item?.property?.model?.content
            }else{
                imageView.isHidden = false
                contentLabel.isHidden = true
                imageView.image = UIImage(named: (item?.property?.model!.content)!)
            }
            
            self.backgroundColor = item?.property?.model?.color
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.circle()
        }
    }
    
}
