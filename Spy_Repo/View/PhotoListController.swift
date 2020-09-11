//
//  PhotoListController.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class PhotoListController: ViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var albumViewModel:AlbumViewModel!
    var photoListViewModel:PhotoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = albumViewModel.name
        addPhotoBarButtonItem()
        
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        photoListViewModel = albumViewModel.fetchPhotos()
        collectionView.reloadData()
    }
}

extension PhotoListController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoListViewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else {return UICollectionViewCell()}
        cell.configure(photoViewModel: photoListViewModel.cellForItemAt(indexPath))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 16)/3
        return CGSize(width: width , height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

extension PhotoListController {
    func addPhotoBarButtonItem() {
        let addAlbumButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        self.navigationItem.rightBarButtonItem = addAlbumButton
    }
    
    @objc func addPhoto() {
        photoListViewModel.addPhoto(data: (UIImage(named: "art")?.jpegData(compressionQuality: 0.5))!, parent: albumViewModel.id)
        collectionView.reloadData()
    }
}
