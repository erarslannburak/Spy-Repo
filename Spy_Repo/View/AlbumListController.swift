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
    
    var albumListViewModel = AlbumListViewModel(albumViewModelList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Albümler"
        self.addAlbumBarButtonItem()
        
        collectionView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellWithReuseIdentifier: "albumCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        albumListViewModel.fetchData()
        collectionView.reloadData()
    }
}

extension AlbumListController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumListViewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as? AlbumCell else {return UICollectionViewCell()}
        cell.configure(albumViewModel: (albumListViewModel.cellForItemAt(indexPath)))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showPhotoListVC(albumViewModel: albumListViewModel.cellForItemAt(indexPath))
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
        let alert = UIAlertController(title: "Albüm Ekle", message: "Lütfen eklemek istediğiniz albümün adını giriniz.", preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "Albüm Adı"
        }
        
        alert.addAction(UIAlertAction(title: "Ekle", style: .default, handler: { (action) in
            guard let textField = alert.textFields?.first else {
                return
            }
            if !(textField.text?.isEmpty ?? true) {
//                self.albumListViewModel.add(name: textField.text!)
                self.albumListViewModel.addAlbum(name: textField.text!)
                self.collectionView.reloadData()
            }else{
                // Burada baska bir alert ile albüm ismi boş olamaz mesajı gösterilebilir.
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
