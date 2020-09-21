//
//  CalculatorCell.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 15.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class CalculatorCell: UICollectionViewCell,ReusableCell {
    
    typealias T = DefaultCellModel<CalculatorButtonViewModel>
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var contentLabel:UILabel!
    
    @IBOutlet weak var titleLeadingConst:NSLayoutConstraint!
    @IBOutlet weak var titleCenterXConst:NSLayoutConstraint!
    
    
    var item: DefaultCellModel<CalculatorButtonViewModel>?{
        didSet {
            let button = item?.property?.model?.calcultorButton
          
            switch button {
            case .decimal,.one,.two,.three,.four,.five,.six,.seven,.eight,.nine,.AC:

                titleLeadingConst.isActive = false
                titleCenterXConst.isActive = true
                
                enableTitleLabel()
            case .zero:
                titleLeadingConst.isActive = true
                titleCenterXConst.isActive = false
                enableTitleLabel()
            default:
                imageView.isHidden = false
                contentLabel.isHidden = true
                imageView.image = UIImage(named: (item?.property?.model!.title)!)
            }
            
            self.backgroundColor = item?.property?.model?.backgroundColor
            
            
        }
    }
    
    func enableTitleLabel() {
        imageView.isHidden = true
        contentLabel.isHidden = false
        
        if item?.property?.model?.calcultorButton == .AC {
            contentLabel.textColor = .black
        }else{
            contentLabel.textColor = .white
        }
        
        contentLabel.text = item?.property?.model?.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.circle()
        }
    }
    
}
