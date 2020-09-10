//
//  CalculatorController.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 9.09.2020.
//  Copyright © 2020 Burak Erarslan. All rights reserved.
//

import UIKit

class CalculatorController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
//            self.showRepoSelecVC()
            let repoStoryboard: UIStoryboard = UIStoryboard(name: "Repo", bundle: nil)
            let navigationController = repoStoryboard.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
            UIApplication.shared.windows.first?.rootViewController = navigationController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
