//
//  RepoSelectController.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class RepoSelectController: ViewController {

    @IBOutlet weak var deviceStorageButton: UIButton!
    @IBOutlet weak var remoteServerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deviceStorageAction(_ sender: Any) {
        showAlbumsVC()
    }
    
    @IBAction func remoteServerAction(_ sender: Any) {
    }
    
}
