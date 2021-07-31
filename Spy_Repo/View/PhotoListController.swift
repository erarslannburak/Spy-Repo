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
        
        photoListViewModel = albumViewModel.fetchPhotos()
        
        collectionView.registerPhotoCell()
        collectionView.delegate = self
        collectionView.dataSource = photoListViewModel.datasource
        collectionView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        
        photoListViewModel.datasource.configureCell = { [weak self] (cell,item,indexPath) in
            guard self != nil else{return}
            (cell as! PhotoCell).item = item
        }
    }
}

extension PhotoListController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 9)/4
        return CGSize(width: width , height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

extension PhotoListController {
    func addPhotoBarButtonItem() {
        let addAlbumButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        self.navigationItem.rightBarButtonItem = addAlbumButton
    }
    
    @objc func addPhoto() {
        
        let alert = UIAlertController(title: Constants.ADD_PHOTO, message: Constants.ADD_PHOTO_MESSAGE, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: Constants.CAMERA, style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: Constants.PHOTO_ALBUM, style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: Constants.CANCEL, style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
extension PhotoListController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {

            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        self.dismiss(animated: true) { [weak self] in

            guard let self = self else {return}
            
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
            
            let base64DataStr = image.convertImageToBase64String().encodeMyAlphabet()
            
            
            
//            self.photoListViewModel.addPhoto(base64DataStr: base64DataStr, parent: self.albumViewModel.id)
//            self.albumViewModel.updateCover(base64DataStr: base64DataStr)
//            self.collectionView.reloadData()
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
