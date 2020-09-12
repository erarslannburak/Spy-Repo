//
//  AlbumListController.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class AlbumListController: ViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var albumListViewModel = AlbumListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.ALBUMS
        self.addAlbumBarButtonItem()
        
        collectionView.registerAlbumCell()
        collectionView.delegate = self
        collectionView.dataSource = albumListViewModel.datasource
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
    
        albumListViewModel.datasource.configureCell = { [weak self] (cell, item, indexPath) in
            guard self != nil else {return}
            (cell as! AlbumCell).item = item
        }
    }
}

extension AlbumListController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showPhotoListVC(albumViewModel: albumListViewModel.didSelectItemAt(indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 56)/2
        return CGSize(width: width , height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}

extension AlbumListController {
    func addAlbumBarButtonItem() {
        let addAlbumButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlbum))
        self.navigationItem.rightBarButtonItem = addAlbumButton
    }
    
    @objc func addAlbum() {
        let alert = UIAlertController(title: Constants.ADD_ALBUM, message: Constants.INPUT_ALBUM_NAME_MESSAGE, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = Constants.INPUT_ALBUM_NAME_PLACEHOLDER
        }
        
        alert.addAction(UIAlertAction(title: Constants.ADD, style: .default, handler: { (action) in
            
            DispatchQueue.main.async {
                
                guard let textField = alert.textFields?.first else {
                    return
                }
                
                if !(textField.text?.isEmpty ?? true) {
                    self.albumListViewModel.addAlbum(name: textField.text!)
                    self.collectionView.reloadData()

                }else{
                    // Burada baska bir alert ile albüm ismi boş olamaz mesajı gösterilebilir.
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: Constants.CANCEL, style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
