//
//  conversionVC.swift
//  WorldTrotter-Review-Shuruq_BushraO
//
//  Created by Shorouq AlAnzi on 26/04/1443 AH.
//

import Foundation
import UIKit


class conversionVC: UIViewController , UITextFieldDelegate {

  var textBackup = String()

  let numberFormatter: NumberFormatter = {
      let nf = NumberFormatter()
      nf.numberStyle = .decimal
      nf.minimumFractionDigits = 0
      nf.maximumFractionDigits = 1
  return nf }()
  
  var fahrenheitValue: Measurement<UnitTemperature>?
  { didSet
    {
          updateCelsiusLabel()
      }
  }
  var celsiusValue: Measurement<UnitTemperature>? {
      if let fahrenheitValue = fahrenheitValue {
          return fahrenheitValue.converted(to: .celsius)
      } else {
  return nil }
  }
  
  
  func updateCelsiusLabel() {
    
    if let celsiusValue = celsiusValue {
      
      celsiusLabel.text =
               numberFormatter.string(from: NSNumber(value: celsiusValue.value))
   } else {
           celsiusLabel.text = "???"
       }
   }
  
  
  func textField(_ textField: UITextField,
                 shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    
    let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
    } else {
    return true }
    }
  
  
@IBOutlet var celsiusLabel: UILabel!

@IBOutlet weak var textField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("ConversionViewController loaded its view.")
    
    updateCelsiusLabel()
  }
    
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    
    if var text = textField.text {
        text = text.trimmingCharacters(in: .whitespaces)
        if let number = numberFormatter.number(from: text) {
          fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
          // Cannot convert text to valid number format
          if text.isEmpty || text == "." || text == "-" || text == "-." {
            // Accept text. Adding further input may make it a valid number
            fahrenheitValue = nil
          } else {
            // Reject text. Restore backup
            text = textBackup
          }
        }
        
        textField.text = text
        textBackup = text
      } else {
        // textField.text == nil
        fahrenheitValue = nil
      }
    }
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
      textField.resignFirstResponder()
  }
  
}
