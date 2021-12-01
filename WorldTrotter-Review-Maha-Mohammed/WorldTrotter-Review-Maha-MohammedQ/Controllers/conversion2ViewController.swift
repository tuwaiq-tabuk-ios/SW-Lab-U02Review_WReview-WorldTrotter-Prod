//
//  Conversion2ViewController.swift
//  WorldTrotter-Review-Maha-MohammedQ
//
//  Created by Maha S on 29/11/2021.
//

import UIKit

class conversion2ViewController: UIViewController, UITextFieldDelegate {
  
  
  @IBOutlet var valueCelsiusLabel: UILabel!
  @IBOutlet var valueFahrenheitTextField: UITextField!
  
  @IBAction func dissMissKeyboard(_ sender: UITapGestureRecognizer) {
    valueFahrenheitTextField.resignFirstResponder()
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
    
    if let text = valueFahrenheitTextField.text, let value =
        Double(text) {
      fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
    
  }
  
  let numberFormatter: NumberFormatter = {
    
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  } ()
  
  
  var celsiusValue: Measurement<UnitTemperature>? {
    
    if let fahrenheitValue = fahrenheitValue {
      return fahrenheitValue.converted(to: .celsius)
    } else {
      return nil
    }
  }
  
  
  func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    guard let text = textField.text else { return false }
    
    return hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text, string2: string)
  }
  
  
  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator (string1: String , string2: String) -> Bool {
    
    print("\n\n \(#function)")
    print(" - string1: \(string1)")
    print(" - string2: \(string2)")
    
    if hasConcatenationMoreThanOneDecimalSeparator(string1, string2) {
      return false
    }
    let allowedCharacters = CharacterSet.decimalDigits.union(["."])
    let forbiddenCharacters = allowedCharacters.inverted
    
    let foundForbiddenCharacters = string2.rangeOfCharacter(from: forbiddenCharacters)
    
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
    print("string1HasDecimalSeparator:  \(String(describing: string1HasDecimalSeparator))")
    print("string2HasDecimalSeparator:  \(String(describing: string2HasDecimalSeparator))")
    
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    } else {
      return false
    }
  }
  
  
  func updateCelsiusLabel() {
    if let celsiusValue = celsiusValue {
      valueCelsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
      
    } else {
      valueCelsiusLabel.text = "???"
    }
  }
  
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelsiusLabel()
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    valueFahrenheitTextField.delegate = self
    configureHideKeyboardWhenRootViewTapped()
    updateCelsiusLabel()
    print("conversion2 View Controller loaded its view")
  }
  
}
