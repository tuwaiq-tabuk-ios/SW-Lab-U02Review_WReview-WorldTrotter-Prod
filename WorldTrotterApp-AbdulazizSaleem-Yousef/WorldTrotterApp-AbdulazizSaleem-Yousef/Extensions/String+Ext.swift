//
//  String+Ext.swift
//  WorldTrotterApp-AbdulazizSaleem-Yousef
//
//  Created by Yousef Albalawi on 26/04/1443 AH.
//

import UIKit

extension String {
  
  func localize() -> String {
    return NSLocalizedString(self, tableName: "", bundle: .main, value: self, comment: self)
  }
}
