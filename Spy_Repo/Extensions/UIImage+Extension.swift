//
//  UIImage+Extension.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 31.07.2021.
//  Copyright © 2021 Burak Erarslan. All rights reserved.
//

import UIKit

extension UIImage {
    func convertImageToBase64String() -> String {
        return self.jpegData(compressionQuality: 0.75)?.base64EncodedString() ?? ""
    }
}
