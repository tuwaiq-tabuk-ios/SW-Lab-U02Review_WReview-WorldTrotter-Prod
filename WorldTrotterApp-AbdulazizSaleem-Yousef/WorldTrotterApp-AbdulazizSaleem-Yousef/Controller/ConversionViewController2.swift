//
//  ConversionViewController2.swift
//  WorldTrotterApp-AbdulazizSaleem-Yousef
//
//  Created by Yousef Albalawi on 25/04/1443 AH.
//

import UIKit


class ConversionViewController2: UIViewController , UITextFieldDelegate {
  
  
  @IBOutlet var valueFahrenheitTextField: UITextField!
  
  
  @IBOutlet weak var valueCelsiusLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureHideKeyboardWhenRootViewTapped()
    valueFahrenheitTextField.delegate = self
    print("ConversionViewController loaded its view.")
  }
  
  
  @IBAction func fahrenheitFieldEditingChanged(
    _ textField: UITextField) {
    if let text = textField.text, let number = numberFormatter.number(from: text) {
      fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
    } else {
      fahrenheitValue = nil
    }
  }
  
  
  
  
  
  var fahrenheitValue: Measurement<UnitTemperature>? {
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
  
  
  func updateCelsiusLabel() {
    if let celsiusValue1 = celsiusValue {
      valueCelsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue1.value))
    } else {
      valueCelsiusLabel.text = "???"
    }
  }
  
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()
  
  
  
  
  func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    let currentLocale = Locale.current
    let decimalSeparator = currentLocale.decimalSeparator ?? "."
    let existingTextHasDecimalSeparator
      = textField.text?.range(of: decimalSeparator)
    let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
    
    
    guard let text = textField.text else { return false }
    return  hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: text,
                                                                  string2: string)}
  
  
  func hasConcatenationOnlyDecimalNumbersAndDecimalSeparator(string1: String,
                                                             string2: String)
  -> Bool {
    print("\n\n \(#function)")
    print(" - string1:  \(string1)")
    print(" - string2:  \(string2)")
    // Check only zero or one decimal separator
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
    print("string2HasDecimalSeparator:\(String(describing:string2HasDecimalSeparator))")
    if string1HasDecimalSeparator != nil,
       string2HasDecimalSeparator != nil {
      return true
    } else {
      return false
    }
  }
}




