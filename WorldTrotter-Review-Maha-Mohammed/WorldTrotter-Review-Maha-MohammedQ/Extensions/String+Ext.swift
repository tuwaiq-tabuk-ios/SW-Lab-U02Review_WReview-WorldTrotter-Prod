//
//  String+Ext.swift
//  WorldTrotter-Review-Maha-MohammedQ
//
//  Created by Maha S on 01/12/2021.
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
