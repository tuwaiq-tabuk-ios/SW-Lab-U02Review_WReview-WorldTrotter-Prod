//
//  Extension.swift
//  Internationalization-Rasha-Boshra-Shoroq
//
//  Created by rasha  on 26/04/1443 AH.
//


import UIKit
extension String {
  func localize() -> String {
    return NSLocalizedString(self,
    tableName: "Localizable",
        bundle: .main,
         value: self,
         comment: self)
}
}
