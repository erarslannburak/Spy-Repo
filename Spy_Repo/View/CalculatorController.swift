//
//  CalculatorController.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class CalculatorController: ViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var resultLabel:UILabel!
    
    var calculatorButtonListViewModel = CalculatorButtonListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = calculatorButtonListViewModel.datasource
        
        calculatorButtonListViewModel.screenTitle.bind { (screenTitle) in
            self.resultLabel.text = screenTitle
        }
        
        
        calculatorButtonListViewModel.datasource.configureCell = {[weak self] (cell,item,indexPath) in
            guard self != nil else {return}
            (cell as! CalculatorCell).item = item
            
        }
        
        
        //        DispatchQueue.main.async {
//            self.showRepoSelecVC()
//            let repoStoryboard: UIStoryboard = UIStoryboard(name: "Repo", bundle: nil)
//            let navigationController = repoStoryboard.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
//            UIApplication.shared.windows.first?.rootViewController = navigationController
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//        }
    }
}

extension CalculatorController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        calculatorButtonListViewModel.didSelectForItemAt(indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width - 42)/4
        
        if calculatorButtonListViewModel.cellForItemAt(indexPath).calcultorButton == .zero {
            return CGSize(width: (itemWidth * 2)+14, height: itemWidth)
        }
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}
