//
//  String+Ext.swift
//  WorldTrotter-MarzouqAlmukhlif_AbdulazizAlhwiti
//
//  Created by Marzouq Almukhlif on 25/04/1443 AH.
//

import UIKit

extension String {
  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: String, string2: String)
  -> Bool {
    
    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2) {
      return false
    }
    
    let allowedCharacters = CharacterSet.decimalDigits.union(["."])
    let forbiddenCharacters = allowedCharacters.inverted
    let foundForbiddenCharacters = string2.rangeOfCharacter(from: forbiddenCharacters)
    
    if foundForbiddenCharacters != nil {
      return false
    } else {
      return true
    }
    
  }
  
  func hasConcatenationMoreThanOneDecimalSeparator(_ string1: String, _ string2: String)
  -> Bool {
    let string1HasDecimalSeparator = string1.range(of: ".")
    let string2HasDecimalSeparator = string2.range(of: ".")
    
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    } else {
      return false
    }
  }
 
  
  func localize() -> String {
      return NSLocalizedString(self,
                        tableName: "Localizable",
                        bundle: .main,
                        value: self,
                        comment: self)
    } 
}
