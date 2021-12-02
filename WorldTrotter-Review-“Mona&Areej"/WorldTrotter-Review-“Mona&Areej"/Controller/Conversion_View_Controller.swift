//
//  ViewController.swift
//  WorldTrotter-Review-“Mona&Areej"
//
//  Created by mona M on 29/11/2021.
//

import UIKit

class ConversionViewController: UIViewController , UITextViewDelegate {
  
  
 
  
  
  @IBOutlet weak var valueCelsiusLabel: UILabel!
  @IBOutlet weak var valueFahrenheitTextField: UITextField!
  
  var fahrenheitValue: Measurement<UnitTemperature>?{
    didSet {
      updateCelsiusLabel()
    }
  }
 
  
  
  var celsiusValue: Measurement<UnitTemperature>? {
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil
    }
  }
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateCelsiusLabel()
    configureHideKeyboardWhenRootViewTapped()
    print("Conversion View Controller loaded its view. ")
  }
  
  
  
  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    valueFahrenheitTextField.resignFirstResponder()
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = valueFahrenheitTextField.text,
       let value =
        Double(text) {
      fahrenheitValue = Measurement(value: value,
                                    unit:.fahrenheit)
    } else {
      fahrenheitValue = nil
    }
    
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      valueCelsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
    } else {
      valueCelsiusLabel.text = "???"
    }
  }
  
  
  func textField(
      _ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String
    ) -> Bool {
      print("Current text: \(String(describing: textField.text))")
      print("Replacement text: <\(string)> ", terminator: "")
      
      let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
      let replacementStringCharacterSet = CharacterSet(charactersIn: string)
      if !replacementStringCharacterSet.isSubset(of: allowedCharacterSet) {
        print("Rejected (Invalid Character)")
        return false
      }
    
    
      let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
      let replacementTextHasDecimalSeparator = string.range(of: ".")
      if existingTextHasDecimalSeparator != nil,
        replacementTextHasDecimalSeparator != nil {
        print("Rejected (Already has decimal point)")
        return false
      } else {
        print("Accepted")
        return true
      }

      
      
}
  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: String,
                                                     string2: String)
  -> Bool {
    print("\n\n \(#function)")
        print(" - string1:  \(string1)")
        print(" - string2:  \(string2)")
         
    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2) {
          return false
        }
        // Check only decimalDigits (0-9) and decimal separator
        let allowedCharacters = CharacterSet.decimalDigits.union(["."])
        let forbiddenCharacters = allowedCharacters.inverted
        let foundForbiddenCharacters
          = string2.rangeOfCharacter(from: forbiddenCharacters)
        print("foundForbiddenCharacters: \(String(describing:foundForbiddenCharacters))")
        if foundForbiddenCharacters != nil {
          return false
        } else {
          return true
        }
      }
       
  func hasConcatenationMoreThanOneDecimalSeparator(_ string1: String,
                                                   _ string2: String)
  -> Bool {
      let string1HasDecimalSeparator = string1.range(of: ".")
      let string2HasDecimalSeparator = string2.range(of: ".")
       
      print("\n \(#function)")
      print("string1HasDecimalSeparator:  \(String(describing:string1HasDecimalSeparator))")
      print("string2HasDecimalSeparator:  \(String(describing:string2HasDecimalSeparator))")
       
      if string1HasDecimalSeparator != nil,
         string2HasDecimalSeparator != nil {
        return true
      } else {
        return false
      }
    }
    
    
    
}
