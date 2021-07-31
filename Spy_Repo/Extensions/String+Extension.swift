//
//  String+Extension.swift
//  Spy_Repo
//
//  Created by Burak Erarslan on 31.07.2021.
//  Copyright © 2021 Burak Erarslan. All rights reserved.
//

import UIKit

extension String {
    func convertBase64StringToImage () -> UIImage {
        let imageData = Data.init(base64Encoded: self, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }
    
    func encodeMyAlphabet() -> String {
        return self.map({ $0.convertMyAlphabet() }).reduce("") {$0 + $1 + "\\"}
    }

    func decodeMyAlphabet() -> String {
        return self.split(separator: "\\").map {MyAlphabet(rawValue: String($0))?.decode() ?? ""}.reduce("") {$0 + $1}
    }
}
