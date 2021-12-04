//
//  String+Ext.swift
//  Prototype-Internationalization_Localization- Nada_Bushra.
//
//  Created by apple on 26/04/1443 AH.
//
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
//   الدالة ذي جاهره
}

