//
//  ViewController.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
//    func showRepoSelecVC() {
//        let VC = UIStoryboard.init(name: "Repo", bundle: Bundle.main).instantiateViewController(withIdentifier: "showRepoSelecVC") as? RepoSelectController
//        self.navigationController?.pushViewController(VC!, animated: true)
//    }
    
    func showAlbumsVC() {
        let VC = UIStoryboard.init(name: "Repo", bundle: Bundle.main).instantiateViewController(withIdentifier: "showAlbumVC") as? AlbumListController
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    func showPhotoListVC(albumViewModel:AlbumViewModel) {
        let VC = UIStoryboard.init(name: "Repo", bundle: Bundle.main).instantiateViewController(withIdentifier: "photoListVC") as? PhotoListController
        VC?.albumViewModel = albumViewModel
        self.navigationController?.pushViewController(VC!, animated: true)
    }
}

